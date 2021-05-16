luaUnit = require("luaunit")
local dealershipFile = dofile(".\\src\\shared\\Dealership.lua")
local errorMessagesFile = dofile(".\\src\\shared\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

local SetDealershipNameTests = {}
SetDealershipNameTests.__index = SetDealershipNameTests

function testShouldNotSetNullDealershipName()
    newDealership = dealershipFile.new("old name", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_SET_NIL_DEALER_NAME, newDealership.setName, newDealership, nil)
end

function testShouldNotSetEmptyDealershipName()
    newDealership = dealershipFile.new("old name", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_SET_EMPTY_DEALER_NAME, newDealership.setName, newDealership, "")
end

function testShouldSetValidDealershipName()
    newDealership = dealershipFile.new("old name", 15000, {})
    newDealership:setName("new name")
    luaUnit.assertEquals("new name", newDealership:getName())
end

luaUnit.LuaUnit.run()

return SetDealershipNameTests