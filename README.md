# UBC Doctoral Dissertation Template

A LaTeX template for a University of British Columbia doctoral
dissertation, built on the public-domain
[`ubcdiss.cls`](https://github.com/briandealwis/ubcdiss) class by
Brian de Alwis. It follows the
[GPS structure and formatting requirements](https://www.grad.ubc.ca/current-students/dissertation-thesis-preparation/structure-ubc-theses-dissertations)
and is organized for a **manuscript-based dissertation**, where each
research chapter corresponds to a published or submitted paper.

## Quick start

```sh
./compile.sh          # runs pdflatex + bibtex and opens main.pdf
```

Requires a reasonably complete TeX distribution (TeX Live / MacTeX /
MiKTeX). The template compiles out of the box; `main.pdf` is the
result.

Then:

1. Edit the **Document meta-data** section of `main.tex`: title,
   author, department, submission date, and examining committee.
   Update `\hypersetup{}` to match.
2. Replace the placeholder text in the preliminary pages:
   `abstract.tex`, `lay-summary.tex`, `preface.tex`,
   `acknowledgements.tex`, `dedication.tex`.
3. Write your chapters (see below) and replace `main.bib` with your
   own references.

## Layout

```
main.tex               Document preamble, meta-data, and structure
ubcdiss.cls            UBC dissertation class (public domain)
macros.tex             Shared macros: \eg, \ie, RQ environments, comment system, ...
main.bib               Bibliography (sample entries — replace)
compile.sh             Build script

abstract.tex           Preliminary pages (each with the relevant
lay-summary.tex        GPS requirement noted in a comment)
preface.tex
acknowledgements.tex
dedication.tex
glossary.tex           Optional acronym glossary (commented out)

introduction.tex       Chapter 1
chapter-example-1/     A research chapter split into per-section files
  chapter.tex            (pulled in with \subimport so figure paths
  introduction.tex        resolve relative to the chapter directory)
  approach.tex
  evaluation.tex
  related-work.tex
  conclusion.tex
  figures/
chapter-example-2/     A single-file research chapter
  chapter.tex
discussion.tex         Concluding chapter
appendix.tex           Appendices
```

## Adding a chapter

Copy `chapter-example-1/` (or `chapter-example-2/` for a single-file
chapter), rename it, update the `\chapter{}` title and `\label{}`,
change the directory name inside the `\subimport{...}` lines in
`chapter.tex` to the new directory, and add a matching
`\input{your-chapter/chapter}` line in `main.tex`.

Two conventions keep multi-chapter documents manageable:

- **Shared macros live in `macros.tex`.** Macros used by more than
  one chapter (tool names, formatting commands) go there; defining
  them in two chapter files causes "already defined" errors.
- **Sections are included with `\subimport`,** not `\input`, so that
  `\includegraphics{figures/...}` paths inside a chapter resolve
  against that chapter's directory.

## GPS submission notes

- `main.tex` uses `\documentclass[gpscopy,onehalfspacing,11pt]{ubcdiss}`
  — the exact formatting GPS requires for submission. For personal
  copies, switch to the commented-out `balanced,twoside` variant.
- The abstract must not exceed **350 words**; the lay summary
  (mandatory since May 2017) must not exceed **150 words**.
- The preface must state your contribution relative to collaborators,
  list the publications each chapter is based on, disclose any use of
  generative AI tools, and cite research ethics certificate numbers
  if applicable.
- Research Ethics Board Certificates of Approval, if required, go in
  an appendix.

## Credits

- `ubcdiss.cls` by Brian de Alwis (public domain).
- Template structure distilled from a real UBC ECE doctoral
  dissertation.
