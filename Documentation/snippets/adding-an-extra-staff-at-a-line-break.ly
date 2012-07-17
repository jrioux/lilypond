%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.2"

\header {
  lsrtags = "breaks, staff-notation, workaround, contexts-and-engravers"

  texidoc = "
When adding a new staff at a line break, some extra space is
unfortunately added at the end of the line before the break (to fit in
a key signature change, which  will never be printed anyway).  The
workaround is to add a setting of
@code{Staff.explicitKeySignatureVisibility} as is shown in the example.


"
  doctitle = "Adding an extra staff at a line break"
} % begin verbatim


\score {
  \new StaffGroup \relative c'' {
    \new Staff
    \key f \major
    c1 c^"Unwanted extra space" \break
    << { c1 | c }
       \new Staff {
         \key f \major
         \once \override Staff.TimeSignature #'stencil = ##f
         c1 | c
       }
    >>
    c1 | c^"Fixed here" \break
    << { c1 | c }
       \new Staff {
         \once \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
         \key f \major
         \once \override Staff.TimeSignature #'stencil = ##f
         c1 | c
       }
    >>
  }
}
