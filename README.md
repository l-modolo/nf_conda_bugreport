# Nextflow bug report

Build the docker:
```
docker build https://github.com/l-modolo/nf_conda_bugreport.git -t 'nf_conda_bugreport'
```

Launch it:
```
docker run -ti nf_conda_bugreport
```

Run the faulty pipeline:
```
nextflow /nf_conda_bugreport/conda_test.nf -c /nf_conda_bugreport/conda_test.config -profile conda_test --fasta /nf_conda_bugreport/test.fasta
```

