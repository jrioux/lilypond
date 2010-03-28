%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "expressive-marks"

%% Translation of GIT committish: 1d589aa04c20d7711bf662618adbdd6d445db29d
  texidoces = "
Si los reguladores son demasiado cortos, se pueden alargar
modificando la propiedad @code{minimum-length} del objeto
@code{Hairpin}.

"
  doctitlees = "Ajustar la longitud mínima de los reguladores"


%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
texidocde = "
Wenn Crescendo-Klammern zu kurz sind, können sie verlängert werden, indem
die @code{minimum-length}-Eigenschaft des @code{Hairpin}-Objektes
verändert wird.

"
  doctitlede = "Die Mindestlänge von Crescendo-Klammern bestimmen"

%% Translation of GIT committish: 217cd2b9de6e783f2a5c8a42be9c70a82195ad20
  texidocfr = "
Si un soufflet est trop court, il suffit d'ajuster la propriété 
@code{minimum-length} de l'objet @code{Hairpin} pour l'allonger.

"
  doctitlefr = "Ajustement de la longueur d'un soufflet"


  texidoc = "
If hairpins are too short, they can be lengthened by modifying the
@code{minimum-length} property of the @code{Hairpin} object.

"
  doctitle = "Setting the minimum length of hairpins"
} % begin verbatim

\relative c'' {
  c4\< c\! d\> e\!
  \override Hairpin #'minimum-length = #5
  << f1 { s4 s\< s\> s\! } >>
}

