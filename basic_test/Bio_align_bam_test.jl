import Bio.Align.BAM

#count = 0
#reader = open(BAM.Reader, "E:\\bam_test\\PD001\\1870157\\g_1870157_chr8_48711871.bam")

#for record in reader
#    if BAM.ismapped(record) && BAM.refname(record)=="chr8"
#        if BAM.position(record) > 48711900 && BAM.position(record) <=48711950
#            global count += 1
#            println(string(BAM.tempname(record), "\t", string(BAM.alignlength(record))))
#        end
#    end
#end

#println(count)

#close(reader)


function get_AlignLen(file_bam)
    count = 0
    reader = open(BAM.Reader, file_bam)
    
    for record in reader
        if BAM.ismapped(record) && BAM.refname(record)=="chr8"
            if BAM.position(record) > 48711900 && BAM.position(record) <=48711950
                count += 1
                println(string(BAM.tempname(record), "\t", string(BAM.alignlength(record))))
            end
        end
    end
    close(reader)
    return count
end

AlignNum =  get_AlignLen("E:\\bam_test\\X001\\1870157\\g_1870157_chr8_48711871.bam")
println(AlignNum)
