
#a1 = Dict(1=>"one", 2=>"two")

a1 = Dict{String, Int32}()


f = open( "test.bed", "r" )
n = countlines( f )  # 计算数据行数
seekstart( f )       # 返回文件起始位置

for i = 1:n
    s = split( readline(f), "\t")
    a = parse(Int64, s[2])
    b = parse(Int64, s[3])
    
    for pos = (a-125):(b+125)
        p_x = string(s[1], pos)
        a1[p_x] = 1
    end
    
end 


println(length(a1))
