%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "expressive-marks, editorial-annotations"

%% Translation of GIT committish: 1d589aa04c20d7711bf662618adbdd6d445db29d
  texidoces = "
Se puede cambiar el aspecto de las ligaduras de expresión de
continuas a punteadas o intermitentes.

"
  doctitlees = "Modificar el aspecto continuo de una ligadura de expresión a punteado o intermitente"

  texidoc = "
The appearance of slurs may be changed from solid to dotted or dashed.

"
  doctitle = "Changing the appearance of a slur from solid to dotted or dashed"
} % begin verbatim

\relative c' {
  c4( d e c)
  \slurDotted
  c4( d e c)
  \slurSolid
  c4( d e c)
  \slurDashed
  c4( d e c)
  \slurSolid
  c4( d e c)
}


