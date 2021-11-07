/*  Pra Praktikum 1 Logkom
    Ahmad Alfani Handoyo
    13520023 */


/* Bagian I */
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


/* Deklarasi Rules */
kakak(X, Y) :- saudara(X, Y), usia(X, A), usia(Y, B), A > B.
keponakan(X, Y) :- anak(X, A), saudara(A, Y).
suami(X,Y) :- menikah(X, Y), pria(X).
sepupu(X,Y) :- anak(X, A), saudara(A, B), anak(Y, B).
mertua(X,Y) :- menikah(X, A), anak(A, Y).
bibi(X,Y) :- saudara(X, A), anak(Y, A), wanita(X).
cucu(X,Y) :- anak(X, A), anak(A, Y).
keturunan(X,Y) :- anak(X, Y).
keturunan(X,Y) :- anak(X, A), keturunan(A, Y).
anaksulung(X) :- anak(X,A), pria(A), \+ (kakak(_, X)).
anakbungsu(X) :- anak(X,A), pria(A), \+ (kakak(X, _)).

/* Bagian II */
/* Deklarasi Rules */
permute(X,0,1) :- !.
permute(X,Y,Z) :- X1 is X-1, Y1 is Y-1, permute(X1,Y1,Z1), Z is Z1*X.

virus(0,N,R,N) :- !.
virus(T,N,R,Y) :- T1 is T-1, virus(T1,N,R,Y1), Y is Y1*R.

lcm()

gcd(X,0,X) :- !.
gcd(0,X,X) :- !.
gcd(A,B,X) :- A1 is A mod B, gcd(B,A1,X).
lcm(A,B,X) :- gcd(A,B,Z), X is (A*B)//Z.