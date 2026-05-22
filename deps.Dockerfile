ARG BIOC_VERSION
FROM bioconductor/bioconductor_docker:${BIOC_VERSION}
COPY . /opt/pkg

# Install book package 
RUN Rscript -e 'repos <- BiocManager::repositories() ; BiocManager::install(c("beachmat.hdf5", "remotes")) ; remotes::install_local(path = "/opt/pkg/", repos=repos, dependencies=TRUE, build_vignettes=FALSE, upgrade=TRUE) ; sessioninfo::session_info(installed.packages()[,"Package"], include_base = TRUE)'
