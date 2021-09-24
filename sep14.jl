x = 1:100
collect(x)
sum(x.^2)
sum(x)^2
sum(x)^2 - sum(x.^2)



cd("/Users/jiwonpark/Documents/GitHub")
using Pkg
Pkg.add("CSV")
using CSV
Pkg.add("DataFrames")
using DataFrames
Data = CSV.read("triangle.csv", DataFrame, delim=",", header=false)
Data.triangle = sum(eachcol(Data)) - 2 * maximum.(eachrow(Data))
Data[Data.triangle.>0 ,:]
