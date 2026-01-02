--Function Spy Library
local function findfunc(scriptname, scriptClass, Option, cb)
if cb == true then
if scriptClass == "LocalScript" then
for i,v in pairs(getinstances()) do
if v:IsA("LocalScript") then
if v.Name == scriptname then
local senv = getsenv(v)
if Option == "Address" then
for i,v in next, senv do
if type(v) == "function" then
setclipboard(v)
end
end
end
if Option == "Hash" then
for i,v in next, senv do
if type(v) == "function" then
local n = getfunctionhash(v)
setclipboard(n)
end
end
end
if Option == "Name" then
for i,v in next, senv do
if type(v) == "function" then
local n = debug.info(v, "n")
setclipboard(n)
end
end
end
end
end
end
end
end

if scriptClass == "ModuleScript" then
for i,v in pairs(getinstances()) do
if v:IsA("ModuleScript") then
if v.Name == scriptname then
local req = require(v)
if Option == "Address" then
for i,v in next, req do
if type(v) == "function" then
print(v)
end
end
end
if Option == "Hash" then
for i,v in next, req do
if type(v) == "function" then
local n = getfunctionhash(v)
print(n)
end
end
end
if Option == "Name" then
for i,v in next, req do
if type(v) == "function" then
local n = debug.info(v, "n")
print(n)
end
end
end
end
end
end
end

if cb == false then
if scriptClass == "LocalScript" then
for i,v in pairs(getinstances()) do
if v:IsA("LocalScript") then
if v.Name == scriptname then
local senv = getsenv(v)
if Option == "Address" then
for i,v in next, senv do
if type(v) == "function" then
print(v)
end
end
end
if Option == "Hash" then
for i,v in next, senv do
if type(v) == "function" then
local n = getfunctionhash(v)
print(n)
end
end
end
if Option == "Name" then
for i,v in next, senv do
if type(v) == "function" then
local n = debug.info(v, "n")
print(n)
end
end
end
end
end
end
end
if scriptClass == "ModuleScript" then
for i,v in pairs(getinstances()) do
if v:IsA("ModuleScript") then
if v.Name == scriptname then
local req = require(v)
if Option == "Address" then
for i,v in next, req do
if type(v) == "function" then
print(v)
end
end
end
if Option == "Hash" then
for i,v in next, req do
if type(v) == "function" then
local n = getfunctionhash(v)
print(n)
end
end
end
if Option == "Name" then
for i,v in next, req do
if type(v) == "function" then
local n = debug.info(v, "n")
print(n)
end
end
end
end
end
end
end
end
end
local function hookfunc(functyp, Bool, islcl, iscc)
for i,v in next, getgc(true) do
if type(v) == "function" then
local name = debug.info(v, "n")
local hash = getfunctionhash(v)
if name == functyp or hash == functyp or v == functyp then
if islclosure(v) == islcl and iscclosure(v) == iscc then
hookfunction(v, function()
return Bool
end)
end
end
end
end
end
local function restorefunc(functyp, islcl, iscc)
for i,v in next, getgc(true) do
if type(v) == "function" then
local name = debug.info(v, "n")
local hash = getfunctionhash(v)
if n == functyp or hash == functyp or v == functyp then
if islclosure(v) == islcl and iscclosure(v) == iscc then
restorefunction(v)
end
end
end
end
end
local function callfunc(functyp, islcl, iscc, Args)
for i,v in next, getgc(true) do
if type(v) == "function" then
local name = debug.info(v, "n")
local hash = getfunctionhash(v)
if name == functyp or hash == functyp or v == functyp then
if islclosure(v) == islcl and iscclosure(v) == iscc then
v(Args)
end
end
end
end
end
local function hookfunccons(functyp)
for i,v in next, getgc(true) do
if type(v) == "function" then
local name = debug.info(v, "n")
local hash = getfunctionhash(v)
if name == functyp or hash == functyp or v == functyp then
local cons = debug.getconstants(v, "n")
print(unpack(cons))
end
end
end
end
local function hookfuncupval(functyp)
for i,v in next, getgc(true) do
if type(v) == "function" then
local name = debug.info(v, "n")
local hash = getfunctionhash(v)
if name == functyp or hash == functyp or v == functyp then
local upval = debug.getupvalues(v, "n")
print(unpack(upval))
end
end
end
end
--Table And Upvalues Library
local function rawgetnumber(numstr)
for i,v in next, getgc(true) do
if type(v)== "table" and rawget(v, numstr) then
print(rawget(v, numstr))
end
end
end
local function rawsetnumber(numstr, value)
for i,v in next, getgc(true) do
if type(v)== "table" and rawget(v, numstr) then
rawset(v, numstr, value)
end
end
end