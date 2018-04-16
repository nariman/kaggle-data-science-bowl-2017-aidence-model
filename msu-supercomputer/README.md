# Kaggle Data Science Bowl 2017, 3rd winning model by Aidence

See [general README](../README.md) first.

### Steps

* [Inspecting environment](#inspecting-environment)

## Step-by-step guide (for myself, lol (not really, lol))

### Inspecting environment

Let's inspect:
* We have an access to the supercomputer
* Together with us there're uncountable number of users
* ...
* There's GNU compilers for C/C++ (and, maybe, for other languages)
* There's CUDA version 8 and 9 drivers
* There's is no Docker...
* ...
* We need own Python for independence of the default one
* We need to use Python environments for isolation (I still want the Docker!1)
* We need a tool for 7zip files (Yes, Kaggle's datasets in a 7zip archives...)
* ...
* OMG, we have `wget`

OK. Let's create the directory for our project and start environment
preparation.

```
mkdir kaggle-data-science-bowl-2017-aidence-model
cd kaggle-data-science-bowl-2017-aidence-model
```

Our directory structure:

* `bin` - for compiled sources
* `datasets` - for datasets
    * `kaggle` - for Kaggle datasets
    * `lidc` - for lidc datasets
* `sources` - for downloaded sources to compile
* `venv` - for our virtual Python environment

Also there should be a file for system environment additions. I'll name it as
`init`.

```
mkdir bin
mkdir datasets
mkdir sources
```

```
touch init
```
