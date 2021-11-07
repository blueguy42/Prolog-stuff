/*13520151 Rizky Ramadhana P. K.*/

/*Bagian 1*/

/*Deklarasi Fakta*/
pria('Karel').
pria('Gabe Newell').
pria('Kinantan').
pria('Nikola Tesla').
pria('Alan Turing').
pria('Abdi').
pria('Richard').
pria('Sherlock H').

wanita('Ada Lovelace').
wanita('R.A. Kartini').
wanita('Elsa Pataky').
wanita('J.K. Rowling').
wanita('Marie Curie').
wanita('Tami').
wanita('Lia').
wanita('Masumi Sera').

usia('Karel',80).
usia('Gabe Newell',73).
usia('Kinantan',65).
usia('Nikola Tesla',52).
usia('Alan Turing',48).
usia('Abdi',45).
usia('Richard',39).
usia('Sherlock H',25).
usia('Ada Lovelace',75).
usia('R.A. Kartini',70).
usia('Elsa Pataky',64).
usia('J.K. Rowling',46).
usia('Marie Curie',35).
usia('Tami',20).
usia('Lia',7).
usia('Masumi Sera',4).

menikah('Karel','Ada Lovelace').
menikah('Ada Lovelace','Karel').
menikah('R.A. Kartini','Gabe Newell').
menikah('Gabe Newell','R.A. Kartini').
menikah('Kinantan','Elsa Pataky').
menikah('Elsa Pataky','Kinantan').
menikah('J.K. Rowling','Abdi').
menikah('Abdi','J.K. Rowling').
menikah('Richard','Marie Curie').
menikah('Marie Curie','Richard').
menikah('Tami','Sherlock H').
menikah('Sherlock H','Tami').

anak('Nikola Tesla','Karel').
anak('Alan Turing','Karel').
anak('J.K. Rowling','Karel').
anak('Nikola Tesla','Ada Lovelace').
anak('Alan Turing','Ada Lovelace').
anak('J.K. Rowling','Ada Lovelace').
anak('Abdi','R.A. Kartini').
anak('Richard','R.A. Kartini').
anak('Abdi','Gabe Newell').
anak('Richard','Gabe Newell').
anak('Marie Curie','Kinantan').
anak('Marie Curie','Elsa Pataky').
anak('Sherlock H','J.K. Rowling').
anak('Sherlock H','Abdi').
anak('Lia','Richard').
anak('Masumi Sera','Richard').
anak('Lia','Marie Curie').
anak('Masumi Sera','Marie Curie').

saudara('Nikola Tesla','Alan Turing').
saudara('Nikola Tesla','J.K. Rowling').
saudara('Alan Turing','J.K. Rowling').
saudara('Alan Turing','Nikola Tesla').
saudara('J.K. Rowling','Nikola Tesla').
saudara('J.K. Rowling','Alan Turing').
saudara('Abdi','Richard').
saudara('Richard','Abdi').
saudara('Lia','Masumi Sera').
saudara('Masumi Sera','Lia').

/*Deklarasi Rule*/

kakak(X,Y) :- 
    saudara(X,Y),
    usia(X,UMURX),
    usia(Y,UMURY),
    UMURX>UMURY.

keponakan(X,Y) :-
    anak(X,ORTUX),
    saudara(ORTUX,Y).

suami(X,Y) :-
    menikah(X,Y),
    pria(X),
    wanita(Y).

sepupu(X,Y) :-
    anak(X,ORTUX),
    anak(Y,ORTUY),
    saudara(ORTUX,ORTUY).

mertua(X,Y) :-
    menikah(Y,PASANGANY),
    anak(PASANGANY,X).

bibi(X,Y) :-
    anak(Y,ORTUY),
    saudara(X,ORTUY),
    wanita(X).

cucu(X,Y) :-
    anak(X,ORTUX),
    anak(ORTUX,Y).

keturunan(X,Y) :-
    anak(X,Y);
    anak(X,Z),keturunan(Z,Y).

anaksulung(X) :- \+kakak(_,X).

anakbungsu(X) :- \+kakak(X,_).

/*Bagian 2*/
/*Deklarasi Rule*/
permute(X,1,X).
permute(X,Y,Z) :- B is Y-1,permute(X,B,C),C is Z/(X-Y+1).

virus(T,N,R,Y) :-
    (T==0,Y==N);
    (T==1,Y==N*R);
    virus(R,N,T-1,Y/R).

gcd(X,0,X).
gcd(X,Y,G) :- Y>0,P is mod(X,Y),gcd(Y,P,G).

mul(A,B,X) :- gcd(A,B,GCD),X==A*B/GCD.

cetak(1,B) :- write(B).
cetak(A,B) :- 
    A>1,
    A1 is A-1,
    write(B),
    cetak(A1,B).

numberTriangle(1) :- write(1),nl.
numberTriangle(X) :- 
    X>1,
    X1 is X-1,
    cetak(X1,X),
    write(X),
    nl,
    numberTriangle(X1).

/*Bagian 3*/








