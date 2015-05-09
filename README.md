
CheckDigit
==========

The CheckDigit package provides a set of functions to calculate check digits
according to various algorithms and to verify whether a value ends in a valid
check digit.

The following algorithms have been implemented:

- The **Verhoeff** algorithm is appropriate for numerical data and detects
  all single-digit substitutions (x to y) and adjacent digit transpositions (xy
  to yx). In addition, the Verhoeff check digit can detect most twin errors (xx
  to yy), jump twin errors (xyx to zyz), jump transpositions (xyz to zyx), and
  phonetic errors ('sixty' to 'sixteen').

- The **Damm** algorithm is similar to the Verhoeff algorithm. It too will
  detect all occurrences of the two most frequently appearing types of
  transcription errors, namely altering one single digit, and transposing
  two adjacent digits (including the transposition of the trailing check
  digit itself and the digit preceding it). But the Damm algorithm has the
  benefit that it makes do without the dedicatedly constructed permutations
  and its position specific powers being inherent in the Verhoeff scheme. 

References
----------

Verhoeff, J. "Error Detecting Decimal Codes", Mathematical Centre Tract 29, The
Mathematical Centre, Amsterdam, 1969.

Damm, H. Michael (2004). Total anti-symmetrische Quasigruppen (Dr. rer. nat.)
(in German). Philipps-Universität Marburg. urn:nbn:de:hebis:04-z2004-05162.
http://archiv.ub.uni-marburg.de/diss/z2004/0516/pdf/dhmd.pdf
