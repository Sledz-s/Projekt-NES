cmake_minimum_required(VERSION 3.18)

set(LLVM_MOS_PLATFORM nes-nrom)

find_package(llvm-mos-sdk REQUIRED)

project(nes_llvm_project C)

add_executable(rom.nes
    src/main.c
    src/chr.c
    src/lib/stdnes.c
)

# Generowanie assemblera z kodu C
set(ASM_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/main.s")

add_custom_command(
    OUTPUT "${ASM_OUTPUT}"
    COMMAND ${CMAKE_C_COMPILER}
            -S
            -O2
            "${CMAKE_CURRENT_SOURCE_DIR}/src/main.c"
            -o "${ASM_OUTPUT}"
    DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/main.c"
    COMMENT "Generowanie assemblera MOS 6502 z main.c"
    VERBATIM
)

add_custom_target(asm ALL
    DEPENDS "${ASM_OUTPUT}"
)