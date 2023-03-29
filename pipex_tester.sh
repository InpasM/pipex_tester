#! /bin/bash

YELB='\033[1;33m'

BLK='\033[0;30m'

BWHT='\033[1;37m'
BRED='\033[1;31m'
BGRN='\033[1;32m'

NOCOLOR='\033[0m'

##### ARGUMENTS #####
if [[ "$1" == "leaks" ]]
then
	LEAKS=1
else
	LEAKS=0
fi

# mkdir
mkdir -p files/tmp_files/
sleep 0.1

SLEEP=0.1

INVALID_FILE="files/invalidfile"
INVALID_FOLDER="invalid_folder/file_og"
FILE1="files/file1"
FILE2="files/file2"
TMP_OG="files/tmp_files/file_og"
TMP_PIPEX_CLASSIC="files/tmp_files/file_pipex_classic"
TMP_PIPEX_LIMITER="files/tmp_files/file_pipex_limiter"

NAME_TEST_CLASSIC=( "file_in invalid"
					"command 1 invalid"
					"command 2 invalid"
					"file_out invalid"
					"file_in & command 1 invalid"
					"all invalid (2cmd 2file)"
					"command 1 empty"
					"command 2 empty"
					"command 1 and 2 both empty"
					"all invalid (3cmd 2file)"
					"all invalid (4cmd 2file)"
					"test with time and multiple sleep 1"
					"without env"
					)

CMD_BASH_01=(  "< $INVALID_FILE cat | wc > $TMP_OG"
			"< $FILE1 caet | wc > $TMP_OG"
			"< $FILE1 cat | wec > $TMP_OG"
			"< $FILE1 cat | wc > $INVALID_FOLDER"
			"< $INVALID_FILE caet | wc > $TMP_OG"
			"< $INVALID_FILE caet | wec > $INVALID_FOLDER"
			"< $FILE1 \"\" | wc > $TMP_OG"
			"< $FILE1 cat | \"\" > $TMP_OG"
			"< $FILE1 \"\" | \"\" > $TMP_OG"
		)

CMD_PIPEX_01=(  ".././pipex $INVALID_FILE cat wc $TMP_PIPEX_CLASSIC"
			".././pipex $FILE1 caet wc $TMP_PIPEX_CLASSIC"
			".././pipex $FILE1 cat wec $TMP_PIPEX_CLASSIC"
			".././pipex $FILE1 cat wc $INVALID_FOLDER"
			".././pipex $INVALID_FILE caet wc $TMP_PIPEX_CLASSIC"
			".././pipex $INVALID_FILE caet wec $INVALID_FOLDER"
			".././pipex $FILE1 \"\" wc $TMP_PIPEX_CLASSIC"
			".././pipex $FILE1 cat \"\" $TMP_PIPEX_CLASSIC"
			".././pipex $FILE1 \"\" \"\" $TMP_PIPEX_CLASSIC"
		)

NAME_TEST_02=( 		"cat | wc"
					"wc | cat"
					"ls | wc"
					"ls | cat"
					"ls -la | wc"
					"ls -la | cat"
					"pwd | wc"
					"pwd | cat"
					)

CMD_BASH_02=(  	"< $FILE1 cat | wc > $TMP_OG"
				"< $FILE1 wc | cat > $TMP_OG"
				"< $FILE1 ls | wc > $TMP_OG"
				"< $FILE1 ls | cat > $TMP_OG"
				"< $FILE1 ls -la | wc > $TMP_OG"
				"< $FILE1 ls -la | cat > $TMP_OG"
				"< $FILE1 pwd | wc > $TMP_OG"
				"< $FILE1 pwd | cat > $TMP_OG"
		)

CMD_PIPEX_02=(  ".././pipex $FILE1 cat wc $TMP_PIPEX_CLASSIC"
				".././pipex $FILE1 wc cat $TMP_PIPEX_CLASSIC"
				".././pipex $FILE1 ls wc $TMP_PIPEX_CLASSIC"
				".././pipex $FILE1 ls cat $TMP_PIPEX_CLASSIC"
				".././pipex $FILE1 \"ls -la\" wc $TMP_PIPEX_CLASSIC"
				".././pipex $FILE1 \"ls -la\" cat $TMP_PIPEX_CLASSIC"
				".././pipex $FILE1 pwd wc $TMP_PIPEX_CLASSIC"
				".././pipex $FILE1 pwd cat $TMP_PIPEX_CLASSIC"
		)


