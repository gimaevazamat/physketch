# physketch

**English** | [Русский](README.ru.md)

TikZ styles, pictures and commands for physics drawings.

On CTAN: <https://ctan.org/pkg/physketch>

Version 0.1.0, 2026-10-20

`physketch` is a LaTeX package for the drawings found in physics problems.
It provides:

- fixed surfaces, bodies and pistons, springs, pulleys, rods divided into
  equal parts and fulcrums;
- forces, rotation arrows and vectors perpendicular to the drawing plane;
- liquids, gas, ice and glass;
- light sources, rays, lenses, screens and mirrors;
- current sources and meters for circuits;
- engineering-style distances and angles.

It also fixes a consistent house style for line widths, gaps and arrow tips.

## Example

```latex
\usepackage{physketch}
...
\begin{tikzpicture}
  \draw[surface] (0,0) -- (4,0);
  \draw[body, lifted] (1,0) rectangle ++(1,0.8);
  \draw[force] (1.5,0.4) -- ++(1.2,0) node[above] {$\vec F$};
  \dist[l=$a$] (1,0.8) -- (2,0.8);
\end{tikzpicture}
```

## Parts

The package consists of parts that can be loaded separately; every part
loads `physketch.general`.

| Part | Contents |
|---|---|
| `physketch` | all the parts below |
| `physketch.general` | colours, materials, surfaces, forces, vectors, distances and angles |
| `physketch.mechanics` | bodies, springs, pistons, pulleys, rods, fulcrums, weights |
| `physketch.optics` | rays, light sources, lenses, screens, mirrors |
| `physketch.circuits` | `circuitikz` with the house settings, current sources, meters |

Old drawings made with `design.sty`, the predecessor of the package, compile
with the separate file `physketch.legacy`, which cannot be combined with the
other parts.

## Documentation

The full documentation is `physketch-doc.pdf`; it is built from
`physketch-doc.tex` with `l3build doc`.

## Requirements

TikZ/PGF 3.1.5 or later (for `patterns.meta`), LaTeX 2020-10-01 or later.
`physketch.circuits` needs `circuitikz`.

## Installation

`physketch` is part of TeX Live:

```bash
tlmgr install physketch
```

To install the current version from GitHub instead (macOS, Linux):

```bash
d="$(kpsewhich -var-value TEXMFHOME)/tex/latex/physketch"; t=$(mktemp -d); curl -fsSL https://github.com/gimaevazamat/physketch/archive/refs/heads/main.tar.gz | tar -xz -C "$t" && mkdir -p "$d" && cp "$t"/physketch-*/physketch*.sty "$d"/ && rm -rf "$t" && echo "physketch installed to $d"
```

This copy takes precedence over the one from TeX Live; remove it with
`rm -rf "$(kpsewhich -var-value TEXMFHOME)/tex/latex/physketch"`.
You can also simply put all `physketch*.sty` files next to your document.

## License

Copyright (C) 2024–2026 Azamat Gimaev. Distributed under the
[LaTeX Project Public License](https://www.latex-project.org/lppl.txt),
version 1.3c or later.
