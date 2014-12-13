IMAGES=$(shell find ./ -maxdepth 1 -type d  | grep -E './[a-z]+' | cut -f2 -d'/')
HAS_ID_RSA=$(shell find ./ -iname id_rsa | wc -l)

all:
	echo Make all
        ifeq ($(HAS_ID_RSA),0);echo foo
		 ./genkeys.sh
        endif
	echo ${IMAGES}
	$(foreach image,${IMAGES}, cd ${image} ;  sudo docker build -t ${image} .; cd .. )
	echo "Docker images now are: \n"
	sudo docker images
	echo Tags are: ${IMAGES}

