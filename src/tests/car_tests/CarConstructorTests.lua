luaUnit = require("luaunit")
local Car = dofile(".\\src\\shared\\Car.lua")
local errorMessagesFile = dofile(".\\src\\shared\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

local CarConstructorTests = {}
CarConstructorTests.__index = CarConstructorTests

function testShouldNotInitializeNilMake()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_MAKE, Car.new, nil, "Focus", "Black", "Sedan", 14000, 17000)
end

function testShouldNotInitializeEmptyMake()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_MAKE, Car.new, "", "Focus", "Black", "Sedan", 14000, 17000)
end

function testShouldNotInitializeNilModel()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_MODEL, Car.new, "Ford", nil, "Black", "Sedan", 14000, 17000)
end

function testShouldNotInitializeEmptyModel()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_MODEL, Car.new, "Ford", "", "Black", "Sedan", 14000, 17000)
end

function testShouldNotInitializeNilColor()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_COLOR, Car.new, "Ford", "Focus", nil, "Sedan", 14000, 17000)
end

function testShouldNotInitializeEmptyColor()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_COLOR, Car.new, "Ford", "Focus", "", "Sedan", 14000, 17000)
end

function testShouldNotInitializeNilType()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_TYPE, Car.new, "Ford", "Focus", "Black", nil, 14000, 17000)
end

function testShouldNotInitializeEmptyType()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_TYPE, Car.new, "Ford", "Focus", "Black", "", 14000, 17000)
end

function testShouldNotInitializeCarWithPurchasePriceOfZero()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_CAR_WITH_PURCHASE_PRICE_ZERO_OR_LESS, Car.new, "Ford", "Focus", "Black", "Sedan", 0, 17000)
end

function testShouldNotInitializeCarWithPurchasePriceOfOneLessThanZero()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_CAR_WITH_PURCHASE_PRICE_ZERO_OR_LESS, Car.new, "Ford", "Focus", "Black", "Sedan", -1, 17000)
end

function testShouldNotInitializeCarWithPurchasePriceOfWellLessThanZero()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_CAR_WITH_PURCHASE_PRICE_ZERO_OR_LESS, Car.new, "Ford", "Focus", "Black", "Sedan", -14000, 17000)
end

function testShouldNotInitializeCarWithSellPriceOfZero()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_CAR_WITH_SELL_PRICE_ZERO_OR_LESS, Car.new, "Ford", "Focus", "Black", "Sedan", 14000, 0)
end

function testShouldNotInitializeCarWithSellPriceOfOneLessThanZero()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_CAR_WITH_SELL_PRICE_ZERO_OR_LESS, Car.new, "Ford", "Focus", "Black", "Sedan", 14000, -1)
end

function testShouldNotInitializeCarWithSellPriceOfWellLessThanZero()
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_CAR_WITH_SELL_PRICE_ZERO_OR_LESS, Car.new, "Ford", "Focus", "Black", "Sedan", 14000, -17000)
end

function testShouldInitializeValidValuesAtOne()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 1, 1)
    luaUnit.assertEquals(newCar:getMake(), "Ford")
    luaUnit.assertEquals(newCar:getModel(), "Focus")
    luaUnit.assertEquals(newCar:getColor(), "Black")
    luaUnit.assertEquals(newCar:getType(), "Sedan")
    luaUnit.assertEquals(newCar:getPurchasePrice(), 1)
    luaUnit.assertEquals(newCar:getSellPrice(), 1)
end

function testShouldInitializeValidValuesOneAboveOne()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 2, 2)
    luaUnit.assertEquals(newCar:getMake(), "Ford")
    luaUnit.assertEquals(newCar:getModel(), "Focus")
    luaUnit.assertEquals(newCar:getColor(), "Black")
    luaUnit.assertEquals(newCar:getType(), "Sedan")
    luaUnit.assertEquals(newCar:getPurchasePrice(), 2)
    luaUnit.assertEquals(newCar:getSellPrice(), 2)
end

function testShouldInitializeValidValuesWellAboveOne()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertEquals(newCar:getMake(), "Ford")
    luaUnit.assertEquals(newCar:getModel(), "Focus")
    luaUnit.assertEquals(newCar:getColor(), "Black")
    luaUnit.assertEquals(newCar:getType(), "Sedan")
    luaUnit.assertEquals(newCar:getPurchasePrice(), 14000)
    luaUnit.assertEquals(newCar:getSellPrice(), 17000)
end

luaUnit.LuaUnit.run()

return CarConstructorTests