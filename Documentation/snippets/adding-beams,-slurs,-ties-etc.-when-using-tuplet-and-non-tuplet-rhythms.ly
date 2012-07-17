%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.2"

\header {
  lsrtags = "expressive-marks, rhythms"

  texidoc = "
LilyPond syntax can involve many unusual placements for parentheses,
brackets etc., which might sometimes have to be interleaved. For
example, when entering a manual beam, the left square bracket has to be
placed after the starting note and its duration, not before. Similarly,
the right square bracket should directly follow the note which is to be
at the end of the requested beaming, even if this note happens to be
inside a tuplet section. This snippet demonstrates how to combine
manual beaming, manual slurs, ties and phrasing slurs with tuplet
sections (enclosed within curly braces).

"
  doctitle = "Adding beams slurs ties etc. when using tuplet and non-tuplet rhythms"
} % begin verbatim


{
  r16[ g16 \times 2/3 { r16 e'8] }
  g16( a \times 2/3 { b d e') }
  g8[( a \times 2/3 { b d') e'] ~ }
  \time 2/4
  \times 4/5 { e'32\( a b d' e' } a'4.\)
}
