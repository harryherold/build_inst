name="scorep_io_cray_8_4_1"
inst_dir=/work/d131/d131/shared/vampir/scorep_io_cdt_15_11

. builds/common.sh
build_path=$(generate_build_dir $name /dev/shm)

prepare_build()
{
    cd $build_path

    module load cdt/15.11
    module load cray-hdf5-parallel cray-netcdf-hdf5parallel
    module use /work/d131/d131/shared/vampir/modules
    module load scorep-dev/build_io
}

configure_build()
{
    /home/d131/d131/cherold/TRY_TUD_io_recording/configure \
	    --prefix=$inst_dir \
	    --with-libunwind=/work/d131/d131/shared/vampir/libunwind \
	    --enable-static --enable-shared \
	    --with-libnetcdf=/opt/cray/netcdf-hdf5parallel/4.3.3.1/CRAY/8.3 \
	    --with-machine-name="ARCHER:PrgEnv-cray" \
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
