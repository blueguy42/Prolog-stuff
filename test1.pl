predikat1([],[]).
predikat1([H|T],Hasil) :- X is (H mod 2), X =\= 0, predikat1(T,Hasil).
predikat1([H|T],[H|Hasil]) :- predikat1(T, Hasil).