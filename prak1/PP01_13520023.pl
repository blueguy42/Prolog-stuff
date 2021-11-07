/*  Pra Praktikum 1 Logkom
    Ahmad Alfani Handoyo
    13520023 */


/* Bagian I */
/* Nomor 1 */
/* Deklarasi Fakta */
pria(karel).
pria(gabenewell).
pria(kinantan).
pria(nikolatesla).
pria(alanturing).
pria(abdi).
pria(richard).
pria(sherlockh).

wanita(adalovelace).
wanita(rakartini).
wanita(elsapataky).
wanita(jkrowling).
wanita(mariecurie).
wanita(tami).
wanita(lia).
wanita(masumisera).

usia(karel, 80).
usia(adalovelace, 75).
usia(rakartini, 70).
usia(gabenewell, 73).
usia(kinantan, 65).
usia(elsapataky, 64).
usia(nikolatesla, 52).
usia(alanturing, 48).
usia(jkrowling, 46).
usia(abdi, 45).
usia(richard, 39).
usia(mariecurie, 35).
usia(tami, 20).
usia(sherlockh, 25).
usia(lia, 7).
usia(masumisera, 4).

menikah(karel, adalovelace).
menikah(adalovelace, karel).
menikah(rakartini, gabenewell).
menikah(gabenewell, rakartini).
menikah(kinantan, elsapataky).
menikah(elsapataky, kinantan).
menikah(jkrowling, abdi).
menikah(abdi, jkrowling).
menikah(richard, mariecurie).
menikah(mariecurie, richard).
menikah(tami, sherlockh).
menikah(sherlockh, tami).

anak(nikolatesla, karel).
anak(nikolatesla, adalovelace).
anak(alanturing, karel).
anak(alanturing, adalovelace).
anak(jkrowling, karel).
anak(jkrowling, adalovelace).
anak(abdi, rakartini).
anak(abdi, gabenewell).
anak(richard, rakartini).
anak(richard, gabenewell).
anak(mariecurie, kinantan).
anak(mariecurie, elsapataky).
anak(sherlockh, jkrowling).
anak(sherlockh, abdi).
anak(lia, richard).
anak(lia, mariecurie).
anak(masumisera, richard).
anak(masumisera, mariecurie).

saudara(nikolatesla, alanturing).
saudara(alanturing, nikolatesla).
saudara(nikolatesla, jkrowling).
saudara(jkrowling, nikolatesla).
saudara(alanturing, jkrowling).
saudara(jkrowling, alanturing).
saudara(abdi, richard).
saudara(richard, abdi).
saudara(lia, masumisera).
saudara(masumisera, lia).

/* Nomor 2 */
/* Deklarasi Rules */
kakak(X, Y) :- saudara(X, Y), usia(X, A), usia(Y, B), A > B.
keponakan(X, Y) :- anak(X, A), saudara(A, Y).
suami(X,Y) :- menikah(X, Y), pria(X).
sepupu(X,Y) :- anak(X, A), saudara(A, B), anak(Y, B).
mertua(X,Y) :- anak(A, X), menikah(Y, A).
bibi(X,Y) :- saudara(X, A), anak(Y, A), wanita(X).
cucu(X,Y) :- anak(X, A), anak(A, Y).
keturunan(X,Y) :- anak(X, Y).
keturunan(X,Y) :- anak(X, A), keturunan(A, Y).
anaksulung(X) :- anak(X,A), pria(A), \+ (kakak(_, X)).
anakbungsu(X) :- anak(X,A), pria(A), \+ (kakak(X, _)).

/* Bagian II */
/* Deklarasi Rules */
/* Nomor 1 */
permute(X,0,1) :- !.
permute(X,Y,Z) :- X1 is X-1, Y1 is Y-1, permute(X1,Y1,Z1), Z is Z1*X.

/* Nomor 2 */
virus(0,N,R,N) :- !.
virus(T,N,R,Y) :- T1 is T-1, virus(T1,N,R,Y1), Y is Y1*R.

/* Nomor 3 */
gcd(X,0,X) :- !.
gcd(0,X,X) :- !.
gcd(A,B,X) :- A1 is A mod B, gcd(B,A1,X).
lcm(A,B,X) :- gcd(A,B,Z), X is (A*B)//Z.

/* Nomor 4 */
mul(A,0,0) :- !.
mul(0,B,0) :- !.
mul(A,B,X) :- ((A<0, B>0);(A>0, B<0)), A1 is A*(-1), mul(A1,B,X1), X is X1*(-1).
mul(A,B,X) :- A<0, B<0, A1 is A*(-1), B1 is B*(-1), mul(A1,B1,X).
mul(A,B,X) :- A>=0, B>=0, B1 is B-1, mul(A,B1,X1), X is X1+A.

/* Nomor 5 */
printLine(N, 0) :- nl, !.
printLine(N, M) :- write(N), M1 is M-1, printLine(N, M1).

numberTriangle(0) :- !.
numberTriangle(N) :- N>0, printLine(N, N), N1 is N-1, numberTriangle(N1).

/* Bagian III */
/* Deklarasi Rules */
/* Nomor 1 */
min([Min], Min).
min([H,N|T], Min) :- H =< N, min([H|T], Min).
min([H,N|T], Min) :- H > N, min([N|T], Min).

max([Max], Max).
max([H,N|T], Max) :- H >= N, max([H|T], Max).
max([H,N|T], Max) :- H < N, max([N|T], Max).

range(List, Range):- max(List, Max), min(List, Min), Range is Max-Min.

count([], 0).
count([H|T], Count) :- count(T, Count1), Count is Count1 + 1.

sum([], 0).
sum([H|T], Sum) :- sum(T, Sum1), Sum is Sum1 + H.

/* Nomor 2 */
insertAt(L, El, 1, [El|L]).
insertAt([H|T], El, Pos, [H|Result]) :- Pos1 is Pos-1, insertAt(T, El, Pos1, Result).

/* Nomor 3 */
slice([], Start, End, []) :- !.
slice(_, Start, End, []) :- Start >= End, !.
slice([H|T], 1, End, [H|Result]) :- !, End1 is End-1, slice(T, 1, End1, Result).
slice([H|T], Start, End, Result) :- Start1 is Start-1, End1 is End-1, slice(T, Start1, End1, Result).
