# Kaggle Data Science Bowl 2017, 3rd winning model by Aidence

See [general README](../README.md) first.

### Steps

* [Inspecting environment](#inspecting-environment)
* [Setting up the system environment](#setting-up-the-system-environment)
* [Compiling Python](#compiling-python)

## Step-by-step guide (for myself, lol (not really, lol))0

### Inspecting environment

Let's inspect:
* We have an access to the supercomputer
* Together with us there're uncountable number of users
* ...
* Front machine is a CentOS Linux 7
* There's GNU compilers for C/C++ (and, maybe, for other languages)
* There's CUDA version 8 and 9 drivers
* There's no Docker... Wait, what?!?
* ...
* We need own Python for independence from the default one
* We need to use Python environments for isolation (I still want the Docker!1)
* We need a tool for 7zip files (Yes, Kaggle's datasets in 7zip archives...)
* ...
* OMG, we have `wget`

OK. Let's create the directory for our project and start environment
preparation.

```bash
$ mkdir $HOME/kaggle-data-science-bowl-2017-aidence-model
$ cd $HOME/kaggle-data-science-bowl-2017-aidence-model
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

```bash
$ mkdir bin
$ mkdir datasets
$ mkdir sources
```

```bash
$ touch init
```

### Setting up the system environment

We already has NVIDIA drivers, CUDA binaries and libraries. But default
environment variables uses CUDA version 8. What kind of dinosaurs uses that...
Replace!  
If you don't have all the drivers, install it by googling.
Paths are correct for the supercomputer. You should find these by yourself.

```bash
$ cd $HOME/kaggle-data-science-bowl-2017-aidence-model
```

```bash
$ vi init
```

```bash
# Replace some envs

# Set newer CUDA binaries
export PATH=/opt/cuda/cuda-9.0/bin:$PATH

# Set newer CUDA libraries
export LD_LIBRARY_PATH=/opt/cuda/cuda-9.0/lib64:$LD_LIBRARY_PATH

# Set newer CUDA home
export CUDA_HOME=/opt/cuda/cuda-9.0

# Set Nvidia drivers libraries
export LD_LIBRARY_PATH=/opt/cuda/nvidia-libs-346.96/lib64:$LD_LIBRARY_PATH
```

Save and close (just a reminder: `:wq`).

### Compiling Python

Authors of the model had used Python 3.4, but pointed that we can use higher
versions. The latest one is Python 3.6.5.

```bash
$ cd $HOME/kaggle-data-science-bowl-2017-aidence-model/sources
```

Download it (did you remember, that we have `wget`?):

```bash
$ wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tgz
```

Extract:

```bash
$ tar xvf Python-3.6.5.tgz
```

Move to the extracted `Python-3.6.5` directory:

```bash
$ cd Python-3.6.5
```

Configure the build. We need the custom installation directory. It can be
specified with a `--prefix` option.

Create this directory:

```bash
$ mkdir $HOME/kaggle-data-science-bowl-2017-aidence-model/bin/python-3.6.5
```

And configure:

```bash
$ ./configure --prefix=$HOME/kaggle-data-science-bowl-2017-aidence-model/bin/python-3.6.5
```

Build, test, and install Python:

```bash
$ make
$ make test
$ make install
```

It should be OK...  
Except the fact that there's many errors on a test stage...  
Just... just forget about this.  
It will work, I promise...  
It should...  
It must...

Check that Python works as expected:

```bash
$ $HOME/kaggle-data-science-bowl-2017-aidence-model/bin/python-3.6.5/bin/python3
```

```python
Python 3.6.5 (default, Apr 16 2018, 16:21:10)
[GCC 4.8.5 20150623 (Red Hat 4.8.5-4)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

It works!

Now any calls to `python3` should run our compiled Python. Change the `init` file:

```bash
$ cd $HOME/kaggle-data-science-bowl-2017-aidence-model
```

```bash
vi init
```

Add the following:

```bash
# Set default Python installation
export PATH=$HOME/kaggle-data-science-bowl-2017-aidence-model/bin/python-3.6.5/bin:$PATH
```

Save and close.

Try to source our `init` script:

```bash
$ . ./init
```

Now you should able to call `python3`, that runs our compiled Python.

```bash
$ which python3
~/kaggle-data-science-bowl-2017-aidence-model/bin/python-3.6.5/bin/python3
```

All right.
