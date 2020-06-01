import Bio.Align.BAM

# Count the number of mapped records.
function countmapped(reader)
    ret = 0
    record = BAM.Record()
    while !eof(reader)
        # in-place reading
        read!(reader, record)
        if BAM.ismapped(record)
            ret += 1
        end
    end
    return ret
end

println(open(countmapped, BAM.Reader, ARGS[1]))


## USAGE : C:\Program\Julia-1.2.0\bin\julia.exe .\test_prog.jl E:\bam_test\X001\1870157\g_1870157_chr8_48711871.bam
