luaUnit = require("luaunit")
local dealershipFile = dofile(".\\src\\shared\\Dealership.lua")
local errorMessagesFile = dofile(".\\src\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

local IncrementDealershipCashBalanceTests = {}
IncrementDealershipCashBalanceTests.__index = IncrementDealershipCashBalanceTests

function testShouldNotDecrementCashBalanceAtZero()
    dealership = dealershipFile.new("car dealer", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_DECREMENT_CASH_BALANCE_BY_ZERO_OR_LESS, dealership.decrementCashBalance, dealership, 0)
end

function testShouldNotDecrementCashBalanceOneLessThanZero()
    dealership = dealershipFile.new("car dealer", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_DECREMENT_CASH_BALANCE_BY_ZERO_OR_LESS, dealership.decrementCashBalance, dealership, -1)
end

function testShouldNotDecrementCashBalanceWellLessThanZero()
    dealership = dealershipFile.new("car dealer", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_DECREMENT_CASH_BALANCE_BY_ZERO_OR_LESS, dealership.decrementCashBalance, dealership, -15000)
end

function testShouldNotDecrementCashBalanceOneMoreThanCashBalance()
    dealership = dealershipFile.new("car dealer", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_DECREMENT_CASH_BALANCE_BY_MORE_THAN_CASH_BALANCE, dealership.decrementCashBalance, dealership, 15001)
end

function testShouldNotDecrementCashBalanceWellMoreThanCashBalance()
    dealership = dealershipFile.new("car dealer", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_DECREMENT_CASH_BALANCE_BY_MORE_THAN_CASH_BALANCE, dealership.decrementCashBalance, dealership, 30000)
end

function testShouldDecrementCashBalanceByOneMoreThanZero()
    dealership = dealershipFile.new("car dealer", 15000, {})
    dealership:decrementCashBalance(1)
    luaUnit.assertEquals(14999, dealership:getCashBalance())
end

function testShouldDecrementCashBalanceByWellMoreThanZero()
    dealership = dealershipFile.new("car dealer", 15000, {})
    dealership:decrementCashBalance(3000)
    luaUnit.assertEquals(12000, dealership:getCashBalance())
end

function testShouldDecrementCashBalanceEqualToCashBalance()
    dealership = dealershipFile.new("car dealer", 15000, {})
    dealership:decrementCashBalance(15000)
    luaUnit.assertEquals(0, dealership:getCashBalance())
end

function testShouldDecrementCashBalanceOneLessThanCashBalance()
    dealership = dealershipFile.new("car dealer", 15000, {})
    dealership:decrementCashBalance(14999)
    luaUnit.assertEquals(1, dealership:getCashBalance())
end

function testShouldDecrementCashBalanceWellLessThanCashBalance()
    dealership = dealershipFile.new("car dealer", 15000, {})
    dealership:decrementCashBalance(10000)
    luaUnit.assertEquals(5000, dealership:getCashBalance())
end

luaUnit.LuaUnit.run()

return IncrementDealershipCashBalanceTests