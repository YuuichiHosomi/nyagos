nyagos.ole = nyagos.ole or require("nyole")
local fsObj = nyagos.ole.create_object_utf8("Scripting.FileSystemObject")
local shellApp = nyagos.ole.create_object_utf8("Shell.Application")
local trashBox = shellApp:NameSpace(math.tointeger(10))
if trashBox.MoveHere then
    nyagos.alias.trash = function(args)
        args = nyagos.glob(table.unpack(args))
        for i=1,#args do
            trashBox:MoveHere(fsObj:GetAbsolutePathName(args[i]))
        end
    end
else
    nyagos.writerr("Warning: trash.lua requires nyaole.dll 0.0.0.5 or later\n")
end
