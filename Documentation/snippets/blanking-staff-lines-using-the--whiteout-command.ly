%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "editorial-annotations, text"

%% Translation of GIT committish: 1d589aa04c20d7711bf662618adbdd6d445db29d
  texidoces = "
La instrucción @code{\\whiteout} intercala un rectángulo blanco
debajo de un elemento de marcado.  Este rectángulo blanco no tapa
a ningún otro objeto gráfico, puesto que las líneas del pentagrama
están en una capa inferior a la de la mayor parte de los otros
objetos.

"
  doctitlees = "Poner en blanco las líneas del pentagrama utilizando la instrucción \\whiteout"

  texidoc = "
The @code{\\whiteout} command underlays a markup with a white box.
Since staff lines are in a lower layer than most other grobs, this
white box will not overlap any other grob.

"
  doctitle = "Blanking staff lines using the \\whiteout command"
} % begin verbatim

\layout { ragged-right = ##f }
\relative c' {
  \override TextScript #'extra-offset = #'(2 . 4)
  c2-\markup { \whiteout \pad-markup #0.5 "middle C" } c
}

