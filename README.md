# Kaggle Data Science Bowl 2017, 3rd winning model by Aidence

This repo created only for education purposes and it isn't affiliated with
original authors of the model.

Repository contains Dockerfiles and scripts for easy starting w/ this model in
any clean (or not) environment, with Docker and Nvidia drivers.

### Note

Unfortunately, these dockerfiles turned out to be unnecessary for the reason
that there wasn't Docker on
[the Lomonosov-2 supercomputer of the Moscow State University](http://parallel.ru/cluster),
where the model was finally launched. You can use this dockerfiles, but Idk, is
this dockerfiles are correct or not.

All that's related to the launch of this model on the MSU supercomputer is
described in the
[README file in `msu-supercomputer`](msu-supercomputer/README.md) (see repo
files list).

### Getting started

#### Cloning

Clone the repo:

```
$ git clone https://github.com/narimansafiulin/kaggle-data-science-bowl-2017-aidence-model.git
```

#### Preparing host machine

Nvidia drivers should be installed yet.

Docker and Docker-Nvidia can be installed with a `init` script. Depends on the
system, run the `init.centos-rhel` or `init.debian` script:

```
$ ./scripts/init.debian.sh
```

#### Bulding Docker image

Building is separated into two steps:
* Building the system environment, based on `nvidia/cuda` Docker image version
`9.0`, with a `devel` extensions and `cudnn7`. This image named as
`aidence-sys`;
* Building final image, which named as `aidence`.

This process can be done with a `build` script:

```
$ ./scripts/build.sh
```

#### Running Docker container

A container can be started by `run` script:

```
$ ./scripts/run.sh
```

It starts the Jupyter Notebook and prints you a token.  
This scripts exposes port `8888` to the host machine for accessing Jupyter. If
needed, you should open this port in a firewall. Or simply open a SSH tunnel.  
After that, you can access and use terminal via Jupyter.

The container will be named as `aidence-container`. That's needed for `stop`
script.

#### Stopping Docker container

The container can be stopped by `stop` script:

```
$ ./scripts/stop.sh
```

The container will be removed at all.

### Links

* 3rd winning model by Aidence sources repo - https://bitbucket.org/aidence/kaggle-data-science-bowl-2017
* Kaggle Data Science Bowl 2017 contest page - https://www.kaggle.com/c/data-science-bowl-2017
* The Lung Image Database Consortium image collection (LIDC-IDRI) - https://wiki.cancerimagingarchive.net/display/Public/LIDC-IDRI

### License

License is inherited, GNU GPL v3.0 (see LICENSE)
