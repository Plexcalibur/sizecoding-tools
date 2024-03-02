# hashmem samples

## Collected on Arch Linux, kernel 6.7.6-arch1-1

Two samples per type are included to allow checking which hashes vary per launch.

### DOSBox 0.74-3

- dosbox_0.74-3_archlinux.log
- dosbox_0.74-3_archlinux_2.log

DOSBox version 0.74-3, installed from Arch Linux package repository (extra/dosbox 0.74.3-2). Sample collected with the command:
```
dosbox -fastlaunch -c "mount c: $(pwd)" -c "c:" -c "hashmem > dosbox.log"
```

### DOSBox-X 2023.10.06

- dosbox-x_2023.10.06_archlinux.log
- dosbox-x_2023.10.06_archlinux_2.log

DOSBox-X version 2023.10.06 SDL1, installed from AUR. Sample collected with the command:
```
dosbox-x -fastlaunch -c "mount c: $(pwd)" -c "c:" -c "hashmem > x.log"
```

### QEMU-based full operating systems

All tested using [scenedos](https://github.com/dancek/scenedos), which includes premade images of FreeDOS 1.3 and MS-DOS 6.22 with utility script for easily mounting a local directory as filesystem.

All were run using QEMU 8.2.1 installed from Arch Linux package repository (extra/qemu-full 8.2.1-2). All samples collected with the command "hashmem > somename.log".

#### FreeDOS 1.3 installed on hard drive

- freedos_1.3_qemu.log
- freedos_1.3_qemu_2.log

#### FreeDOS 1.3 boot floppy

- freedos_1.3_floppy_qemu.log

#### MS-DOS 6.22 boot floppy

- ms-dos_6.22_qemu.log
- ms-dos_6.22_qemu_2.log
