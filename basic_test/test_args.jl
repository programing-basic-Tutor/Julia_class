

if length(ARGS) < 1 
    println("Please provide input file -- bed format")
    exit(0)
else
    bedf = ARGS[1]    
end

f = open(bedf, "r")
n = countlines(f)
seekstart(f)

for i = 1:n
    line = readline(f)
    if !(line[1:5]=="track")
    
        s = split(line, "\t")
        p_start = parse(Int64, s[2])
        p_end   = parse(Int64, s[3])
    
        println(string(p_start , "\t" , p_end , "\t" ,(p_end - p_start ),"\t", s[4]))
        
    end
end  
