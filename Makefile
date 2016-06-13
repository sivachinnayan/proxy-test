# Define required macros here
SHELL = /bin/bash

# Constants 
UBUNTU_UPDATE = sudo apt-get update 
BUILD_ESSENTIALS_CHECKINSTALL = sudo apt-get install build-essentials checkinstall 
BUILD_ESSENTIALS = sudo apt-get install build-essentials 
SQUID = sudo apt-get install squid3 
SKIP_ESSENTIALS = "y"

# Common Messages 
SKIP_MSG = "Skipping ..."
MSG_BUILD_ESG = "build essentials"
MSG_INSTALL_SQUID = "installing squid..."
MSG_CLEANUP = "clean up "
MSG_GET_UPDATE = "running apt-get update"
MSG_INSTALL = "installing.."


install: squid
	@echo ${MSG_INSTALL}


ubuntu-update: 
	@echo ${MSG_GET_UPDATE}
	${UBUNTU_UPDATE}


ubuntu-build-essentials: ubuntu-update
	@echo ${BUILD_ESSENTIALS}
	@if [ ${SKIP_ESSENTIALS} = "y" ]; then\
		echo ${SKIP_MSG};\
	else\
		${BUILD_ESSENTIALS};\
	fi


squid: ubuntu-build-essentials
	@echo ${MSG_INSTALL_SQUID}
	${SQUID}

lint:
	./node_modules/jslint/bin/jslint.js ./proxy.js ./index.js

jslint:
	./node_modules/jscs/bin/jscs ./proxy.js ./index.js --present=airbnb


test-coveralls:
	@NODE_ENV=test ./node_modules/.bin/istanbul cover \
		cat ./coverage/lcov.info | ./node_modules/.bin/coveralls --verbose

clean:
	@echo ${MSG_CLEANUP}


