# Resume
Two LaTeX resume versions with automatic build and publication via **GitHub Actions** and **GitHub Pages**.

[![Build LaTeX & Deploy PDF to Pages](https://github.com/domingosfelipe/resume/actions/workflows/latex-pages.yml/badge.svg)](https://github.com/domingosfelipe/resume/actions/workflows/latex-pages.yml)

---
## Live PDFs
- **EN-US**: https://domingosfelipe.github.io/resume/FelipeDomingos_EN-US.pdf  
- **PT-BR**: https://domingosfelipe.github.io/resume/FelipeDomingos_PT-BR.pdf  

> These links update automatically on every push to `main`.

---

## Project Structure
```text
.
├── FelipeDomingos_EN-US.tex        # English resume
├── FelipeDomingos_PT-BR.tex        # Portuguese resume
├── custom.cls                      # Custom LaTeX class
├── README.md
└── .github/
    └── workflows/
        └── latex-pages.yml         # CI workflow (build + Pages deploy)
```

## How It Works (CI/CD)
1.	A push to main triggers the workflow.
2.	xu-cheng/latex-action@v3 compiles both .tex files with latexmk.
3.	The PDFs are placed in public/ and published to GitHub Pages.

## Build Locally
Make sure you have a LaTeX distribution (TeX Live/MiKTeX) and latexmk available.
```shell
# English resume
latexmk -pdf FelipeDomingos_EN-US.tex
# Portuguese resume
latexmk -pdf FelipeDomingos_PT-BR.tex
```

If you prefer plain pdflatex:
```shell
# English resume
pdflatex FelipeDomingos_EN-US.tex
# Portuguese resume
pdflatex FelipeDomingos_PT-BR.tex
```

> [!NOTE]
> If your documents use Unicode fonts or languages with accents, consider XeLaTeX: latexmk -xelatex FelipeDomingos_PT-BR.tex

## Troubleshooting
- 404 on actions/deploy-pages@v4
  - Ensure Settings → Pages → Source = GitHub Actions and Workflow permissions = Read and write.
- "File cannot be found" during compile
  - Verify exact filenames (case-sensitive) and that they are at the repository root.
  - List multiple root files one per line:
    ```yaml
    with:
      root_file: |
        FelipeDomingos_EN-US.tex
        FelipeDomingos_PT-BR.tex
    ```
- Missing images/bibliography
  - Verify required assets (.png, .jpg, .bib, .cls) and ensure paths in .tex match your repo layout.