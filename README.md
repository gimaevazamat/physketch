# physketch — TikZ styles and pictures for physics drawings

Version 0.1.0, 2026-10-20

`physketch` is a LaTeX package with TikZ styles, pictures and commands for
the drawings found in physics problems: fixed surfaces, bodies and pistons,
springs, pulleys, rods divided into equal parts and fulcrums, forces and
rotation arrows, liquids and glass, light sources, lenses, screens and
mirrors, current sources and meters, and engineering-style distances and
angles. It also fixes a consistent house style for line widths, gaps and
arrow tips.

```latex
\usepackage{physketch}
...
\begin{tikzpicture}
  \draw[surface] (0,0) -- (4,0);
  \draw[body, lifted] (1,0) rectangle ++(1,0.8);
  \dist[l=$a$] (1,0.8) -- (2,0.8);
\end{tikzpicture}
```

The package consists of parts that can be loaded separately:
`physketch.general`, `physketch.mechanics`, `physketch.optics`,
`physketch.circuits`; `\usepackage{physketch}` loads all of them.
Old drawings made with `design.sty`, the predecessor of the package, use the
separate file `physketch.legacy`, which cannot be combined with the others.

See `physketch-doc.pdf` for the full documentation.

## Requirements

TikZ/PGF 3.1.5 or later (for `patterns.meta`), LaTeX 2020-10-01 or later.
`physketch.circuits` needs `circuitikz`.

## Installation

Put all `physketch*.sty` files somewhere in your `TEXMFHOME`, for example
`~/texmf/tex/latex/physketch/`, or next to your document.

## Authors and license

Copyright (C) 2024–2026 Azamat Gimaev.

This work may be distributed and/or modified under the conditions of the
LaTeX Project Public License, either version 1.3c of this license or (at
your option) any later version. The latest version of this license is in
<https://www.latex-project.org/lppl.txt>.

This work has the LPPL maintenance status `maintained`. The Current
Maintainer of this work is Azamat Gimaev.

The work consists of the files `physketch*.sty` and `physketch-doc.tex`.

---

**По-русски.** `physketch` — пакет стилей и команд TikZ для рисунков к
физическим задачам. Он продолжает `design.sty`: старые рисунки
компилируются с отдельным файлом `physketch.legacy`.
