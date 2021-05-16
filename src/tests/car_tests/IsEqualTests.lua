luaUnit = require("luaunit")
local Car = dofile(".\\src\\shared\\Car.lua")
local errorMessagesFile = dofile(".\\src\\shared\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

local IsEqualTests = {}
IsEqualTests.__index = IsEqualTests

function testShouldReturnTrueIfAllValuesAreEqual()
    local firstCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)

    isEqual = firstCar:isEqual(secondCar)

    luaUnit.assertTrue(isEqual)
end

function testShouldReturnFalseIfAllValuesAreNotEqual()
    local firstCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondCar = Car.new("Chevrolet", "Corvette", "Blue", "Coupe", 51000, 55000)

    isEqual = firstCar:isEqual(secondCar)

    luaUnit.assertFalse(isEqual)
end

function testShouldReturnFalseIfMakeIsNotEqual()
    local firstCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondCar = Car.new("Chevrolet", "Focus", "Black", "Sedan", 14000, 17000)

    isEqual = firstCar:isEqual(secondCar)

    luaUnit.assertFalse(isEqual)
end

function testShouldReturnFalseIfModelIsNotEqual()
    local firstCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondCar = Car.new("Ford", "Corvette", "Black", "Sedan", 14000, 17000)

    isEqual = firstCar:isEqual(secondCar)

    luaUnit.assertFalse(isEqual)
end

function testShouldReturnFalseIfColorIsNotEqual()
    local firstCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondCar = Car.new("Ford", "Focus", "Blue", "Sedan", 14000, 17000)

    isEqual = firstCar:isEqual(secondCar)

    luaUnit.assertFalse(isEqual)
end

function testShouldReturnFalseIfTypeIsNotEqual()
    local firstCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondCar = Car.new("Ford", "Focus", "Black", "Hatchback", 14000, 17000)

    isEqual = firstCar:isEqual(secondCar)

    luaUnit.assertFalse(isEqual)
end

function testShouldReturnFalseIfPurchasePriceIsNotEqual()
    local firstCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondCar = Car.new("Ford", "Focus", "Black", "Sedan", 15000, 17000)

    isEqual = firstCar:isEqual(secondCar)

    luaUnit.assertFalse(isEqual)
end

function testShouldReturnFalseIfSellPriceIsNotEqual()
    local firstCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 19000)

    isEqual = firstCar:isEqual(secondCar)

    luaUnit.assertFalse(isEqual)
end

luaUnit.LuaUnit.run()

return IsEqualTests