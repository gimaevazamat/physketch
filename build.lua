-- Build configuration for physketch (l3build)
--   l3build doc      -- typeset the documentation
--   l3build check    -- run the regression tests
--   l3build tag      -- update version and date in the sources
--   l3build ctan     -- build physketch-ctan.zip for upload

module = "physketch"

sourcefiles  = {"physketch*.sty"}
installfiles = {"physketch*.sty"}
typesetfiles = {"physketch-doc.tex"}
docfiles     = {"physketch-doc.tex"}
textfiles    = {"README.md"}
ctanreadme   = "README.md"

checkengines = {"pdftex"}
checkruns    = 1
typesetruns  = 3

tagfiles = {"physketch*.sty", "physketch-doc.tex", "README.md"}

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
  elseif file == "physketch-doc.tex" then
    content = content:gsub(
      "\\date{v[%d%.]+ \\quad %d%d%d%d/%d%d/%d%d}",
      "\\date{v" .. version .. " \\quad " .. ldate .. "}")
  elseif file == "README.md" then
    content = content:gsub(
      "Version [%d%.]+, %d%d%d%d%-%d%d%-%d%d",
      "Version " .. version .. ", " .. tagdate)
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
  description = [[The package provides TikZ styles, pictures and commands
for the drawings found in physics problems: fixed surfaces and walls,
mirrors and screens, liquids and glass, springs, pulleys and weights,
light sources, lenses, screens, current sources and meters, and
engineering-style distances and angles.]],
  topic       = {"pgf-tikz", "physics", "graphics-in-tex"},
  ctanPath    = "/macros/latex/contrib/physketch",
  repository  = "https://github.com/gimaevazamat/physketch",
  bugtracker  = "https://github.com/gimaevazamat/physketch/issues",
  update      = false,
}
