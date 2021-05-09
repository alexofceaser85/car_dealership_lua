luaUnit = require("luaunit")
local Car = dofile(".\\src\\shared\\Car.lua")
local errorMessagesFile = dofile(".\\src\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

function testShouldSetSellPriceAtOneAboveZero()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertEquals(newCar:getSellPrice(), 17000)
    newCar:setSellPrice(1)
    luaUnit.assertEquals(newCar:getSellPrice(), 1)
end

function testShouldSetSellPriceAtWellAboveZero()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertEquals(newCar:getSellPrice(), 17000)
    newCar:setSellPrice(19000)
    luaUnit.assertEquals(newCar:getSellPrice(), 19000)
end

function testShouldNotSetSellPriceAtZero()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertEquals(newCar:getSellPrice(), 17000)
    print(errorMessages.SHOULD_NOT_SET_Sell_PRICE_ZERO_OR_LESS)
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_SET_SELL_PRICE_ZERO_OR_LESS, newCar.setSellPrice, newCar, 0)
end

function testShouldNotSetSellPriceAtOneLessThanZero()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertEquals(newCar:getSellPrice(), 17000)
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_SET_SELL_PRICE_ZERO_OR_LESS, newCar.setSellPrice, newCar, -1)
end

function testShouldNotSetSellWellLessThanZero()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertEquals(newCar:getSellPrice(), 17000)
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_SET_SELL_PRICE_ZERO_OR_LESS, newCar.setSellPrice, newCar, -14000)
end

os.exit(luaUnit.LuaUnit.run())