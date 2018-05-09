padrede('Olimpo','Kevin').
padrede('Olimpo','Nicole').
padrede('Olimpo','Bryan').
padrede('Feliberto','Olimpo').
padrede('José','Feliberto').
padrede('Flaminio','Jairo').
padrede('Feliberto','Flaminio').
padrede('Feliberto','Gilberto').
padrede('Flaminio','Henry').
padrede('Nepomuseno','Sara').
padrede('Vidal','Zoraida').
padrede('Vidal','Gilma').
padrede('Otoniel','Adela').
padrede('Florentino','Sara').
padrede('Santiago','Vidal').
padrede('Juan','Sebastian').
padrede('Juan','Daniel').

madrede('Zoraida','Kevin').
madrede('Zoraida','Bryan').
madrede('Zoraida','Nicole').
madrede('Sara','Zoraida').
madrede('Sara','Gilma').
madrede('Florentina','Sara').
madrede('Rosa','Jairo').
madrede('Rosa','Henry').
madrede('Gilma','Sebastian').
madrede('Gilma','Daniel').
madrede('Maria','Vidal').
madrede('Secundina','Feliberto').
madrede('Cornelia','Adela').
madrede('Adela','Flaminio').
madrede('Adela','Gilberto').
madrede('Adela','Olimpo').

esposade('Gilma','Juan').
esposade('Zoraida','Olimpo').
esposade('Sara','Vidal').
esposade('Florentina','Nepomuseno').
esposade('Maria','Santiago').
esposade('Cornelia','Otoniel').
esposade('Adela','Feliberto').
esposade('Rosa','Flaminio').
esposade('Secundina','Jose').

hermanode(A,B) :- padrede(C,A), padrede(C,B).
hermanode(A,B) :- madrede(C,A), madrede(C,B).

tiode(A,B) :- padrede(C,B), hermanode(A,C).
tiode(A,B) :- madrede(C,B), hermanode(A,C).

primode(A,B) :- padrede(C,A), tiode(C,B).
primode(A,B) :- madrede(C,A), tiode(C,B).

hijode(A,B) :- padrede(B,A).
hijode(A,B) :- madrede(B,A).

sobrinode(A,B) :- padrede(C,A), hermanode(C,B).
sobrinode(A,B) :- madrede(C,A), hermanode(C,B).

abuelode(A,B) :- padrede(C,B), padrede(A,C).
abuelade(A,B) :- madrede(C,B), madrede(A,C).

bisabuelode(A,B) :- padrede(A,C), abuelode(C,B).
bisabuelade(A,B) :- madrede(A,C), abuelade(C,B).

nietode(A,B) :- abuelode(B,A); abuelade(B,A).
bisnieto(A,B) :- bisabuelode(B,A); bisabuelade(B,A).

esposode(A,B) :- esposade(B,A).

cuñadode(A,B) :- hermanode(A,C), esposode(C,B).
cuñadode(A,B) :- hermanode(A,C), esposade(C,B).

suegrode(A,B) :- padrede(A,C), esposode(C,B).
suegrode(A,B) :- madrede(A,C), esposode(C,B).

esfeliz(A,_) :- not(esposode(A,_)).

