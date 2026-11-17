#!/usr/bin/env python3
"""Print a learner's workbook so the tutor can check it: one line per filled cell,
showing what was typed (number or formula) and what it shows.

Usage: python read_sheet.py <file.xlsx> [--tab "Rung 1"]

Output lines look like:  B16* | typed: =B14-B15 | shows: 117000
(* = a yellow "your turn" cell). A typed number in a yellow cell means it was hard-coded.
"""
import argparse
import os
import shutil
import sys
import tempfile

from openpyxl import load_workbook

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from recalc import recalc  # noqa: E402


def is_yellow(cell):
    try:
        rgb = str(cell.fill.fgColor.rgb or "").upper()
    except Exception:
        return False
    return cell.fill.fill_type == "solid" and rgb.endswith("FFF2CC")


def shown(v):
    if v is None:
        return "(no value)"
    if isinstance(v, float):
        return f"{v:,.4f}".rstrip("0").rstrip(".")
    if isinstance(v, int):
        return f"{v:,}"
    return str(v)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("file")
    ap.add_argument("--tab", help="only this tab")
    args = ap.parse_args()

    formulas = load_workbook(args.file)
    values = load_workbook(args.file, data_only=True)

    missing = any(
        isinstance(c.value, str) and c.value.startswith("=") and values[ws.title][c.coordinate].value is None
        for ws in formulas.worksheets for row in ws.iter_rows() for c in row)
    if missing:
        tmp = os.path.join(tempfile.mkdtemp(), "recalc.xlsx")
        shutil.copy(args.file, tmp)
        if recalc(tmp):
            values = load_workbook(tmp, data_only=True)

    for ws in formulas.worksheets:
        if args.tab and ws.title.lower() != args.tab.lower():
            continue
        print(f"=== TAB: {ws.title}")
        for row in ws.iter_rows():
            for c in row:
                if c.value is None or (isinstance(c.value, str) and c.value.strip() == "" and not is_yellow(c)):
                    continue
                v = values[ws.title][c.coordinate].value
                star = "*" if is_yellow(c) else ""
                print(f"{c.coordinate}{star} | typed: {c.value} | shows: {shown(v)}")
        # Yellow cells left empty
        empty = [c.coordinate for row in ws.iter_rows() for c in row if is_yellow(c) and c.value in (None, "")]
        if empty:
            print(f"(yellow cells still empty: {', '.join(empty)})")
    print("(* = yellow cell)")


if __name__ == "__main__":
    main()
