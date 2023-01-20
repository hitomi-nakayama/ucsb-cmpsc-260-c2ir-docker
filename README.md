# c2ir-docker

This dockerfile and script allow you to run a containerized version of `c2ir`.
This project is intended for those running on a *nix system who are unable to
run the ll2ir binary natively.

## Installation

Build the Docker image.

```sh
docker build -t c2ir .
```

## Usage

```sh
./run-c2ir.sh my-file.c
```

Note: The `./run-c2ir.sh` script will mount `my-file.c`'s entire parent
directory inside of the docker container. Do not run this on a file located
inside of an important directory.
