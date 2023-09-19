#!/bin/bash

function process() {
    source_dir=$1
    cd $source_dir

    echo "--- start compress png ---"
    if [[ $source_dir =~ "/" ]] ;then
    des_dir=$source_dir
    else
    des_dir="../"$source_dir
    fi
    echo "--- png_output_des_dir:"$des_dir" ---"
    [ -d $des_dir ] || mkdir -p $des_dir
    for file in `find . -name "*.png" -size +2MB`
    do
        original_file=$file
        file_name=`echo ${original_file#*/}`
        echo "start process "$file_name
        pngquant $file_name --skip-if-larger --speed 1 --force -o $des_dir"/"$file_name
    done

    echo "--- start compress jpg ---"
    if [[ $source_dir =~ "/" ]] ;then
    des_dir=$source_dir
    else
    des_dir="../"$source_dir
    fi
    echo "--- jpg_output_des_dir:"$des_dir" ---"
    [ -d $des_dir ] || mkdir -p $des_dir
    for file in `find . \( -name "*.jpg" -size +2MB -o -name "*.jpeg" \)`
    do
        original_file=$file
        file_name=`echo ${original_file#*/}`
        [[ $file_name =~ "/" ]] && sub_file_path=`echo ${file_name%/*}`
        [ -d $des_dir"/"$sub_file_path ] || mkdir -p $des_dir"/"$sub_file_path
        [[ $file_name =~ "/" ]] || sub_file_path=""
        echo $file_name"===="$des_dir"/"$sub_file_path
        jpegoptim $file -m 50 -o -d $des_dir"/"$sub_file_path
    done

    echo "--- compress completed ! ---"
}

function main(){
  local source_dir=$(pwd)
  process $source_dir
}

main
