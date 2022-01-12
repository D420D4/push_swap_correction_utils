r="OK";
while [ "$r" = "OK" ]; do

	ARG=`ruby -e "puts (1..$1).to_a.shuffle.join(' ')"`;
   	nb=`./push_swap $ARG | wc -l`	
	ARG=`echo "$ARG"`
	r=`./push_swap $ARG | ./checker_linux $ARG`
	if [ "$r" = "OK" ]; then
		tput setaf 2;
	else
		tput setaf 1;
	fi
	printf "$ARG"
	printf "  : "
	printf $nb
	printf "\n"

done
