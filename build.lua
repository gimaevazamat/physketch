-- Build configuration for physketch (l3build)
--   l3build doc      -- typeset the documentation
--   l3build check    -- run the regression tests
--   l3build tag      -- update version and date in the sources
--   l3build ctan     -- build physketch-ctan.zip for upload

module = "physketch"

sourcefiles  = {"physketch*.sty"}
installfiles = {"physketch*.sty"}
typesetfiles = {"physketch-doc.tex", "physketch-doc-ru.tex"}
docfiles     = {"physketch-doc.tex", "physketch-doc-ru.tex"}
textfiles    = {"README.md", "CHANGELOG.md"}
ctanreadme   = "README.md"

checkengines = {"pdftex"}
checkruns    = 1
typesetruns  = 3

tagfiles = {"physketch*.sty", "physketch-doc.tex", "physketch-doc-ru.tex", "README.md", "README.ru.md",
            "CHANGELOG.md"}

local function iso_to_latex(date)
  return (date:gsub("-", "/"))
end

function update_tag(file, content, tagname, tagdate)
  local version = tagname:gsub("^v", "")
  local ldate = iso_to_latex(tagdate)
  if file:match("%.sty$") then
    content = content:gsub(
      "%[%d%d%d%d/%d%d/%d%d v[%d%.]+ ",
      "[" .. ldate .. " v" .. version .. " ")
  elseif file:match("^physketch%-doc") then
    content = content:gsub(
      "\\date{v[%d%.]+ \\quad %d%d%d%d/%d%d/%d%d}",
      "\\date{v" .. version .. " \\quad " .. ldate .. "}")
  elseif file == "README.md" then
    content = content:gsub(
      "Version [%d%.]+, %d%d%d%d%-%d%d%-%d%d",
      "Version " .. version .. ", " .. tagdate)
  elseif file == "CHANGELOG.md" then
    -- move the unreleased changes under the new version
    content = content:gsub(
      "## %[Unreleased%]",
      "## [Unreleased]\n\n## [" .. version .. "] – " .. tagdate, 1)
  elseif file == "README.ru.md" then
    content = content:gsub(
      "Версия [%d%.]+, %d%d%d%d%-%d%d%-%d%d",
      "Версия " .. version .. ", " .. tagdate)
  end
  return content
end

uploadconfig = {
  pkg         = "physketch",
  version     = "0.1.0 2026-10-20",
  author      = "Azamat Gimaev",
  uploader    = "Azamat Gimaev",
  license     = "lppl1.3c",
  summary     = "TikZ styles and pictures for physics drawings",
  description = [[The package provides TikZ styles, pictures and commands for the drawings found in physics problems: fixed surfaces, bodies and pistons, springs, pulleys, rods and fulcrums, forces and rotation arrows, liquids and glass, light sources, lenses, screens and mirrors, current sources and meters, and engineering-style distances and angles. It also fixes a consistent house style for line widths, gaps and arrow tips.]],
  topic       = {"pgf-tikz", "physics", "graphics-in-tex"},
  ctanPath    = "/graphics/pgf/contrib/physketch",
  repository  = "https://github.com/gimaevazamat/physketch",
  bugtracker  = "https://github.com/gimaevazamat/physketch/issues",
  update      = true,
}
