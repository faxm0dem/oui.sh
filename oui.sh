ouich()
{
	arg1=$1
	list=$(lftp -e 'ls;exit' https://ouich.es/ | awk -F'[/.]' '/tag/{print $2}' | shuf)
	set -- $list
	random=$1
	if [ "$arg1" == "list" ]; then
		echo $list | sort | column
	elif [ -z "$arg1" ]; then
		if [ -n "$random" ]; then
			echo $random
			play mpv --really-quiet https://ouich.es/mp3/${random}.mp3
		else
			play mpv --really-quiet https://ouich.es/random
		fi
	else
		play mpv --really-quiet https://ouich.es/mp3/$1.mp3
	fi
}
