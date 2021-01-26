nextflow.enable.dsl = 2

//params.vcfFile

process CHECK_VCF_BUILD {

    input:
    file vcfFile

    output:
    file("*.BuildChecked")

    script:
    """
    /app/0_check_vcf_build.slurm.sh $vcfFile .
    """

    stub:
    """
    touch dummy.BuildChecked
    """
}

workflow test {

    rawFileChannel = Channel.fromPath(params.vcfFile)
    check_vcf_build(rawFileChannel)

}
