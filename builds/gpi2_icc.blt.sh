name="gpi2_icc"
src_dir=/scratch/cherold/GPI-2
inst_dir=/sw/taurus/libraries/gpi2/git_intel/x86_64

prepare_build()
{
    cd $src_dir
    module load intel/2018.1.163
    mkdir -p $inst_dir
}

make_build()
{
    ./install.sh --with-fortran=true -p $inst_dir
}

install_build()
{
    mv $inst_dir/lib64 $inst_dir/lib
    cp /sw/taurus/libraries/gpi2/1.3.0/x86_64/bin/igaspi_run.sh  $inst_dir/bin/
    cp /sw/taurus/libraries/gpi2/1.3.0/x86_64/bin/gaspi_run.sh  $inst_dir/bin/
}
