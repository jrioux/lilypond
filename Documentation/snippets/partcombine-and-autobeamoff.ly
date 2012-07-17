%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.2"

\header {
  lsrtags = "rhythms"

  texidoc = "
The function of @code{\\autoBeamOff} when used with
@code{\\partcombine} can be difficult to understand.

It may be preferable to use


@code{\\set Staff.autoBeaming = ##f}


instead, to ensure that autobeaming will be turned off for the entire
staff.


@code{\\partcombine} apparently works with 3 voices -- stem up single,
stem down single, stem up combined.


An @code{\\autoBeamOff} call in the first argument to partcombine will
apply to the voice that is active at the time the call is processed,
either stem up single or stem up combined. An @code{\\autoBeamOff} call
in the second argument will apply to the voice that is stem down single.


In order to use @code{\\autoBeamOff} to stop all autobeaming when used
with @code{\\partcombine}, it will be necessary to use three calls to
@code{\\autoBeamOff}.




"
  doctitle = "Partcombine and autoBeamOff"
} % begin verbatim


{
  %\set Staff.autoBeaming = ##f % turns off all autobeaming
  \partcombine
  {
    \autoBeamOff % applies to split up stems
    \repeat unfold 4 a'16
    %\autoBeamOff % applies to combined up stems
    \repeat unfold 4 a'8
    \repeat unfold 4 a'16
  }
  {
    \autoBeamOff % applies to down stems
    \repeat unfold 4 f'8
    \repeat unfold 8 f'16 |
  }
}
