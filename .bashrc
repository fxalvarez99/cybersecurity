
function mkt() {
	mkdir {nmap,content,scripts,tmp,exploits}
}

function extractPorts() {

	ip_address=$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u)
	open_ports=$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS="/" | xargs | tr ' ' ',')

	echo -e "\n[*] Extracting information..."
	echo -e "\n\t[*] IP address: $ip_address"
	echo -e "\t[*] Open ports: $open_ports\n"

	echo $open_ports | tr -d '\n' | xclip -sel clip
	echo -e "Ports has been copied to clipboard!\n"
}
