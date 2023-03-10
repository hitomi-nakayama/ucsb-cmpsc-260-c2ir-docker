# c2ir-docker

This dockerfile and script allow you to run a containerized version of `c2ir`.
This project is intended for those who are running a *nix system but are unable
to run the ll2ir binary natively.

## Installation

Build the Docker image.

```sh
docker build -t c2ir .
```

## Usage

```sh
./run-c2ir.sh my-file.c
```

This script will automatically create a docker container, process the .c
file, and output the result into the same directory as the .c file.

Note: The `./run-c2ir.sh` script will mount `my-file.c`'s entire parent
directory inside of the docker container. Do not run this on a file located
inside of an important directory.
