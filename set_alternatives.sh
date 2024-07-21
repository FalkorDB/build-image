#! /bin/bash

set -e

LLVM_VERSION=$1
if [ -z "$LLVM_VERSION" ]; then
    echo "Usage: $0 <llvm_version>"
    exit 1
fi

update-alternatives --install /usr/bin/clang clang "/usr/bin/clang-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/clang++ clang++ "/usr/bin/clang++-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/ld ld "/usr/bin/lld-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/lldb lldb "/usr/bin/lldb-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-cov llvm-cov "/usr/bin/llvm-cov-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-profdata llvm-profdata "/usr/bin/llvm-profdata-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-ranlib llvm-ranlib "/usr/bin/llvm-ranlib-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-strip llvm-strip "/usr/bin/llvm-strip-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer "/usr/bin/llvm-symbolizer-${LLVM_VERSION}" 100

# Rust needs this to find libclang when using the cc crate
ln -sf "/usr/lib/$(gcc -dumpmachine)/libclang-${LLVM_VERSION}.so.1" /usr/lib/"$(gcc -dumpmachine)"/libclang.so
