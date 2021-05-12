luaUnit = require("luaunit")
local dealershipFile = dofile(".\\src\\shared\\Dealership.lua")
local errorMessagesFile = dofile(".\\src\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

local SetDealershipNameTests = {}
SetDealershipNameTests.__index = SetDealershipNameTests

function testRunner()
    luaUnit.assertEquals(2, 2)
end

luaUnit.LuaUnit.run()

return SetDealershipNameTests