using CSV
using Plots
using GR


#cd("D:\\test_data\\")
dat = CSV.read("tmp_table.txt", header=false)
#length(dat.Column14)
# using DataFrames
# nrow(dat)
# ncol(dat)
#a =indexin([12,147,240], dat.Column15)

# show the third column  
# dat[!,5]
#dat[1:3, [1,5]]
#dat[!, [1,5]]

#last(dat, 3)
#first(dat, 3)
#size(dat)

x=1:22

gr()
plot!(x, dat.Column15, label="line")
scatter!(x, dat.Column15, label="points")

png("./test_a")
