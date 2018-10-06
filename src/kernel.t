-- vim: set ft=terra:

local efi = require('efi')
local kernel = {}

terra kernel.main(instance: efi.Handle, system_table: &efi.SystemTable) : efi.Status.T
	system_table.StdOut.OutputString(system_table.StdOut, efi.s('Hello world\n'))
	system_table.StdOut.OutputString(system_table.StdOut, efi.s('Hello world\n'))
	return efi.Status.Success
end

package.loaded['kernel'] = kernel
