
geneLen  = Dict{String, Int64}()


f = open( "hg19_gencode_basic.gtf", "r" )
n = countlines( f )  # 计算数据行数
seekstart( f )       # 返回文件起始位置

for i = 1:n
    s = split( readline(f), "\t")
    a_start = parse(Int64, s[4])
    a_end = parse(Int64, s[5])
    
    gene_Info = s[9]
    geneID_pre = split(gene_Info, ";")[1]
    geneID = replace(geneID_pre, "gene_id " => "")
    geneID_a = strip(geneID, '"')
    
    if !haskey(geneLen, geneID_a)
        geneLen[geneID_a] = a_end - a_start
    else
        geneLen[geneID_a] += a_end - a_start
    end
    
end 


for (k,v) in geneLen

    println("$k length is $v")
end
