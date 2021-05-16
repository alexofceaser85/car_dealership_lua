luaUnit = require("luaunit")
local dealershipFile = require(".\\src\\ReplicatedStorage\\Common\\Dealership")
local errorMessagesFile = require(".\\src\\ReplicatedStorage\\Common\\errormessages\\ErrorMessages")
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