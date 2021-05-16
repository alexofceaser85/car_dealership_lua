luaUnit = require("luaunit")
local dealershipFile = dofile(".\\src\\shared\\Dealership.lua")
local errorMessagesFile = dofile(".\\src\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

local SetDealershipCashBalanceTests = {}
SetDealershipCashBalanceTests.__index = SetDealershipCashBalanceTests

function testShouldNotSetCashBalanceToOneLessThanZero()
    newDealership = dealershipFile.new("old name", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_SET_CASH_BALANCE_TO_BELOW_ZERO, newDealership.setCashBalance, newDealership, -1)
end

function testShouldNotSetCashBalanceToWellLessThanZero()
    newDealership = dealershipFile.new("old name", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_SET_CASH_BALANCE_TO_BELOW_ZERO, newDealership.setCashBalance, newDealership, -15000)
end

function testShouldSetCashBalanceToZero()
    newDealership = dealershipFile.new("old name", 15000, {})
    dealershipFile:setCashBalance(0)
    luaUnit.assertEquals(0, dealershipFile:getCashBalance())
end

function testShouldSetCashBalanceToOneMoreThanZero()
    newDealership = dealershipFile.new("old name", 15000, {})
    dealershipFile:setCashBalance(1)
    luaUnit.assertEquals(1, dealershipFile:getCashBalance())
end

function testShouldSetCashBalanceToWellMoreThanZero()
    newDealership = dealershipFile.new("old name", 15000, {})
    dealershipFile:setCashBalance(100000)
    luaUnit.assertEquals(100000, dealershipFile:getCashBalance())
end

luaUnit.LuaUnit.run()

return SetDealershipCashBalanceTests