get_file_lines(){
  cat $1  | wc -l

}

get_std_in(){
   echo "$(cat)"
}

format_assert_error(){
    echo Expected $1 Got $2
}

assert_int_equals(){
   if [ "$1" -eq "$2" ]; then
      echo true >OUTPUT
   else
      echo false >OUTPUT
      format_assert_error $1 $2
   fi
}
