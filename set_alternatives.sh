#! /bin/bash

LLVM_VERSION=$1

update-alternatives --install /usr/bin/clang clang "/usr/bin/clang-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/clang++ clang++ "/usr/bin/clang++-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/clang-format clang-format "/usr/bin/clang-format-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/clang-tidy clang-tidy "/usr/bin/clang-tidy-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/clangd clangd "/usr/bin/clangd-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/ld ld "/usr/bin/lld-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/lldb lldb "/usr/bin/lldb-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-config llvm-config "/usr/bin/llvm-config-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-cov llvm-cov "/usr/bin/llvm-cov-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-profdata llvm-profdata "/usr/bin/llvm-profdata-${LLVM_VERSION}" 100

# Rust needs this to find libclang when using the cc crate
ln -sf "/usr/lib/$(gcc -dumpmachine)/libclang-${LLVM_VERSION}.so.1" /usr/lib/"$(gcc -dumpmachine)"/libclang.so
