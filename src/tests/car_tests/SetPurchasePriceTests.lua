luaUnit = require("luaunit")
local Car = dofile(".\\src\\shared\\Car.lua")
local errorMessagesFile = dofile(".\\src\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

function testShouldSetPurchasePriceAtOneAboveZero()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertEquals(newCar:getPurchasePrice(), 14000)
    newCar:setPurchasePrice(1)
    luaUnit.assertEquals(newCar:getPurchasePrice(), 1)
end

function testShouldSetPurchasePriceAtWellAboveZero()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertEquals(newCar:getPurchasePrice(), 14000)
    newCar:setPurchasePrice(19000)
    luaUnit.assertEquals(newCar:getPurchasePrice(), 19000)
end

function testShouldNotSetPurchasePriceAtZero()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertEquals(newCar:getPurchasePrice(), 14000)
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_SET_PURCHASE_PRICE_ZERO_OR_LESS, newCar.setPurchasePrice, newCar, 0)
end

function testShouldNotSetPurchasePriceAtOneLessThanZero()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertEquals(newCar:getPurchasePrice(), 14000)
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_SET_PURCHASE_PRICE_ZERO_OR_LESS, newCar.setPurchasePrice, newCar, -1)
end

function testShouldNotSetPurchaseWellLessThanZero()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertEquals(newCar:getPurchasePrice(), 14000)
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_SET_PURCHASE_PRICE_ZERO_OR_LESS, newCar.setPurchasePrice, newCar, -14000)
end

os.exit(luaUnit.LuaUnit.run())