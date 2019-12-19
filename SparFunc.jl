using SparseArrays

function SparseReaktanse(a)
s1=size(a,1)
s2=Int64(DajMaks(a))
From=zeros(s1)
To=zeros(s1)
Val=zeros(2*s1)
Bus=collect(1:s2)
for i = 1 : s1
    From[i]=a[i,1]
    To[i]=a[i,2]
    Val[i]=a[i,3]
    Val[i+s1]=a[i,3]
end
row=trunc.(Int,[From;To])
col=trunc.(Int,[To;From])
row1=trunc.(Int,[From;To])
col1=trunc.(Int,[From;To])
temp8=sparse(row1,col1,Val)
temp7=sparse(row,col,Val)
temp9=temp8-temp7
return temp9
end

function SparseAdmitanse(a)
s3=size(a,1)
s4=Int64(DajMaks(a))
From=zeros(s3)
To=zeros(s3)
Val=zeros(2*s3)
Bus=collect(1:s4)
for i = 1 : s3
    From[i]=a[i,1]
    To[i]=a[i,2]
    Val[i]=(1/a[i,3])
    Val[i+s3]=(1/a[i,3])
end
row=trunc.(Int,[From;To])
col=trunc.(Int,[To;From])
row1=trunc.(Int,[From;To])
col1=trunc.(Int,[From;To])
temp10=sparse(row1,col1,Val)
temp11=sparse(row,col,Val)
temp12=temp10-temp11
return temp12
end
