 
#This starts tshark against the wifi interface, creating files capped at 100kb in size, and stops capturing after 10 files.
tshark -i wlo1 -a filesize:100 -a files:10 -w capture