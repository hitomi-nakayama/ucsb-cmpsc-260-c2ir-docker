FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    clang-14 \
    libgoogle-glog-dev \
    lld \
    git

RUN [ "ln", "-s", "/usr/lib/llvm-14/bin/opt", "/usr/bin/opt" ]
RUN [ "ln", "-s", "/usr/bin/clang-14", "/usr/bin/clang" ]

WORKDIR /

RUN [ "git", "clone", "https://github.com/hardekbc/260-public.git" ]

ENTRYPOINT [ "/260-public/bin/c2ir.sh" ]
