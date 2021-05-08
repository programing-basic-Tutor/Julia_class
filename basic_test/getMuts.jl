using Printf
inputF = ARGS[1]

function getP_mutations(infile)
    f = open( infile, "r")
    n = countlines(f)
    seekstart(f)

    germMutation_dict = Dict{String, String}()
    somaticMutation_dict = Dict{String, String}()

    ## println(string("CHR\tPOS\tFREQ"))
    for i = 1:n
        line = readline(f)
        #if !( startswith( line, "序号" ) )
        if !(occursin("序号", line))    
            s = split(line, "\t")
            #freq = parse(Float64, s[1])
            
            patho_HRR = split(s[9], ";")

            vus_HRR = split(s[10], ";") 
            for v in patho_HRR
                if ( startswith( v, "g" ) )
                    geneInfo = split(v, ":")
                    if length(geneInfo) == 2
                        println(@sprintf("%s\t%s\t胚系\t良性", geneInfo[1][2:end], geneInfo[2]))
                    else
                        println(@sprintf("%s\t非点突变\t胚系\t良性", geneInfo[1][2:end] ))
                    end
                elseif (v != "" && v != "/" )
                    println(@sprintf("%s\t非点突变\t体系\t致病", v ))
                end
                    
            end
            for v in vus_HRR
                if ( startswith( v, "g" ) )
                    geneInfo = split(v, ":")
                    if length(geneInfo) == 2
                        println(@sprintf("%s\t%s\t胚系\t意义不明", geneInfo[1][2:end], geneInfo[2]))
                    else
                        println(@sprintf("%s\t非点突变\t胚系\t意义不明", geneInfo[1][2:end] ))
                    end
                elseif (v != "" && v != "/" )
                    println(@sprintf("%s\t非点突变\t体系\t意义不明", v ))
                end
            end
            
        end
    end
    return 1
end

convertF = "mutation_a1.txt"

## special characters "#{}()[]<>|&*?~;" should now be quoted in commands
## 

##source is built-in command

##try like this:

##   run(`zsh -c "source $cmd"`)

##   run(`bash -c source $cmd`)

##windows:

##   run(`cmd /c 'echo xxx'`)




run(`powershell /c Get-Content -Path $inputF "|" Out-File -FilePath .\\$convertF -Encoding utf8`)

#run(`Get-Content -Path "D:\\docs_00\\probes\\HRR\\Patents\\$inputF"`)

#a = getP_mutations(inputF)
a = getP_mutations(convertF)
