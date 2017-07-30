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

function pi(){
echo "scale=$1; 4*a(1)"| bc -l
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
	rm $1
}
