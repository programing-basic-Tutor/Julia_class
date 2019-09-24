using Bio.Seq

reader1 = open(FASTA.Reader, "hg19.fasta")

for i in reader1
    println(FASTA.identifier(i))
    println(FASTA.sequence(i)[1:10])
end

close(reader1)

## ref https://biojulia.net/Bio.jl/latest/man/reading/
