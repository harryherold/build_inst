name="gpi2_clang"
src_dir=/scratch/cherold/GPI-2
inst_dir=/sw/taurus/libraries/gpi2/git_clang/x86_64

prepare_build()
{
    cd $src_dir
    module load modenv/eb Clang/6.0.0-GCC-6.4.0-2.28
    mkdir -p $inst_dir
}

make_build()
{
    CC=clang CXX=clang++ ./install.sh --with-fortran=true -p $inst_dir
}

install_build()
{
    mv $inst_dir/lib64 $inst_dir/lib
    cp /sw/taurus/libraries/gpi2/1.3.0/x86_64/bin/igaspi_run.sh  $inst_dir/bin/
    cp /sw/taurus/libraries/gpi2/1.3.0/x86_64/bin/gaspi_run.sh  $inst_dir/bin/
}
