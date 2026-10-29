# physketch

[English](README.md) | **Русский**

Стили, фигуры и команды TikZ для физических рисунков.

На CTAN: <https://ctan.org/pkg/physketch>

Версия 0.1.0, 2026-10-20

`physketch` — пакет LaTeX для рисунков к физическим задачам. В нём есть:

- неподвижные поверхности, тела и поршни, пружины, блоки, рейки с равными
  участками и точки опоры;
- силы, стрелки вращения и векторы, перпендикулярные плоскости рисунка;
- жидкости, газ, лёд и стекло;
- источники света, лучи, линзы, экраны и зеркала;
- источники тока и измерительные приборы для схем;
- выносные размеры и углы в инженерном стиле.

Пакет также задаёт единый стиль оформления: толщины линий, зазоры и вид
наконечников стрелок.

## Пример

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

## Части пакета

Части можно подключать по отдельности; каждая подключает `physketch.general`.

| Часть | Что в ней |
|---|---|
| `physketch` | все части ниже |
| `physketch.general` | цвета, материалы, поверхности, силы, векторы, размеры и углы |
| `physketch.mechanics` | тела, пружины, поршни, блоки, рейки, точки опоры, гирьки |
| `physketch.optics` | лучи, источники света, линзы, экраны, зеркала |
| `physketch.circuits` | `circuitikz` с настройками пакета, источники тока, приборы |

Старые рисунки, сделанные с `design.sty` (предшественником пакета),
компилируются с отдельным файлом `physketch.legacy`; его нельзя подключать
вместе с остальными частями.

## Документация

Полная документация — `physketch-doc.pdf` (на английском) и
`physketch-doc-ru.pdf` (на русском); обе собираются из исходников `.tex`
командой `l3build doc`.

## Требования

TikZ/PGF 3.1.5 или новее (для `patterns.meta`), LaTeX 2020-10-01 или новее.
Для `physketch.circuits` нужен `circuitikz`.

## Установка

`physketch` входит в TeX Live:

```bash
tlmgr install physketch
```

Чтобы поставить текущую версию с GitHub (macOS, Linux):

```bash
d="$(kpsewhich -var-value TEXMFHOME)/tex/latex/physketch"; t=$(mktemp -d); curl -fsSL https://github.com/gimaevazamat/physketch/archive/refs/heads/main.tar.gz | tar -xz -C "$t" && mkdir -p "$d" && cp "$t"/physketch-*/physketch*.sty "$d"/ && rm -rf "$t" && echo "physketch installed to $d"
```

Такая копия важнее версии из TeX Live; удалить её можно командой
`rm -rf "$(kpsewhich -var-value TEXMFHOME)/tex/latex/physketch"`.
Можно и просто положить все файлы `physketch*.sty` рядом со своим документом.

## Лицензия

Copyright (C) 2024–2026 Azamat Gimaev. Распространяется на условиях
[LaTeX Project Public License](https://www.latex-project.org/lppl.txt)
версии 1.3c или более поздней.
