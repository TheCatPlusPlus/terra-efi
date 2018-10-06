-- vim: set ft=terra:

package.terrapath = 'src/?.t'

local target = terralib.newtarget {
	Triple = "x86_64-pc-win32-gnu";
	CPU = "x86-64";
	Features = "-mmx,-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-3dnow,-3dnowa,-avx,-avx2";
	FloatABIHard = false;
	NoRedZone = true;
}

local functions = {
	efi_main = require('kernel').main
}

terralib.saveobj(arg[1], 'llvmir', functions, {}, target)
