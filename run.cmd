@echo off
setlocal
cd %~dp0

if not exist tmp\OVMF_VARS-work.fd copy /b tools\OVMF_VARS.fd tmp\OVMF_VARS-work.fd

qemu-system-x86_64 ^
	-machine q35 -cpu Nehalem ^
	-drive file=fat:ro:dist,format=raw,id=hd0,if=none ^
	-drive if=pflash,format=raw,readonly,file=tools/OVMF_CODE.fd ^
	-drive if=pflash,format=raw,file=tmp/OVMF_VARS-work.fd ^
	-device ich9-ahci,id=ahci ^
	-device ide-drive,drive=hd0,bus=ahci.0 ^
	-usb -device usb-tablet -device usb-kbd ^
	-serial file:tmp\debug.log -device virtio-serial -device virtconsole ^
	-debugcon file:tmp/uefi_debug.log -global isa-debugcon.iobase=0x402 ^
	-m 256M -balloon none ^
	-rtc base=utc,clock=vm ^
	-vga virtio -display sdl

exit /b %errorlevel%
