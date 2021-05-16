luaUnit = require("luaunit")
local dealershipFile = require(".\\src\\ReplicatedStorage\\Common\\Dealership")
local errorMessagesFile = require(".\\src\\ReplicatedStorage\\Common\\errormessages\\ErrorMessages")
local errorMessages = errorMessagesFile.new()

local DealershipConstructorTests = {}
DealershipConstructorTests.__index = DealershipConstructorTests

function testShouldNotAllowNilName()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_NIL_DEALER_NAME, dealershipFile.new, nil, 15000, {})
end

function testShouldNotAllowEmptyName()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_EMPTY_DEALER_NAME, dealershipFile.new, "", 15000, {})
end

function testShouldNotAllowCashBalanceAtZero()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_CASH_BALANCE_AT_ZERO_OR_LESS, dealershipFile.new, "name", 0, {})
end

function testShouldNotAllowCashBalanceOneLessThanZero()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_CASH_BALANCE_AT_ZERO_OR_LESS, dealershipFile.new, "name", -1, {})
end

function testShouldNotAllowCashBalanceWellLessThanZero()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_CASH_BALANCE_AT_ZERO_OR_LESS, dealershipFile.new, "name", -15000, {})
end

function testShouldNotAllowNilDealerCars()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_NIL_DEALER_CARS, dealershipFile.new, "name", 15000, nil)
end

function testShouldInitializeValidValuesAtMinimum()
    dealership = dealershipFile.new("name", 1, {})

    luaUnit.assertEquals("name", dealership:getName())
    luaUnit.assertEquals(1, dealership:getCashBalance())
    luaUnit.assertEquals({}, dealership:getDealershipCars())
end

function testShouldInitializeValidValuesOneAboveMinimum()
    dealership = dealershipFile.new("name", 2, {})

    luaUnit.assertEquals("name", dealership:getName())
    luaUnit.assertEquals(2, dealership:getCashBalance())
    luaUnit.assertEquals({}, dealership:getDealershipCars())
end

function testShouldInitializeValidValuesWellAboveMinimum()
    dealership = dealershipFile.new("name", 20000, {})

    luaUnit.assertEquals("name", dealership:getName())
    luaUnit.assertEquals(20000, dealership:getCashBalance())
    luaUnit.assertEquals({}, dealership:getDealershipCars())
end

luaUnit.LuaUnit.run()

return DealershipConstructorTests