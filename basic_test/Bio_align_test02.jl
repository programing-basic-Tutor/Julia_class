import Bio.Align.BAM

function convert( a::Array{UInt8,1})
    s = ""
    for i in a
        s = string(s, Char(i +  0x21))
        ##  println(Int(i))
    end
    return s
end

function get_AlignLen(file_bam)
    count = 0
    reader = open(BAM.Reader, file_bam)
    
    for record in reader
        if BAM.ismapped(record)

            QualString = convert( BAM.quality(record))
            println(string(BAM.tempname(record), "\t", string(BAM.alignlength(record)), "\t", BAM.refname(record), "\t", BAM.position(record), "\t", BAM.cigar(record), "\t", BAM.seqlength(record), "\t", BAM.mappingquality(record), "\t", BAM.seqlength(record), "\t", BAM.sequence(record), "\t", QualString, "\t", BAM.auxdata(record)["nM"] ))
        end
    end
    close(reader)
    return count
end

AlignNum =  get_AlignLen("C:\\Users\\admin\\Desktop\\s201904405_chrX.bam")
println(AlignNum)


## Ref : https://biojulia.net/Bio.jl/latest/man/reading/#supported-file-formats
## Bio.Align.BAM.flag
## Bio.Align.BAM.ismapped
## Bio.Align.BAM.isprimary
## Bio.Align.BAM.refid
## Bio.Align.BAM.refname
## Bio.Align.BAM.position
## Bio.Align.BAM.rightposition
## Bio.Align.BAM.isnextmapped
## Bio.Align.BAM.nextrefid
## Bio.Align.BAM.nextrefname
## Bio.Align.BAM.nextposition
## Bio.Align.BAM.mappingquality
## Bio.Align.BAM.cigar
## Bio.Align.BAM.cigar_rle
## Bio.Align.BAM.alignment
## Bio.Align.BAM.alignlength
## Bio.Align.BAM.tempname
## Bio.Align.BAM.templength
## Bio.Align.BAM.sequence
## Bio.Align.BAM.seqlength
## Bio.Align.BAM.quality
## Bio.Align.BAM.auxdata
