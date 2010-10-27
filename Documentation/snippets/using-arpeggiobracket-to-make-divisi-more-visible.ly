%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.31"

\header {
%% Translation of GIT committish: 5160eccb26cee0bfd802d844233e4a8d795a1e94
  texidoces = "
El corchete de arpegios @code{arpeggioBracket} se puede usar para
indicar la división de voces cuando no hay plicas que puedan ofrecer
esta información. Se suele encontrar en la música coral.

"

  doctitlees = "Uso de arpeggioBracket para hacer más visible un divisi"


  lsrtags = "expressive-marks, vocal-music"

  texidoc = "
The @code{arpeggioBracket} can be used to indicate the division of
voices where there are no stems to provide the information. This is
often seen in choral music.

"
  doctitle = "Using arpeggioBracket to make divisi more visible"
} % begin verbatim

\include "english.ly"

\score {
  \relative c'' {
    \key a \major
    \time 2/2
    <<
      \new Voice = "upper"
      <<
        { \voiceOne \arpeggioBracket
          a2( b2
          <b d>1\arpeggio)
          <cs e>\arpeggio ~
          <cs e>4
        }
        \addlyrics { \lyricmode { A -- men. } }
      >>
      \new Voice = "lower"
      { \voiceTwo
        a1 ~
        a
        a ~
        a4 \bar "|."
      }
    >>
  }
  \layout { ragged-right = ##t }
}
