using Printf

function getAccord_Mut(reader)

    mutation_dict = Dict{String, String}()

    
    while !eof(reader)
        line = readline(reader)
        if !( line[1:6] == "T_Freq" )
            s = split(line, "\t")
            freq = parse(Float64, s[1])
            if freq > 0.02
                mutation_dict["$(s[29])\t$(s[30])"] = line
            end
        end
    end
    
    return mutation_dict

end

function writeData(dict_t, outf)
    af = basename(outf)
    if !(isfile(".\\test_02\\$af"))
        output_file = open(  ".\\test_02\\$af" ,"w")
        for (mut, v) in dict_t
            write(output_file, @sprintf("%s\n", v))
            
        end
        close(output_file)
    end
    return 0
end

md = open(getAccord_Mut, ARGS[1])

#for (mut, v) in md
#    println(@sprintf("%s\t%s", mut, v))
        #if haskey(md, mut)
        #    accor_N += 1
        #end
#end

a = writeData(md, ARGS[1])

#open("/usr/share/dict/words") do io
    #       while !eof(io)
    #           word = readline(io)
    #           if length(word) >= 24
    #               println(word)
    #           end
    #       end
    #   end
