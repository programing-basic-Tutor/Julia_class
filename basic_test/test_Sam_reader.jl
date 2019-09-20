using Printf

f = open( "target_a.sam", "r" )
n = countlines( f )  # 计算数据行数
seekstart( f )       # 返回文件起始位置

k_dict = Dict{String, String}()

for i = 1:n
    line = readline(f)

    if !(line[1]=='@')
        s = split( line, "\t" )
        chr_name = s[3]
        if s[7] == "="
            pos = parse(Int64, s[4])
            Interval_S = parse(Int64, s[9])

            if Interval_S > 0
            
                is_IN = false
                t_k=""
                for p = (pos-2):(pos+2)
                    for ii = (Interval_S-2):(Interval_S+2)
                    
                        k_s = string(chr_name,":", p, "+", ii)
                        if haskey(k_dict, k_s)
                            is_IN = true
                            t_k = k_dict[k_s]
                            break
                        end
                    end
                    if is_IN == true
                        break
                    end
                    
                end
                
                if is_IN == false
                    @printf("%s\t%s\n", string(chr_name, ":", pos, "+", Interval_S), line )
                    for p = (pos-2):(pos+2)
                        for ii = (Interval_S-2):(Interval_S+2)
                    
                            k_s = string(chr_name,":", p, "+", ii)
                        
                            k_dict[k_s] = string(chr_name, ":", pos, "+", Interval_S)     ## add region to dict
                        end
                    end
                    
                else
                    @printf("%s\t%s\n", t_k, line )
                end
                #println(Interval_S)
            end
        end
        
    else
        continue
    end

end

#for (key, value) in k_dict
#    println(key," => ", value)
#end
