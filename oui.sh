ouich ()
{
	if [ "$1" == "list" ]; then
		lftp -e 'ls;exit' https://ouich.es/ | awk -F/ '/tag/{print $2}' | sort | column;
	else
		if [ -z "$1" ]; then
			tag=$(curl -s https://ouich.es/random -I | awk -F': ' '$1 == "Location" {print $2}');
			if [ -n "$tag" ]; then
				echo $tag;
				play mpv --really-quiet https://ouich.es$tag;
			else
				play mpv --really-quiet https://ouich.es/random;
			fi;
		else
			play mpv --really-quiet https://ouich.es/mp3/$1.mp3;
		fi;
	fi
}
