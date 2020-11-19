---
title: "LaTeX"
description: "Commonly used information in LaTeX."
sidebar: ture
weight: "15"
---

## Cheatsheets

- [List of symbols](/pdf/Mathsymbols_TEX_Cookbook.pdf)

## Standard packages

This is my default (more or less) :

~~~tex
\documentclass[a4paper,12pt]{report}
\usepackage{amsmath,amsfonts,amssymb,bm}
\usepackage{CTEX}
\usepackage{graphicx}
\usepackage{titlesec}
\usepackage{fancyhdr}
\usepackage{enumitem}
\usepackage{hyperref}
\usepackage{listings}
\usepackage{fontspec}
\usepackage{xcolor}
\usepackage{soul}
\usepackage{ulem}
\usepackage{float}
\usepackage{subfigure}
~~~

## Misc

### Document class

~~~tex
\documentclass[12pt, a4paper]{report}
~~~

- Classic classes: *article*, *report*, *book*.
- Default font size is *10pt*.
- Other cool options: *twocolumn*, *landscape*.

### Page size

Custom page/margins:

~~~tex
\usepackage[left=2cm,right=2cm,top=1.5cm,bottom=2.5cm]{geometry}
~~~

Or `margin=` to apply the same margin on each side.

### Font sizes

`\tiny`, `\scriptsize`, `\footnotesize`, `\small`, `\normalsize`, `\large`, `\Large`, `\LARGE`, `\huge`, `\Huge`.


### Languages and encoding

An accent was specified as `Pad\'e`.

### Links

I prefer the links to be colored rather than boxed, but with darker color than the default:

~~~tex
\usepackage{hyperref}
\usepackage{xcolor}
\hypersetup{
    colorlinks,
    linkcolor={red!70!black},
    citecolor={blue!40!black},
    urlcolor={magenta!80!black}
}
~~~

### Table of contents


Changing the title of the section created by `\tableofcontents`:

### Metadata

To specify the PDF's metadata (title, author, etc):

~~~tex
\usepackage[pdfauthor={AUTHOR},pdftitle={TITLE},pdfsubject={SUBJECT},pdfkeywords={KEYWORDS},pdfproducer={LaTeX},pdfcreator={pdflatex}]{hyperref}
~~~


## Figures

### Position

+ `[h]` means **h**ere.
+ `[t]` means at the **t**op of the page.
+ `[p]` means on its own **p**age.

I usually use `[ht]` for small/medium figures, and `[htp]` for large ones.

### Sub-figures

After adding `\usepackage{subcaption}`, use like this:

~~~tex
\begin{subfigure}[b]{.48\textwidth}
	\includegraphics{example.pdf}
	\caption{}
	\label{fig:example}
end{subfigure}
~~~

For more custom organization of the sub-figures, feel free to use `minipage` environment. To force a caption number/letter, use `\addtocounter{subfigure}{XX}`. For example, to have the second subfigure as a long vertical panel on the right and figure {\it a} and {\it c}, smaller on the left:


## Code blocks

The easiest is to use [Listings](https://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings) environment.


Then in the LaTeX document I setup the *lstlisting* environment with something like:

~~~tex
\setmonofont[Mapping={}]{Consolas}
\setsansfont{Consolas} 
\setmainfont{Georgia} 
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\lstset{ 
basicstyle=\footnotesize\ttfamily,
columns=fullflexible,
frame=tb,
framerule=1pt,
rulecolor=\color{gray!35},
backgroundcolor=\color{gray!5},
breaklines=true,
breakatwhitespace=true,
captionpos=t,
tabsize=4,
numbers=left,
commentstyle=\color{mygray},
escapeinside={\%*}{*)},
keywordstyle=\color{blue},
stringstyle=\color{mymauve}\ttfamily,
rulesepcolor=\color{red!20!green!20!blue!20},
}
~~~