NAME_TEST_BONUS=( 	"cat | wc"
					"wc | cat"
					"ls | wc"
					"ls | cat"
					"ls -la | wc"
					"ls -la | cat"
					"pwd | wc"
					"pwd | cat"
					"file_in invalid"
					"command 1 invalid"
					"command 2 invalid"
					"file_out invalid"
					"file_in & command 1 invalid"
					"all invalid (2cmd 2file)"
					"command 1 empty"
					"command 2 empty"
					"command 1 and 2 both empty"
					)	

CMD_BASH_BONUS_01=( "< $FILE1 cat | wc > $TMP_OG"
					"< $FILE1 wc | cat > $TMP_OG"
					"< $FILE1 ls | wc > $TMP_OG"
					"< $FILE1 ls | cat > $TMP_OG"
					"< $FILE1 ls -la | wc > $TMP_OG"
					"< $FILE1 ls -la | cat > $TMP_OG"
					"< $FILE1 pwd | wc > $TMP_OG"
					"< $FILE1 pwd | cat > $TMP_OG"
					"< $INVALID_FILE cat | wc > $TMP_OG"
					"< $FILE1 caet | wc > $TMP_OG"
					"< $FILE1 cat | wec > $TMP_OG"
					"< $FILE1 cat | wc > $INVALID_FOLDER"
					"< $INVALID_FILE caet | wc > $TMP_OG"
					"< $INVALID_FILE caet | wec > $INVALID_FOLDER"
					"< $FILE1 \"\" | wc > $TMP_OG"
					"< $FILE1 cat | \"\" > $TMP_OG"
					"< $FILE1 \"\" | \"\" > $TMP_OG"
		)

CMD_PIPEX_BONUS_01=(  	".././pipex $FILE1 cat wc $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 wc cat $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 ls wc $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 ls cat $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 \"ls -la\" wc $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 \"ls -la\" cat $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 pwd wc $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 pwd cat $TMP_PIPEX_CLASSIC"
						".././pipex $INVALID_FILE cat wc $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 caet wc $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 cat wec $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 cat wc $INVALID_FOLDER"
						".././pipex $INVALID_FILE caet wc $TMP_PIPEX_CLASSIC"
						".././pipex $INVALID_FILE caet wec $INVALID_FOLDER"
						".././pipex $FILE1 \"\" wc $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 cat \"\" $TMP_PIPEX_CLASSIC"
						".././pipex $FILE1 \"\" \"\" $TMP_PIPEX_CLASSIC"
		)

# TESTER HARDCORE
# .././pipex "/dev/urandom" "cat" "head -n 5" outfile
# .././pipex infile "cat /dev/urandom" "head -n 5" outfile
# .././pipex infile "." "." outfile
# .././pipex infile "." "./" outfile


# ORIGINAL_CLASSIC=(   "bash -c '< $INVALID_FILE cat | wc > $TMP_OG'" 
# 			"bash -c '< $INVALID_FILE caet | lse | wec > $INVALID_FOLDER'"
# 			"bash -c '< $INVALID_FILE caet | grop | lse | wec > $INVALID_FOLDER'"
# 			"bash -c 'time < $FILE1 cat | grep de | wc | sleep 1 | sleep 1 | sleep 1 > $TMP_OG | printf \"\n\"'"
# 			)

# PIPEX_CLASSIC=( "bash -c '.././pipex $INVALID_FILE cat wc $TMP_PIPEX_CLASSIC'" 
# 				"bash -c '.././pipex $INVALID_FILE caet lse wec $INVALID_FOLDER'"
# 				"bash -c '.././pipex $INVALID_FILE caet grop lse wec $INVALID_FOLDER'"
# 				"bash -c 'time .././pipex $FILE1 cat \"grep de\" wc \"sleep 1\" \"sleep 1\" \"sleep 1\" $TMP_OG'"
# 				)


NAME_TEST_BONUS=(   "cat wc"
					"command 1 invalid"
					)

MAKE_V=("re" "rebonus")

PRINT_CATEGORY()
{
	NAME=$1
	printf "${BLK}\n# ###################################### #\n"
	printf "#$BWHT		   TESTS	 	 $BLK#\n"
	printf "#$BWHT		%s		 $BLK#\n" "$NAME"
	printf "# ###################################### #$NOCOLOR\n\n"
}

