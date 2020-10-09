#!/usr/bin/lua

local templateFile = io.open('./dml_template.sql')
local template = templateFile:read()
templateFile:close()

local buffer = {}
local inputFile = io.open(arg[1] or './input.txt')
for line in inputFile:lines() do
	buffer[#buffer + 1] = string.gsub(template, '%$VALUE%$', line)
end
inputFile:close()

local output = io.open('./dml_output.sql', 'w')
output:write(table.concat(buffer, '\n'))
output:close()
