#Homework2

# 1. Sum square difference

The sum of the squares of the first one hundred natrual numbers is, 

$1^2 + 2^2 + ... + 100^2 = 338350$

The square of the sum of the first hundred natural numbers is,

$(1 + 2 + ... + 100)^2 = 5050^2 = 25502500$

Hence the difference between the sum of squares of the first hundred natural numbers and the square of the sum is $25502500 - 338350 = 25164150$

```{julia, echo =TRUE}
x = 1:100
collect(x)
sum(x.^2)
sum(x)^2
sum(x)^2 - sum(x.^2)
```

# 2. Check valid triangle

Find the number of rows such that the three numbers can make triangles if we take them as side lengths of a triangle.

```{julia}
cd("/Users/jiwonpark/Documents/GitHub")
using Pkg
Pkg.add("CSV")
using CSV
Pkg.add("DataFrames")
using DataFrames
Data = CSV.read("triangle.csv", DataFrame, delim=",", header=false)
Data.triangle = sum(eachcol(Data)) - 2 * maximum.(eachrow(Data))
Data[Data.triangle.>0 ,:]

julia> Data[Data.triangle.>0 ,:]
25023×4 DataFrame
   Row │ Column1    Column2   Column3   triangle  
       │ Float64    Float64   Float64   Float64   
───────┼──────────────────────────────────────────
     1 │ 0.978942   1.77681   1.22853   0.430659
     2 │ 1.34814    1.30669   0.166336  0.12488
     3 │ 0.299079   0.844536  0.789649  0.244192
     4 │ 1.90859    0.584727  1.74333   0.419469
   ⋮   │     ⋮         ⋮         ⋮          ⋮
 25021 │ 0.660843   0.847183  1.41345   0.0945805
 25022 │ 0.738427   1.27003   1.3147    0.693754
 25023 │ 1.77971    1.16464   0.650127  0.0350625
                                25016 rows omitted
```

Therefore, in the Triangle.csv file, 25023 rows can make triangles.