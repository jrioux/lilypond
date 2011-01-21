%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.12.2"

\header {
  lsrtags = "pitches, staff-notation"

%% Translation of GIT committish: fa19277d20f8ab0397c560eb0e7b814bd804ecec
  texidoces = "
Los pasajes citados tienen en cuenta la transposición de la fuente
tanto como la del destino.  En este ejemplo, todos los
instrumentos interpreta una nota con el sonido del Do central; el
destino de un instrumento transpositor en Fa.  La parte de destino
se puede transponer utilizando @code{\\transpose}.  En este caso
se transportan todas las notas (incluidas las citadas).

"

doctitlees = "Citar otra voz con transposición"


%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Zitate berücksichtigen sowohl die Transposition der Quelle als auch
des Zielinstruments.  In diesem Beispiel spielen alle Instrumente
klingendes C, das Zielinstrument ist in F.  Die Noten für das
Zielinstrument können mit @code{\\transpose} transponiert werden,
in diesem Fall werden alle Noten (auch die zitierten) transponiert.

"
  doctitlede = "Eine Stimme mit Transposition zitieren"

%% Translation of GIT committish: 4ab2514496ac3d88a9f3121a76f890c97cedcf4e
  texidocfr = "
Les citations tiennent compte de la transposition, aussi bien celle de
l'instrument d'origine que celle de la partie où elle intervient.  Dans
l'exemple suivant, tous les instruments sont en tonalité de concert et
seront repris par un instrument en fa.  Le destinataire de la citation
peut à son tour transposer à l'aide de la commande @code{\\transpose}.
En pareil cas, toutes les hauteurs, y compris celle de la citation,
seront transposées.

"
  doctitlefr = "Citation d'une autre voix et transposition"


  texidoc = "
Quotations take into account the transposition of both source and
target.  In this example, all instruments play sounding middle C; the
target is an instrument in F.  The target part may be transposed using
@code{\\transpose}.  In this case, all the pitches (including the
quoted ones) are transposed.

"
  doctitle = "Quoting another voice with transposition"
} % begin verbatim

\addQuote clarinet {
  \transposition bes
  \repeat unfold 8 { d'16 d' d'8 }
}

\addQuote sax {
  \transposition es'
  \repeat unfold 16 { a8 }
}

quoteTest = {
  % french horn
  \transposition f
  g'4
  << \quoteDuring #"clarinet" { \skip 4 } s4^"clar." >>
  << \quoteDuring #"sax" { \skip 4 } s4^"sax." >>
  g'4
}

{
  \set Staff.instrumentName =
    \markup {
      \center-column { Horn \line { in F } }
    }
  \quoteTest
  \transpose c' d' << \quoteTest s4_"up a tone" >>
}
