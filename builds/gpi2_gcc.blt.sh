name="gpi2_gcc"
src_dir=/scratch/cherold/GPI-2
inst_dir=/sw/taurus/libraries/gpi2/git_gnu/x86_64

prepare_build()
{
    cd $src_dir
    module load gcc/7.1.0
    mkdir -p $inst_dir
}

make_build()
{
    ./install.sh --with-fortran=true -p $inst_dir
}

install_build()
{
    mv $inst_dir/lib64 $inst_dir/lib
}
