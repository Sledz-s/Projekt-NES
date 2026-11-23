cmake_minimum_required(VERSION 3.18)

set(LLVM_MOS_PLATFORM nes-nrom)

find_package(llvm-mos-sdk REQUIRED)

project(nes_llvm_project C ASM)

add_executable(rom.nes
    src/main.c
    src/chr.c
    src/lib/stdnes.c
    src/header.s
)