CHECK_ERROR()
{
	BASH=$1
	PIPEX=$2
	NAME_CHECK=$3
	TEST_BASH=$4
	TEST_PIPEX=$5

	if [[ "$BASH" == "$PIPEX" ]]
	then
		printf "\n${BGRN}${NAME_CHECK}OK${NOCOLOR}\n"
	else
		printf "\n${BRED}${NAME_CHECK}KO${NOCOLOR}\n"
		printf "${BLK}BASH:	%s${NOCOLOR}\n" "$TEST"
		printf "%s\n" "$BASH"
		printf "${BLK}PIPEX:	%s${NOCOLOR}\n" "$TEST"
		printf "%s\n\n" "$PIPEX"
	fi
	# printf "${BLK}BASH:	%s${NOCOLOR}\n" "$TEST_BASH"
	# printf "%s\n" "$BASH"
	# printf "${BLK}PIPEX:	%s${NOCOLOR}\n" "$TEST_PIPEX"
	# printf "%s\n" "$PIPEX"
}

$(norminette > /dev/null 2>&1)
if [ "$?" -gt "0" ]
then
	CHECK_NORM="\n${BRED}NORME: KO${NOCOLOR}\n"
else
	CHECK_NORM="\n${BGRN}NORME: OK${NOCOLOR}\n"
fi

make -s ${MAKE_V[0]} -C ../
clear


