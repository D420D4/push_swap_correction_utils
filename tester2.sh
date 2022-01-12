for nb in 1 2 3 4 5 8 10 12 16 20 25 30 32 50 64 75 100 150 250 500; do
	max=0
	for i in $(seq 1 1 25); do
		ARG=`ruby -e "puts (1..99999).to_a.sample($nb).join(' ')"`;
		ins=`./push_swap $ARG | wc -l`
		r=`./push_swap $ARG | ./checker_linux $ARG`
		max=$((max < ins ? ins : max))
	done
	if [ "$r" = "OK" ]; then
		tput setaf 2;
	else
		tput setaf 1;
	fi
	printf "%-5d : %-5d \n" $nb $max

done
