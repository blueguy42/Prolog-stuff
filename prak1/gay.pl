permute(N,0,1) :- !.
permute(N,C,Z) :- N1 is N-1, C1 is C-1, permute(N1,C1,Z1),Z is Z1*N.

faktorial(0,1) :- !.
faktorial(N,X) :- N1 is N-1, faktorial(N1,X1), X is N*X1.

mul(X,0,0) :- !.
mul(A,B,X) :- B1 is B-1, mul(A,B1,X1), X is X1+A.

gcd(X,0,X) :- !.
gcd(0,X,X) :- !.
gcd(A,B,X) :- A1 is A mod B, gcd(B,A1,X).
lcm(A,B,X) :- gcd(A,B,Z), X is (A*B)//Z.