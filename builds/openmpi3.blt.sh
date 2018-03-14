name="openmpi3.0"
inst_dir=/home/cherold/procs/openmpi3.0
src_dir=/home/cherold/Downloads/openmpi-3.0.0

. builds/common.sh
build_path=$(generate_build_dir $name /dev/shm)
cd $build_path

configure_build()
{
    $src_dir/configure \
        --prefix=$inst_dir \
        --enable-pretty-print-stacktrace \
        --enable-weak-symbols \
        --enable-debug \
        --enable-mem-debug
}
