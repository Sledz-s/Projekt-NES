cmake_minimum_required(VERSION 3.18)

set(LLVM_MOS_PLATFORM nes-nrom)

find_package(llvm-mos-sdk REQUIRED)

project(nes_llvm_project C ASM)

add_executable(rom.nes
    src/main.c
    src/chr/chr_page_0.c
    src/chr/chr_page_1.c
    src/lib/stdnes.c
    src/header.s
)

target_link_options(rom.nes PRIVATE
    -Wl,-Map=${CMAKE_CURRENT_BINARY_DIR}/rom.map
)

target_include_directories(rom.nes PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
)
