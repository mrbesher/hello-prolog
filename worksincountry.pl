ulke(almanya).
ulke(amerika).
ulke(italya).
sehir(berlin, almanya).
sehir(miami, amerika).
sehir(venedik, italya).
ulkede_calisir(hilmi,almanya,mercedes).
ulkede_calisir(hilmi,amerika,google).
ulkede_calisir(hilmi,italya,ferrari).
bindi(hilmi,gondol,venedik).
bulundu(Kisi, Yer):-bindi(Kisi, _, Yer).
hangi_ulke(Yer, Ulke):-ulke(Yer), Ulke is Yer;sehir(Yer,Ulke).
ulkede_bulundu(Kisi, Ulke):- bulundu(Kisi, Yer), hangi_ulke(Yer, Ulke).
hangifirma(Kisi, Firma):-ulkede_bulundu(Kisi, Ulke),ulkede_calisir(Kisi,Ulke,Firma).