PRINT_CATEGORY "PIPEX CLASSIC"
sleep $SLEEP
i=0
while [ $i -ne ${#CMD_BASH_02[@]} ]
do
	DISPLAY_BASH=$(eval "bash -c '${CMD_BASH_02[i]}'" 2>&1)
	DISPLAY_PIPEX=$(eval "bash -c '${CMD_PIPEX_02[i]}'" 2>&1)
	if [[ "$LEAKS" == 1 ]]
	then
		# echo "Test with leaks"
		DISPLAY_LEAKS_BASH=$(eval "bash -c 'valgrind --leak-check=full --trace-children=yes ${CMD_BASH_02[i]}'" 2>&1)
		DISPLAY_LEAKS_PIPEX=$(eval "bash -c 'valgrind --leak-check=full --trace-children=yes ${CMD_PIPEX_02[i]}'" 2>&1)
	fi

	SUB='line 1: '
	if [[ "$DISPLAY_BASH" == *"$SUB"* ]]
	then
		SHORT_BASH=$(sed s/"$SUB"// <<< "$DISPLAY_BASH")
	else
		SHORT_BASH=$DISPLAY_BASH
	fi
	printf "\n\n${YELB}Test nº$i :	${NAME_TEST_02[i]}${NOCOLOR}\n\n"

	BASH_FILE=$(<files/tmp_files/file_og)
	PIPEX_FILE=$(<files/tmp_files/file_pipex_classic)

	CHECK_ERROR "$SHORT_BASH" "$DISPLAY_PIPEX" "ERR_MSG: " "${CMD_BASH_02[i]}" "${CMD_PIPEX_02[i]}"
	CHECK_ERROR "$BASH_FILE" "$PIPEX_FILE" "OUTPUT_FILE: " "output file:" "output file:"
	if [[ "$LEAKS" == 1 ]]
	then
		CHECK_ERROR "$DISPLAY_LEAKS_BASH" "$DISPLAY_LEAKS_PIPEX" "LEAKS: " "BASH" "PIPEX"
	fi

	# printf "\n%s\n" "$DISPLAY_LEAKS_PIPEX"
	# HEAP_SUM=$(echo $DISPLAY_LEAKS | tr "H")
	# echo $DISPLAY_LEAKS |

	i=$((i+1))
	sleep $SLEEP
done


PRINT_CATEGORY "PIPEX CLASSIC: ERROR"
sleep $SLEEP
i=0
while [ $i -ne ${#CMD_BASH_01[@]} ]
do
	DISPLAY_BASH=$(eval "bash -c '${CMD_BASH_01[i]}'" 2>&1)
	DISPLAY_PIPEX=$(eval "bash -c '${CMD_PIPEX_01[i]}'" 2>&1)
	if [[ "$LEAKS" == 1 ]]
	then
		DISPLAY_LEAKS_PIPEX=$(eval "bash -c 'valgrind --leak-check=full --trace-children=yes ${CMD_PIPEX_01[i]}'" 2>&1)
	fi

	SUB='line 1: '
	if [[ "$DISPLAY_BASH" == *"$SUB"* ]]
	then
		SHORT_BASH=$(sed s/"$SUB"// <<< "$DISPLAY_BASH")
	else
		SHORT_BASH=$DISPLAY_BASH
	fi
	printf "\n\n${YELB}Test nº$i :	${NAME_TEST_CLASSIC[i]}${NOCOLOR}\n\n"

	BASH_FILE=$(<files/tmp_files/file_og)
	PIPEX_FILE=$(<files/tmp_files/file_pipex_classic)

	CHECK_ERROR "$SHORT_BASH" "$DISPLAY_PIPEX" "ERR_MSG: " "${CMD_BASH_01[i]}" "${CMD_PIPEX_01[i]}"
	CHECK_ERROR "$BASH_FILE" "$PIPEX_FILE" "OUTPUT_FILE: " "output file:" "output file:"
	
	if [[ "$LEAKS" == 1 ]]
	then
		printf "\n%s\n" "$DISPLAY_LEAKS_PIPEX"
	fi

	i=$((i+1))
	sleep $SLEEP
done

PRINT_CATEGORY "NO ENV PATH"
sleep $SLEEP
i=0
while [ $i -ne ${#CMD_BASH_01[@]} ]
do
	# DISPLAY_BASH=$(eval "bash -c  'unset PATH && ${CMD_BASH_01[i]}'" 2>&1)
	DISPLAY_BASH=$(eval "bash -c  'unset PATH && ${CMD_BASH_01[i]}'" 2>&1)
	DISPLAY_PIPEX=$(eval "bash -c 'env -i ${CMD_PIPEX_01[i]}'" 2>&1)
	if [[ "$LEAKS" == 1 ]]
	then
		DISPLAY_LEAKS_PIPEX=$(eval "bash -c 'valgrind --leak-check=full --trace-children=yes env -i ${CMD_PIPEX_01[i]}'" 2>&1)
	fi

	SUB='line 1: '
	if [[ "$DISPLAY_BASH" == *"$SUB"* ]]
	then
		SHORT_BASH=$(sed s/"$SUB"// <<< "$DISPLAY_BASH")
	else
		SHORT_BASH=$DISPLAY_BASH
	fi
	printf "\n\n${YELB}Test nº$i :	${NAME_TEST_CLASSIC[i]}${NOCOLOR}\n\n"

	BASH_FILE=$(<files/tmp_files/file_og)
	PIPEX_FILE=$(<files/tmp_files/file_pipex_classic)

	CHECK_ERROR "$SHORT_BASH" "$DISPLAY_PIPEX" "ERR_MSG: " "${CMD_BASH_01[i]}" "${CMD_PIPEX_01[i]}"
	CHECK_ERROR "$BASH_FILE" "$PIPEX_FILE" "OUTPUT_FILE: " "output file:" "output file:"
	
	if [[ "$LEAKS" == 1 ]]
	then
		printf "\n%s\n" "$DISPLAY_LEAKS_PIPEX"
	fi

	i=$((i+1))
	sleep $SLEEP
done

make -s ${MAKE_V[0]} -C ../

PRINT_CATEGORY "PIPEX BONUS"
sleep $SLEEP
i=0
while [ $i -ne ${#CMD_BASH_BONUS_01[@]} ]
do
	DISPLAY_BASH=$(eval "bash -c '${CMD_BASH_BONUS_01[i]}'" 2>&1)
	DISPLAY_PIPEX=$(eval "bash -c '${CMD_PIPEX_BONUS_01[i]}'" 2>&1)
	if [[ "$LEAKS" == 1 ]]
	then
		DISPLAY_LEAKS_BASH=$(eval "bash -c 'valgrind --leak-check=full --trace-children=yes ${CMD_BASH_BONUS_01[i]}'" 2>&1)
		DISPLAY_LEAKS_PIPEX=$(eval "bash -c 'valgrind --leak-check=full --trace-children=yes ${CMD_PIPEX_BONUS_01[i]}'" 2>&1)
	fi

	SUB='line 1: '
	if [[ "$DISPLAY_BASH" == *"$SUB"* ]]
	then
		SHORT_BASH=$(sed s/"$SUB"// <<< "$DISPLAY_BASH")
	else
		SHORT_BASH=$DISPLAY_BASH
	fi
	printf "\n\n${YELB}Test nº$i :	${NAME_TEST_BONUS[i]}${NOCOLOR}\n\n"

	BASH_FILE=$(<files/tmp_files/file_og)
	PIPEX_FILE=$(<files/tmp_files/file_pipex_classic)

	CHECK_ERROR "$SHORT_BASH" "$DISPLAY_PIPEX" "ERR_MSG: " "${CMD_BASH_BONUS_02[i]}" "${CMD_PIPEX_BONUS_02[i]}"
	CHECK_ERROR "$BASH_FILE" "$PIPEX_FILE" "OUTPUT_FILE: " "output file:" "output file:"

	if [[ "$LEAKS" == 1 ]]
	then
		printf "\n%s\n" "$DISPLAY_LEAKS_PIPEX"
	fi

	i=$((i+1))
	sleep $SLEEP
done

printf "${CHECK_NORM}"

# remove folder tmp
rm -rf files/tmp_files