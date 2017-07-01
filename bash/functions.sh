## FUNCTIONS

function genp() {
	tr -dc [:alnum:][:punct:] < /dev/urandom | head -c ${1:-10} | xargs -0
}

function dumphttplinks() {
	lynx -dump "$1" | awk '/http/{print $2}' > temp.txt
	grep '.sub\|.jpg\|.ass\|.mkv\|.mp4\|.flac\|.mp3\|.avi\|.wmv\|.srt' temp.txt >> list
	rm temp.txt
}
alias dump=dumphttplinks


function chkgit() {
	wd="$(pwd)"
	cd ~/git &&
	for i in $(ls)
	do
		cd $i
		echo -e "Checking $i ..."
		git pull && echo
		cd ..
	done
	cd $wd
}

function spundrscr() {
for f in *\ *; do mv "$f" "${f// /_}"; done
}

function mpvr() {
if [[ -z "$1" ]];
then
	mpv -vo vdpau $(find . -name '*.mp4' -o -name '*.mkv' -o -name '*.wmv' -o -name '*.avi' | sort -R);
else
	mpv -vo vdpau $(find $1 -name '*.mp4' -o -name '*.mkv' -o -name '*.wmv' -o -name '*.avi' | sort -R);

fi
}

function pi(){
echo "scale=$1; 4*a(1)"| bc -l
}

function whatdidiupgrade(){
	if [[ $1 == "today" ]];
	then
		grep $(date +%Y-%m-%d) /var/log/pacman.log | grep upgraded;
	elif [[ $1 == "yesterday" ]];
	then
		grep $(date --date="1 days ago" +%Y-%m-%d) /var/log/pacman.log | grep upgraded;
	elif [[ $1 == "recently" ]];
	then
		grep $(date --date="7 days ago" +%Y-%m-%d) /var/log/pacman.log | grep upgraded;
	else
		grep upgraded /var/log/pacman.log;
	fi
}

function sub() {
	f=$1
	mkvmerge -o "${f%.*}_eng.${f##*.}" "$1" "$2" &&
	rm "$1" "$2"
}

function wgetl() {
	wget -c -i "$1"
}

function zz() {
	f=$1
	unzip $f -d ${f%.*}
}

function convert_to_flac() {
	 for i in $(ls |grep ".$1"); do ffmpeg -i $i -f flac ${i%.$1}.flac; done
	 rm *.$1
}
