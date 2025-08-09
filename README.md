# Resume
Two LaTeX resume versions with automatic build and publication via **GitHub Actions** and **GitHub Pages**, using a **static HTML site** for presentation.

[![Pipeline Status](https://img.shields.io/github/actions/workflow/status/domingosfelipe/resume/latex-pages.yml?label=pipeline)](https://github.com/domingosfelipe/resume/actions/workflows/latex-pages.yml)
[![Artifact Attested](https://img.shields.io/badge/artifacts-attested-brightgreen?logo=github)](https://github.com/domingosfelipe/resume#artifact-attestation)

---
## Live PDFs
- **EN-US**: https://domingosfelipe.github.io/resume/FelipeDomingos_EN-US.pdf  
- **PT-BR**: https://domingosfelipe.github.io/resume/FelipeDomingos_PT-BR.pdf  

> [!NOTE]
> These links update automatically on every push to `main`.  
> The static HTML page (`index.html`) is also updated with the **last build date** and **absolute OG image URLs**.

---

## Project Structure
```text
.
├── FelipeDomingos_EN-US.tex        # English resume
├── FelipeDomingos_PT-BR.tex        # Portuguese resume
├── custom.cls                      # Custom LaTeX class
├── index.html                      # Static site homepage (can be in site/index.html)
├── og.png                          # Thumbnail for EN-US resume
├── og-pt.png                       # Thumbnail for PT-BR resume
├── README.md
└── .github/
    └── workflows/
        └── latex-pages.yml         # CI workflow (build + Pages deploy + HTML injection)
```

## How It Works (CI/CD)
1. A push to main triggers the workflow.
2. xu-cheng/latex-action@v3 compiles both .tex files into PDFs.
3. Thumbnails are generated from the first page of each PDF (og.png, og-pt.png).
4. A static index.html is copied into the public/ folder.
5. The workflow injects:
  - The last build date into placeholders `(<!--DATE--> or __BUILD_DATE__)`.
  - Absolute URLs for OG and Twitter image tags.
6. Everything in public/ is deployed to GitHub Pages.

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

> [!IMPORTANT]
> For documents with Unicode fonts or accents, consider XeLaTeX:
> latexmk -xelatex FelipeDomingos_PT-BR.tex

## Artifact Attestation
The generated PDFs are automatically attested using [GitHub Artifact Attestations](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions#artifact-attestations).

This means each PDF has a verifiable **SLSA provenance** proving it was built by this repository's GitHub Actions workflow.

### How to verify
You can verify the attestation locally with the [GitHub CLI](https://cli.github.com/) (v2.51+):
```bash
# Verify the EN-US resume
gh attestation verify \
  --repo domingosfelipe/resume \
  --subject-path FelipeDomingos_EN-US.pdf
# Verify the PT-BR resume
gh attestation verify \
  --repo domingosfelipe/resume \
  --subject-path FelipeDomingos_PT-BR.pdf
```  

## Troubleshooting
- 404 on actions/deploy-pages@v4
  - Ensure Settings -> Pages -> Source = GitHub Actions and Workflow permissions = Read and write.
- "File cannot be found" during compile
  - Verify exact filenames (case-sensitive) and that they are at the repository root.
  - List multiple `root_file` entries one per line in YAML:
    ```yaml
    with:
      root_file: |
        FelipeDomingos_EN-US.tex
        FelipeDomingos_PT-BR.tex
    ```
- Missing images/bibliography
  - Verify required assets (.png, .jpg, .bib, .cls) and ensure paths in .tex match your repo layout.