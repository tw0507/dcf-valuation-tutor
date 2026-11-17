#!/usr/bin/env python3
"""Recalculate every formula in an .xlsx with LibreOffice (headless) and save the results in place,
so viewers that don't calculate formulas still show values.

Usage: python recalc.py <file.xlsx>
Returns exit code 0 on success, 1 if LibreOffice isn't available or the run failed.
"""
import os
import pathlib
import shutil
import subprocess
import sys

MODULE = """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE script:module PUBLIC "-//OpenOffice.org//DTD OfficeDocument 1.0//EN" "module.dtd">
<script:module xmlns:script="http://openoffice.org/2000/script" script:name="Module1" script:language="StarBasic">
Sub RecalculateAndSave
  ThisComponent.calculateAll()
  ThisComponent.store()
  ThisComponent.close(True)
End Sub
</script:module>
"""

LIBRARY = """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE library:library PUBLIC "-//OpenOffice.org//DTD OfficeDocument 1.0//EN" "library.dtd">
<library:library xmlns:library="http://openoffice.org/2000/library" library:name="Standard" library:readonly="false" library:passwordprotected="false">
 <library:element library:name="Module1"/>
</library:library>
"""


def _soffice():
    for name in ("soffice", "libreoffice"):
        path = shutil.which(name)
        if path:
            return path
    return None


def _install_macro(binary):
    std = pathlib.Path.home() / ".config" / "libreoffice" / "4" / "user" / "basic" / "Standard"
    if not std.exists():
        subprocess.run([binary, "--headless", "--terminate_after_init"], capture_output=True, timeout=90)
    std.mkdir(parents=True, exist_ok=True)
    (std / "Module1.xba").write_text(MODULE, encoding="utf-8")
    xlb = std / "script.xlb"
    if not xlb.exists() or "Module1" not in xlb.read_text(encoding="utf-8"):
        xlb.write_text(LIBRARY, encoding="utf-8")


def recalc(path):
    binary = _soffice()
    if not binary:
        return False
    try:
        _install_macro(binary)
        run = subprocess.run(
            [binary, "--headless", "--norestore",
             "vnd.sun.star.script:Standard.Module1.RecalculateAndSave?language=Basic&location=application",
             os.path.abspath(path)],
            capture_output=True, timeout=180)
        return run.returncode == 0
    except Exception:
        return False


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    sys.exit(0 if recalc(sys.argv[1]) else 1)
