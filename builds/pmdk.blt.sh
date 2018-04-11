name="pmdk"
inst_dir=/home/cherold/procs/$name
src_dir=/home/cherold/src/$name

cd $src_dir

install_build()
{
    make install prefix=$inst_dir
}
