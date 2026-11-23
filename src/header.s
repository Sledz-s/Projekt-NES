; Ines header

.global __prg_rom_size, __chr_rom_size, __prg_ram_size
.global __mirroring, __four_screen

__mapper = 0

; Kilobytes
__prg_rom_size = 32
__chr_rom_size = 8
__prg_ram_size = 0

; Flags
__mirroring = 0    ; horizontal mirroring