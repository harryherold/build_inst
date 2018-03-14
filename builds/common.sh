generate_build_dir()
{
    build_name=$1
    main_path=$2
    echo $(mktemp -d -p $main_path build_inst_$build_name.XXXXXXXXXX)
}
