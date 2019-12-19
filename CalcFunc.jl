#Fukcija vraca vrijednosti uglova, bez referentnog.
function DajTetu(a,b)
temp6=inv(a)*b
s1=size(temp6,1)
for i=1:s1
    temp6[i,1]=round(temp6[i,1],digits=5)
end
return temp6
end

function SparseTeta(a,b)
#temp13=factorize(a)
temp14=a\b
s1=size(temp14,1)
for i=1:s1
    temp14[i,1]=round(temp14[i,1],digits=5)
end
return temp14
end
