# Gets standardin

# Retrieves the number of lines in a file or stdin
get_file_lines(){
  cat $1  | wc -l
}

get_std_in(){
   echo "$(cat)"
}

#compares stdin value with expected value in option e
#example use case below:  true as dog==dog
# echo dog | assert_stdin_is_equal -e dog
assert_stdin_is_equal_to(){
  while getopts "e:" opt; do
  case ${opt} in
    e )
      expected=$OPTARG
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))

stdin=$(get_std_in)

#debug
#echo $stdin
#echo $expected

if [ "$stdin" = "$expected" ]; then
   echo true
else
   echo "$stdin" >> DEBUG
fi

}

#compares stdin len with expected value in option e
#example use case
# echo dog | assert_len_stdin_is_greater_than -e 4
assert_len_stdin_is_greater_than(){
  while getopts "e:" opt; do
  case ${opt} in
    e )
      target=$OPTARG
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))

stdin=$(get_std_in)


if [[ "${#stdin}" -gt "$target" ]]; then
   echo true
else
   echo false
fi

}


