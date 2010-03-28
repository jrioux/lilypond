%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "expressive-marks"

%% Translation of GIT committish: 1d589aa04c20d7711bf662618adbdd6d445db29d
  texidoces = "
Los cambios de dinámica con estilo de texto (como cresc. y dim.)
se imprimen con una línea intermitente que muestra su alcance.
Esta línea se puede suprimir de la siguiente manera:

"
  doctitlees = "Ocultar la línea de extensión de las expresiones textuales de dinámica"


%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
texidocde = "
Dynamik-Texte (wie cresc. und dim.) werden mit einer gestrichelten Linie
gesetzt, die ihre Dauer anzeigt.  Diese Linie kann auf foldenge Weise
unterdrückt werden:

"
  doctitlede = "Crescendo-Linien von Dynamik-Texten unterdrücken"

%% Translation of GIT committish: 217cd2b9de6e783f2a5c8a42be9c70a82195ad20
  texidocfr = "
Les crescendos et decrescendos indiqués textuellement -- tels que
@emph{cresc.} ou @emph{dim.} -- sont suivis de pointillés qui montrent
leur étendue.  On peut empêcher l'impression de ces pointillés avec :

"
  doctitlefr = "Masquage de l'extension des nuances textuelles"


  texidoc = "
Text style dynamic changes (such as cresc. and dim.) are printed with a
dashed line showing their extent.  This line can be suppressed in the
following way:

"
  doctitle = "Hiding the extender line for text dynamics"
} % begin verbatim

\relative c'' {
  \override DynamicTextSpanner #'dash-period = #-1.0
  \crescTextCresc
  c1\< | d | b | c\!
}

