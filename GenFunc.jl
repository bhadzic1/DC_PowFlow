#Funkcija slaze nodove od manjeg ka vecem zbog lakseg proracuna u narednim funkcijama
function SloziGrane(a)
s1=size(a,1);
for i = 1:s1
    if a[i,1] > a[i,2]
        temp1 = a[i,1]
        a[i,1] = a[i,2]
        a[i,2] = temp1
    end
end
return a
end

#=
Funkcija vraca broj nodova tako sto trazi najveci broj
mana je ukoliko nodovi imaju oznake drugacije od predvidjenih
=#
function DajMaks(a)
s1=size(a,1);
maks = 0;
for i = 1:s1
    for j=1:2
        if a[i,j] > maks
            maks = a[i,j]
        end
    end
end
return maks
end

#Funkcija na osnovu topologije mreze date u vidu matrice koja se dobija iz ConnData.csv daje  matricu impedansi
function DajImpedanse(a)
s2= Int64(DajMaks(a));
s1=size(a,1);
temp2=zeros(s2,s2)
for i=1:s2
    for j=1:s2
                if i == j
                    for k=1:s1
                        if ( i == a[k,1] || i == a[k,2] )
                            temp2[i,j]+=a[k,3]
                        end
                    end
                else
                    for k=1:s1
                            temp2[Int64(a[k,1]),Int64(a[k,2])]=-a[k,3]
                            temp2[Int64(a[k,2]),Int64(a[k,1])]=-a[k,3]
                    end
                end
    end
end
return temp2
end
# Na osnovu proslijedjene matrice impedansi kao rezultat vraca matricu admitansi
function DajAdmitanse(a)
s1=size(a,1);
s2=size(a,2);
B=zeros(s1,s2);
for i =  1 : s1
    for j = 1 : s2
        if i != j
            if a[i,j] != 0
                B[i,j]=1/a[i,j]
            end
        end
    end
end
for i =  1 : s1
    for j = 1 : s2
        if i == j
            for k = 1:s2
                if k!=i
                    B[i,j]=B[i,j] - B[i,k]
                end
            end
        end
    end
end
return B
end

#=Funkciji se prosljedjuje ili matrica admitansi
ili matrica impedansi, i parametar koji govori
koja sabirnica je proglasena referentnom.
=#
function DajRef(a,r)
    s1 = size(a,2)
    R=zeros(1,s1)
    for i=1:s1
        R[1,i]=a[r,i]
    end
return R
end
function IzbaciRef(a,r)
a = a[1:end .!= r, 1:end .!= r]
#=s1=size(a,1)
temp4=zeros(s1,s1)
for i = 1:s1                                OVAJ KOD NE RADI;
    for j = 1:s1                            Mozda bi mogao kada bi se doradio ali je dosta preglednije
        if i-1!=r && j-1!=r && i>0 && j >0
            temp4[i,j]=a[i-1,j-1]
        end
    end
end=#
return a
end

function DodajRef(a,b,c)
s1=size(b,2)
s2=c
s3=c+1
temp5=zeros(s1,s1)
for i = 1:s1
temp5[c,i] = b[1,i]
temp5[i,c] = b[1,i]
end
for i = 1:s2
    for j=1:(0+c)
            temp5[i,j]=a[i,j]
    end
end
for i = c+1:s1
    for j=c+1:s1
        if (i != j)
            temp5[i,j]=a[i-1,j-1]
        end
    end
end
return temp5
end

#Funkcija koja izbcuje referentnu sabirnicu iz matrice admitansi
function PIzbaciRef(a,r)
a = a[1:end .!= r, :]
s1=size(a,1)
temp4=zeros(s1,1)
for i=1:s1
temp4[i,1]=a[i,2]
end
return temp4
end
