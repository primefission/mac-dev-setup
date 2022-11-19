# Python Setup

Setup project MYPROJ in github
git clone MYPROJ
cd MYPROJ

### pyenv setups

```sh
#check list of pyenv and install as necessary (this is actually the after view...)
>pyenv versions
  system
  3.10.6
* 3.11.0 (set by /Users/dev/git/MYPROJ/.python-version)
# Install other verion of python (global install) as necessary
>pyenv install 3.11
# Set local python version inside your project (as cd into directory alrady)
MYPROJ>pyenv local 3.111
# view the new local versions
MYPROJ>pyenv local
3.11
#double check actual python version
>python -V
Python 3.11.0
```

### Poetry setup
```sh
#setup poetry to use the local pyenv envuronment configured above
>poetry env use python
#setup the pyproject.toml
>poetry init

#add dependencies
>poetry add tox -G dev
>poetry add pytest -G dev

#start a shell (then run vscode from this shell)
>poetry shell
```


### Tox Setup
``` ini
[tox]
skipsdist = true
envlist = py11

[testenv]
whitelist_externals = poetry
commands =
    poetry install -v
    poetry run pytest tests/
```