#!/bin/bash
#
# Thesis Compilation Script
#
# NOTE: If you get "Permission denied" after pulling from Overleaf:
#   Overleaf doesn't preserve executable permissions in Git.
#   Fix: chmod +x compile.sh
#

echo "Compiling thesis..."

# Clean auxiliary files
rm -f *.aux *.log *.blg *.brf *.toc *.lof *.lot *.out main.bbl main.blg

# Compile (continue even if there are LaTeX errors)
echo "[1/4] First pdflatex run..."
pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1 || true

echo "[2/4] Running bibtex..."
bibtex main > /dev/null 2>&1 || true

echo "[3/4] Second pdflatex run..."
pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1 || true

echo "[4/4] Third pdflatex run..."
pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1 || true

# Check results
if [ -f main.pdf ]; then
    PAGES=$(pdfinfo main.pdf 2>/dev/null | grep Pages | awk '{print $2}')
    SIZE=$(ls -lh main.pdf | awk '{print $5}')
    echo "✅ Success! PDF generated: ${PAGES} pages, ${SIZE}"
    # Open the PDF (macOS); harmless no-op elsewhere
    open main.pdf 2>/dev/null || true
else
    echo "❌ ERROR: main.pdf was not generated!"
    echo "Check main.log for errors"
    exit 1
fi
