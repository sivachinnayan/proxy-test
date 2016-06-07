# Define required macros here
SHELL = /bin/sh

UBUNTU_UPDATE = sudo apt-get update 
BUILD_ESSENTIALS = sudo apt-get install build-essentials 
SQUID = sudo apt-get install squid3

install: squid
	@echo installing..

ubuntu-update: 
	@echo apt-get update
	${UBUNTU_UPDATE}

ubuntu-build-essentials: ubuntu-update
	@echo build essentials
	${BUILD_ESSENTIALS}

squid: ubuntu-build-essentials
	@echo installing squid...
	${SQUID}

clean:
	@echo cleanup ..