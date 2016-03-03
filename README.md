# Deploy script for the ITONK course at Aarhus University School of Engineering. 

To use this tool, clone the repository on your Raspberry Pi. The repository contains two files: 
* Dockerfile - specify where the jar is supposed to be copied
* deploy-docker-hub.sh - the script itself

## Usage
```bash
sh deploy-docker-hub.sh --version=<VERSION NUMBER> --repo=<DOCKER HUB REPOSITORY>
```

**NB!: Rename your jar file to be app.jar**
