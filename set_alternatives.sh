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
update-alternatives --install /usr/bin/llvm-nm llvm-nm "/usr/bin/llvm-nm-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-objdump llvm-objdump "/usr/bin/llvm-objdump-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-profdata llvm-profdata "/usr/bin/llvm-profdata-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-ranlib llvm-ranlib "/usr/bin/llvm-ranlib-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-readelf llvm-readelf "/usr/bin/llvm-readelf-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-readobj llvm-readobj "/usr/bin/llvm-readobj-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-size llvm-size "/usr/bin/llvm-size-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-strip llvm-strip "/usr/bin/llvm-strip-${LLVM_VERSION}" 100
update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer "/usr/bin/llvm-symbolizer-${LLVM_VERSION}" 100

# Rust needs this to find libclang when using the cc crate
ln -sf "/usr/lib/$(gcc -dumpmachine)/libclang-${LLVM_VERSION}.so.1" /usr/lib/"$(gcc -dumpmachine)"/libclang.so
