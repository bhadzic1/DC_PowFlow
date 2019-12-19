#= Ukoliko ih nemate u Julia, sljedece pakete i komande je potebno pokrenuti ili unutar editora ili putem terminala
using Pkg
Pkg.add("CSV")
Pkg.add("DataFrames")
Pkg.add("SparseArrays")
Pkg.add("LinearAlgebra")
=#


using CSV
using DataFrames
using SparseArrays
using LinearAlgebra

include("SparFunc.jl")
include("GenFunc.jl")
include("CalcFunc.jl")
#include("functions.jl")
u = Matrix{Float64}(CSV.read("D:/Fakultet/EUEES/LAB_01/ConnData.csv"))
p = Matrix{Float64}(CSV.read("D:/Fakultet/EUEES/LAB_01/PowData.csv"))
y = DajAdmitanse(pomocni)
y_1=SparseAdmitanse(u)
ReferentniVektor = DajRef(y, 1)
T = DajTetu(IzbaciRef(y,1),IzbaciRef(p,1))
T_2=SparseTeta(IzbaciRef(y_1,1),IzbaciRef(p,1))
