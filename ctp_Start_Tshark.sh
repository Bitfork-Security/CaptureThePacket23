 
#This starts tshark against the wifi interface, creating files capped at 100kb in size, and stops capturing after 10 files.
tshark -i enp0s25 -a filesize:250000 -a files:800 -w capture
