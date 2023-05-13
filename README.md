# LaTeX In Docker

Inspired by Josh Finnie's blog post on [Using LaTeX Through Docker](https://www.joshfinnie.com/blog/latex-through-docker/).
Of note, the custom `.sty` file `aizancommons.sty` is placed at `/usr/share/texlive/texmf-dist/tex/latex`.

The `texlive` distribution used here is `texlive-full`, which covers all LaTeX packages.
The final container image size is 4.73 GB, of which it took roughly 8 minutes to build on a 4C/8T CPU (Ryzen 1400).


```bash
# build the container image
docker build -t latex .

# compile filename.tex
docker run --rm -v `pwd`:/tmp latex latexmk filename.tex

# clean
docker run --rm -v `pwd`:/tmp latex latexmk -C
```

To shorten the command above, use shell aliases.

```bash
# compile
alias texp="docker run --rm -v `pwd`:/tmp latex latexmk -quiet -bibtex -pdflatex=lualatex -f -pdf -view=none -interaction=nonstopmode"

# clean
alias texc="docker run --rm -v `pwd`:/tmp latex latexmk -C"
```

