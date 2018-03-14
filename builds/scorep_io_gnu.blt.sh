name="scorep_io_openmpi3.0"
inst_dir=/home/cherold/scorep/install/io-branch

. builds/common.sh
build_path=$(generate_build_dir $name /dev/shm)

prepare_build()
{
    cd $build_path
    module load scorep-dev/6.0 cube/4.4 openmpi/3.0-noprogress
}

configure_build()
{
    /home/cherold/scorep/TRY_TUD_io_recording/configure \
	    --prefix=$inst_dir \
        --enable-static --disable-shared \
        --without-libnetcdf \
        --without-libhdf5 \
        --without-shmem \
        --with-mpi=openmpi \
        --enable-debug
}
