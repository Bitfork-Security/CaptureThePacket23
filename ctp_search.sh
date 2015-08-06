#(x=$(ls capture*); tshark -Y dns -r "$x")

# This code works for outputting to screen.
#x="$(ls capture*)"
#printf %s "$x" | while IFS= read -r line
#do

#	tshark -Y dns -r "$line";
#done


# This code is for trying to notify which file matched parameters.
#echo " " > results.log;
#x="$(ls capture*)"
#pattern="dns"
#pattern="ip.dst == 74.125.224.67"
#printf %s "$x" | while IFS= read -r line
#do
	#echo $line;
#	varRaw="$(tshark -Y "$pattern" -r "$line")"
	
#	varLen="$(echo ${#varRaw})"
	#echo $varLen;
	
#	if [ $varLen -gt 0 ]
#	then
#	  echo $line >> results.log;
#	  echo $pattern >> results.log;
#	  echo " " >> results.log;
#	fi
	
#done



# Adding double loop to work through each search parameter and each file.

# Clear file.
echo " " > results.log;

# Grab search strings.
patterns="$(cat ctp_strings_to_search.txt)"

#echo $patterns #debug
#Start outer loop of search strings.
printf %s "$patterns" | while IFS= read -r pattern
do
  echo $patterns
  

  x="$(ls capture*)"
  #echo $pattern #debug line
  
  #Start inner loop of files.
  printf %s "$x" | while IFS= read -r line
  do
	#echo $line;
	varRaw="$(tshark -Y "$pattern" -r "$line")"
	
	varLen="$(echo ${#varRaw})"
	#echo $varLen;
	
	if [ $varLen -gt 0 ]
	then
	  echo $line >> results.log;
	  echo $pattern >> results.log;
	  echo " " >> results.log;
	fi
	
  done #Finish inner loop

done #Finish outer loop

clear
cat results.log











