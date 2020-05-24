# Bash-Ecru
Module based bash framework. \
It is meant to make developing bash-based scripts easier and faster. 

# The modules
Main difference comparing this framework to classical script coding is that you need to develop a new module instead of the script. Although developing a module might seem to be more effort, it is not. You type one command - and you are ready to go. \
One command is enough to have a new module initialized (see below). 

# File structure
Simplified file structure: 
```
Bash-Ecru
├── _Core   - Ecru Framework
├── _dev    - Develop Module: script directory (functions and configuration files)
├── dev.sh  - Develop Module: main script
└── run.sh  - Base runner (for running the modules)
```
Each module consists of two basic elements: 
- main script (its name is passed as argument for `run.sh`)
- script directory (its content is being sourced by the 'main script')

# Running a module
Example: running the module named 'TestModule': 
```bash
./run.sh TestModule
```

# Developer module
Ecru-Framework comes with a 'developer module'. It should be used for following actions: 
### Creating new modules
To create a new module named 'TestModule' please run:
```bash
./run.sh dev init TestModule
```
As a result you will get: 
- `TestModule.sh` - main module script
- `_TestModule` - directory with basic function and configuration examples

### Removing the modules
To remove a module named 'TestModule' please run:
```bash
./run.sh dev rm TestModule
```
It will ask you for a confirmation and remove the module. 

### Packaging whole project
To package whole project to *.tar.gz file, please run:
```bash
./run.sh dev build
```
This is useful for packaging and deployments. \
**NOTE:** Compressed archive (*.tar.gz) will be saved 1 level above the project directory \
**NOTE:** You might want to edit output package name - please check `BUILD_PKG_NAME` setting at: `./_dev/000-Config.sh`


