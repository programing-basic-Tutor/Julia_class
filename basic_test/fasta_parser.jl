

if length(ARGS) < 1 
    println("Please provide file -- fasta format")
    exit(0)
else
    fastaf = ARGS[1]    
end


function parse_F(fa_file)
    f_h = open(fa_file, "r")
    n = countlines(f_h)
    seekstart(f_h)
    
    seqs_Dict = Dict{String, String}()
    id_array = Array{String, 1}()
    
    for i = 1:n
        Line = readline(f_h)
        
        if (Line[1] == '>')
            Name= rstrip(Line)[2:end]
            seqs_Dict[Name] = ""
            push!(id_array, Name)

        else

            t_name = id_array[end]

            try
                seqs_Dict[t_name] *= rstrip(Line)
            catch UndefVarError       #catch KeyError
                seqs_Dict[t_name] = rstrip(Line)
            
            #throw OverflowError()
            #    continue
            end
        end
    end
    return seqs_Dict, id_array
end

seq_d, seq_names = parse_F(fastaf)


for (key, value) in seq_d
    println(key," => ", value)
end  

for name in seq_names
    println(name)
end
