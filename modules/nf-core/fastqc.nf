/*
 * FastQC
 */
process FASTQC {
    label 'FastQC'
    label 'cpus_2'

    tag "${idPatient}-${idRun}"

    publishDir "${params.outdir}/Reports/${idSample}/FastQC/${idSample}_${idRun}", mode: params.publish_dir_mode

    input:
        tuple val(idPatient), val(idSample), val(idRun), file("${idSample}_${idRun}_R1.fastq.gz"), file("${idSample}_${idRun}_R2.fastq.gz")
       
    output:
        path "*.{html,zip}"

    script:
    """
    fastqc -t 2 -q ${idSample}_${idRun}_R1.fastq.gz ${idSample}_${idRun}_R2.fastq.gz
    """
}

