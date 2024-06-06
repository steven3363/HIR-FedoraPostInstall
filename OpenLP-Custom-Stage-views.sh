#/bin/bash

echo "This will install OpenLP Custom stage views from steven3363 git hub."
echo "You will need to run OpenLP first to initialise the directories. Once done Press Y to continue."
read -p "Have you yun OpenLP at least once (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        
	#download and install custom stage views
	wget https://github.com/steven3363/OpenLP-v3-Custom-Stage-Views/archive/refs/heads/main.zip
	unzip main.zip
	cd OpenLP-v3-Custom-Stage-Views-main
	#copy to the default location
	#check if exists
	curdir=$(pwd)
	echo "This is the cur dir $curdir"
	
	
		basename=$HOME
		basename+='/.local/share/openlp'
		dirname=$basename
		dirname+="/stages"
		

	if [ -d $dirname ]; then
  	  	echo "The stages directory exists it has been backed up to stages-old"
  	  	buname=$basename
  	  	buname+="/stages-old"
  	  	
  	  	rm -rf $buname #erase if bu already
  	  	mv  $dirname  $buname
		
	fi
	
	mv stages $basename
	#remove downloded
	cd ..
	rm -rf OpenLP-v3-Custom-Stage-Views-main
	rm main.zip

    ;;
    * )
        
    ;;
esac



