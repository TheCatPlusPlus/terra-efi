-- vim: set ft=terra:
local utils = {}

function utils.enum(underlying, values)
	local t = { T = tuple(underlying) }
	for name, value in pairs(values) do
		local cast_value = `[underlying]([value])
		local enum_value = `{cast_value}
		t[name] = enum_value
	end
	return t
end

package.loaded['utils'] = utils
