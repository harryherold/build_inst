name="scorep_io_gnu"
inst_dir=/work/d131/d131/shared/vampir/scorep_io_gnu

. builds/common.sh
build_path=$(generate_build_dir $name /dev/shm)

prepare_build()
{
    cd $build_path

    module switch PrgEnv-cray PrgEnv-gnu
    module load papi/5.4.1.2
    module load cray-netcdf/4.4.1.1

    module use /work/d131/d131/shared/vampir/modules
    module load scorep-dev/build_io
}

configure_build()
{
    /home/d131/d131/cherold/TRY_TUD_io_recording/configure \
        --prefix=$inst_dir \
        --with-libunwind=/work/d131/d131/shared/vampir/libunwind \
        --enable-static --enable-shared \
        --with-libnetcdf=/opt/cray/netcdf/4.4.1.1/GNU/5.1 \
        --with-machine-name="ARCHER:PrgEnv-gnu" \
        --enable-debug
}

make_build()
{
    make -j8
}

install_build()
{
    make install
    sed -i '/putc/d' $inst_dir/share/scorep/posix_io.wrap
}
