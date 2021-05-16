luaUnit = require("luaunit")
local dealershipFile = require(".\\src\\ReplicatedStorage\\Common\\Dealership")
local errorMessagesFile = require(".\\src\\ReplicatedStorage\\Common\\errormessages\\ErrorMessages")
local errorMessages = errorMessagesFile.new()

local IncrementDealershipCashBalanceTests = {}
IncrementDealershipCashBalanceTests.__index = IncrementDealershipCashBalanceTests

function testShouldNotIncrementCashBalanceAtZero()
    dealership = dealershipFile.new("car dealer", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_INCREMENT_CASH_BALANCE_BY_ZERO_OR_LESS, dealership.incrementCashBalance, dealership, 0)
end

function testShouldNotIncrementCashBalanceOneBelowZero()
    dealership = dealershipFile.new("car dealer", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_INCREMENT_CASH_BALANCE_BY_ZERO_OR_LESS, dealership.incrementCashBalance, dealership, -1)
end

function testShouldNotIncrementCashBalanceWellBelowZero()
    dealership = dealershipFile.new("car dealer", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_INCREMENT_CASH_BALANCE_BY_ZERO_OR_LESS, dealership.incrementCashBalance, dealership, -15000)
end

function testShouldIncrementCashBalanceOneAboveZero()
    dealership = dealershipFile.new("car dealer", 15000, {})
    dealership:incrementCashBalance(1)
    luaUnit.assertEquals(15001, dealership:getCashBalance())

end

function testShouldIncrementCashBalanceWellAboveZero()
    dealership = dealershipFile.new("car dealer", 15000, {})
    dealership:incrementCashBalance(15000)
    luaUnit.assertEquals(30000, dealership:getCashBalance())
end

luaUnit.LuaUnit.run()

return IncrementDealershipCashBalanceTests