#!/usr/bin/env python3
"""Build a practice workbook (.xlsx) from the ```json sheet blocks in a lesson or check file.

Usage:
    python build_sheet.py <lesson-or-check.md> <out.xlsx> [--tabs "Worked Example,Rung 3"]

Each ```json block becomes one tab. Block format:
    {"tab": "Rung 1", "title": "...", "task": "...", "cols": 3, "rows": 23,
     "width": {"A": 260}, "cells": {"A1": {"v": "Revenue", "b": 1}, "B16": {"v": "", "ans": 1, "f": "pct"}}}

Styling follows banking convention: numbers typed in are blue, formulas are black,
"your turn" cells are yellow. "f" can be "pct", "x", "dec" or any Excel number format.
"""
import argparse
import datetime
import json
import os
import re
import sys

from openpyxl import Workbook
from openpyxl.styles import Alignment, Font, PatternFill
from openpyxl.utils import get_column_letter
from openpyxl.workbook.properties import CalcProperties

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from recalc import recalc  # noqa: E402

YELLOW = PatternFill("solid", fgColor="FFF2CC")
PALE_BLUE = PatternFill("solid", fgColor="DDEBF7")
STYLES = {  # "st" key (NVIDIA model): font colour, fill, bold
    "in": ("0000FF", "F2F2F2", False), "link": ("008000", None, False), "hdr": ("FFFFFF", "1F4E79", True),
    "sub": ("000000", "D9E1F2", True), "out": ("000000", "BDD7EE", True)}
FORMATS = {"pct": "0.0%", "x": '0.0"x"', "dec": "#,##0.00", "num": "#,##0"}
NUM_RE = re.compile(r"-?(\d+\.?\d*|\.\d+)([eE][-+]?\d+)?")
PCT_RE = re.compile(r"-?(\d+\.?\d*|\.\d+)%")


def parse_value(v):
    """Return (value, kind) where kind is formula / num / pct / text / None."""
    s = "" if v is None else str(v).strip()
    if s == "":
        return None, None
    if s.startswith("="):
        return s, "formula"
    t = s.replace(",", "")
    if PCT_RE.fullmatch(t):
        return float(t[:-1]) / 100, "pct"
    if NUM_RE.fullmatch(t):
        n = float(t)
        return (int(n) if n.is_integer() else n), "num"
    return s, "text"


def extract_blocks(md_path):
    with open(md_path, encoding="utf-8") as fh:
        text = fh.read()
    blocks = []
    for raw in re.findall(r"```json\s*\n(.*?)\n```", text, re.S):
        try:
            blocks.append(json.loads(raw))
        except json.JSONDecodeError as e:
            sys.exit(f"Bad JSON block in {md_path}: {e}")
    return blocks


def safe_tab(name, used):
    name = re.sub(r"[\[\]:*?/\\]", "-", name or "Sheet")[:31]
    base, i = name, 2
    while name in used:
        name = f"{base[:28]} {i}"
        i += 1
    used.add(name)
    return name


def add_tab(wb, block, used):
    ws = wb.create_sheet(safe_tab(block.get("tab") or block.get("title"), used))
    cols = int(block.get("cols", 6))
    for col, px in (block.get("width") or {}).items():
        ws.column_dimensions[col.upper()].width = round(float(px) / 7, 1)
    for ref, spec in (block.get("cells") or {}).items():
        cell = ws[ref.upper()]
        val, kind = parse_value(spec.get("v"))
        if kind == "text" and re.fullmatch(r"\d{4}-\d{2}-\d{2}", str(val)):
            val = datetime.date.fromisoformat(val)
            kind = "num"
        cell.value = val
        bold = bool(spec.get("b"))
        blue = kind in ("num", "pct")
        cell.font = Font(name="Calibri", size=11, bold=bold, color="0000FF" if blue else "000000")
        fmt = spec.get("f") or ("pct" if kind == "pct" else None)
        if fmt:
            cell.number_format = FORMATS.get(fmt, fmt)
        elif kind == "num" and isinstance(val, float):
            cell.number_format = "#,##0.00"
        elif kind in ("num", "formula") or spec.get("ans"):
            cell.number_format = "#,##0"
        if spec.get("ans"):
            cell.fill = YELLOW
        elif spec.get("inp"):
            cell.fill = PALE_BLUE
        st = STYLES.get(spec.get("st") or "")
        if st and not spec.get("ans"):
            color, fill, sbold = st
            cell.font = Font(name="Calibri", size=11, bold=bold or sbold, color=color)
            if fill:
                cell.fill = PatternFill("solid", fgColor=fill)
    # Title and task to the right of the grid, so they never shift cell addresses.
    note_col = get_column_letter(cols + 2)
    ws.column_dimensions[note_col].width = 60
    ws[f"{note_col}1"] = block.get("title", "")
    ws[f"{note_col}1"].font = Font(name="Calibri", size=12, bold=True)
    lines = (block.get("task") or "").split("\n")
    lines += ["", "Blue = number typed in · Black = formula · Yellow = your turn · Pale blue = type a figure from the filing"]
    for i, line in enumerate(lines, start=2):
        c = ws[f"{note_col}{i}"]
        c.value = line
        c.alignment = Alignment(wrap_text=True, vertical="top")
        c.font = Font(name="Calibri", size=11, italic=(i == len(lines) + 1), color="595959")
    return ws


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("source", help="lesson or check .md file containing ```json sheet blocks")
    ap.add_argument("out", help="output .xlsx path")
    ap.add_argument("--tabs", help="comma-separated tab names to include (default: all)")
    args = ap.parse_args()

    blocks = extract_blocks(args.source)
    if args.tabs:
        wanted = [t.strip().lower() for t in args.tabs.split(",")]
        blocks = [b for b in blocks if (b.get("tab") or "").lower() in wanted]
    if not blocks:
        sys.exit("No sheet blocks matched.")

    wb = Workbook()
    wb.remove(wb.active)
    used = set()
    for b in blocks:
        add_tab(wb, b, used)
    wb.calculation = CalcProperties(fullCalcOnLoad=True)
    wb.save(args.out)

    ok = recalc(args.out)
    print(f"Saved {args.out} with tabs: {', '.join(wb.sheetnames)}")
    print("Formula values filled in." if ok else "LibreOffice not found: values will calculate when the file is opened in Excel or Google Sheets.")


if __name__ == "__main__":
    main()
