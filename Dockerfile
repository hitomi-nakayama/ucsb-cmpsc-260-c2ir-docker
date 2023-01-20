FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    clang-14 \
    libgoogle-glog-dev \
    lld \
    git

WORKDIR /root

RUN [ "ln", "-s", "/usr/lib/llvm-14/bin/opt", "/usr/bin/opt" ]
RUN [ "ln", "-s", "/usr/bin/clang-14", "/usr/bin/clang" ]

RUN [ "git", "clone", "https://github.com/hardekbc/260-public.git" ]

ENTRYPOINT [ "/root/260-public/bin/c2ir.sh" ]

# #clang setup
# apt install -y clang-14
# ln -s /usr/lib/llvm-14/bin/opt /usr/bin/opt
#
# ln -s /usr/bin/clang++-14 /usr/bin/clang++
# apt install -y lld;

#build ir scripts
# git clone https://github.com/hardekbc/260-public.git
# cd /260-public/example_c_programs
# /bin/bash ../bin/c2ir.sh *.c;
# cd /260-public
# bazel build ir:all
# bazel test ir:all
