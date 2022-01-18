ciglikAtar(Kisi):-korkar(Kisi,A),gorur(Kisi,A).
cigligiDuyar(Kisi,Canli):-ciglikAtar(Canli),yakininda(Kisi,Canli).
gelirYanina(Canli,Kisi):-cigligiDuyar(Kisi,Canli).
gelirYanina(Canli1,Canli2):-oldurmekuzere(Canli2,Canli1).
/*Gnin yanina geldigi kisi Nesne tarafindan oldurulmek uzere*/
gorur(G,Nesne):-gelirYanina(Kisi,G),oldurmekuzere(Nesne,Kisi).
/** N2 N1'i duyuyorsa N1,N2'in yakinindadir*/
yakininda(N1,N2):-sesiniDuyar(N2,N1).
oldurur(G,Canli):-gorur(G,Canli),cokTehlikeli(Canli).
oldurmektenVazgcer(Olduren,Oldurulen):-not(ac(Olduren));
gelirYanina(Oldurulen,A),oldurur(A,Olduren).

yakininda(oduncular,kiz).
ac(kurt).
korkar(kiz,kurt).
cokTehlikeli(kurt).
sesiniDuyar(kurt,oduncular).
oldurmekuzere(kurt,kiz).
