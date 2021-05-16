luaUnit = require("luaunit")
local dealershipFile = dofile(".\\src\\shared\\Dealership.lua")
local carFile = dofile(".\\src\\shared\\Car.lua")
local errorMessagesFile = dofile(".\\src\\shared\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

local RemoveDealershipCarsTests = {}
RemoveDealershipCarsTests.__index = RemoveDealershipCarsTests

function testShouldNotRemoveNilCar()
    newDealership = dealershipFile.new("dealer", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_TO_REMOVE, newDealership.removeDealershipCar, newDealership, nil)
    luaUnit.assertEquals(newDealership:getDealershipCar(1), nil)
end

function testShouldNotRemoveCarInEmptyDealership()
    newDealership = dealershipFile.new("dealer", 15000, {})
    local newCar = carFile.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    luaUnit.assertFalse(newDealership:removeDealershipCar(newCar))

    luaUnit.assertEquals(newDealership:getDealershipCar(1), nil)
end

function testShouldNotRemoveNonMatchingCarInDealershipWithOneCar()
    newDealership = dealershipFile.new("dealer", 15000, {})
    local firstNewCar = carFile.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondNewCar = carFile.new("BMW", "3-Series", "White", "Coupe", 29000, 35000)

    newDealership:addDealershipCar(firstNewCar)
    luaUnit.assertFalse(newDealership:removeDealershipCar(secondNewCar))

    firstDealerCar = newDealership:getDealershipCar(1)
    secondDealerCar = newDealership:getDealershipCar(2)

    luaUnit.assertEquals(firstDealerCar:getMake(), "Ford")
    luaUnit.assertEquals(firstDealerCar:getModel(), "Focus")
    luaUnit.assertEquals(firstDealerCar:getColor(), "Black")
    luaUnit.assertEquals(firstDealerCar:getType(), "Sedan")
    luaUnit.assertEquals(firstDealerCar:getPurchasePrice(), 14000)
    luaUnit.assertEquals(firstDealerCar:getSellPrice(), 17000)

    luaUnit.assertEquals(secondDealerCar, nil)
end

function testShouldNotRemoveNonMatchingCarInDealershipWithManyCars()
    newDealership = dealershipFile.new("dealer", 15000, {})
    local firstNewCar = carFile.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondNewCar = carFile.new("Chevrolet", "Silverado", "Red", "Truck", 19000, 22000)
    local thirdNewCar = carFile.new("Buick", "Lucerne", "Gold", "Sedan", 15000, 19000)
    local fourthNewCar = carFile.new("BMW", "3-Series", "White", "Coupe", 29000, 35000)
    newDealership:addDealershipCar(firstNewCar)
    newDealership:addDealershipCar(secondNewCar)
    newDealership:addDealershipCar(thirdNewCar)
    
    firstDealerCar = newDealership:getDealershipCar(1)
    secondDealerCar = newDealership:getDealershipCar(2)
    thirdDealerCar = newDealership:getDealershipCar(3)
    fourthDealerCar = newDealership:getDealershipCar(4)

    luaUnit.assertFalse(newDealership:removeDealershipCar(fourthNewCar))

    luaUnit.assertEquals(firstDealerCar:getMake(), "Ford")
    luaUnit.assertEquals(firstDealerCar:getModel(), "Focus")
    luaUnit.assertEquals(firstDealerCar:getColor(), "Black")
    luaUnit.assertEquals(firstDealerCar:getType(), "Sedan")
    luaUnit.assertEquals(firstDealerCar:getPurchasePrice(), 14000)
    luaUnit.assertEquals(firstDealerCar:getSellPrice(), 17000)

    luaUnit.assertEquals(secondDealerCar:getMake(), "Chevrolet")
    luaUnit.assertEquals(secondDealerCar:getModel(), "Silverado")
    luaUnit.assertEquals(secondDealerCar:getColor(), "Red")
    luaUnit.assertEquals(secondDealerCar:getType(), "Truck")
    luaUnit.assertEquals(secondDealerCar:getPurchasePrice(), 19000)
    luaUnit.assertEquals(secondDealerCar:getSellPrice(), 22000)

    luaUnit.assertEquals(thirdDealerCar:getMake(), "Buick")
    luaUnit.assertEquals(thirdDealerCar:getModel(), "Lucerne")
    luaUnit.assertEquals(thirdDealerCar:getColor(), "Gold")
    luaUnit.assertEquals(thirdDealerCar:getType(), "Sedan")
    luaUnit.assertEquals(thirdDealerCar:getPurchasePrice(), 15000)
    luaUnit.assertEquals(thirdDealerCar:getSellPrice(), 19000)

    luaUnit.assertEquals(nil, fourthDealerCar)
end

function testShouldRemoveFirstDealershipCar()
    newDealership = dealershipFile.new("dealer", 15000, {})
    local firstNewCar = carFile.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondNewCar = carFile.new("Chevrolet", "Silverado", "Red", "Truck", 19000, 22000)
    local thirdNewCar = carFile.new("Buick", "Lucerne", "Gold", "Sedan", 15000, 19000)
    newDealership:addDealershipCar(firstNewCar)
    newDealership:addDealershipCar(secondNewCar)
    newDealership:addDealershipCar(thirdNewCar)
    
    luaUnit.assertTrue(newDealership:removeDealershipCar(firstNewCar))

    firstDealerCar = newDealership:getDealershipCar(1)
    secondDealerCar = newDealership:getDealershipCar(2)
    thirdDealerCar = newDealership:getDealershipCar(3)

    luaUnit.assertEquals(firstDealerCar:getMake(), "Chevrolet")
    luaUnit.assertEquals(firstDealerCar:getModel(), "Silverado")
    luaUnit.assertEquals(firstDealerCar:getColor(), "Red")
    luaUnit.assertEquals(firstDealerCar:getType(), "Truck")
    luaUnit.assertEquals(firstDealerCar:getPurchasePrice(), 19000)
    luaUnit.assertEquals(firstDealerCar:getSellPrice(), 22000)

    luaUnit.assertEquals(secondDealerCar:getMake(), "Buick")
    luaUnit.assertEquals(secondDealerCar:getModel(), "Lucerne")
    luaUnit.assertEquals(secondDealerCar:getColor(), "Gold")
    luaUnit.assertEquals(secondDealerCar:getType(), "Sedan")
    luaUnit.assertEquals(secondDealerCar:getPurchasePrice(), 15000)
    luaUnit.assertEquals(secondDealerCar:getSellPrice(), 19000)

    luaUnit.assertEquals(thirdDealerCar, nil)
end

function testShouldRemoveMiddleDealershipCar()
    newDealership = dealershipFile.new("dealer", 15000, {})
    local firstNewCar = carFile.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondNewCar = carFile.new("Chevrolet", "Silverado", "Red", "Truck", 19000, 22000)
    local thirdNewCar = carFile.new("Buick", "Lucerne", "Gold", "Sedan", 15000, 19000)
    newDealership:addDealershipCar(firstNewCar)
    newDealership:addDealershipCar(secondNewCar)
    newDealership:addDealershipCar(thirdNewCar)

    luaUnit.assertTrue(newDealership:removeDealershipCar(secondNewCar))

    firstDealerCar = newDealership:getDealershipCar(1)
    secondDealerCar = newDealership:getDealershipCar(2)
    thirdDealerCar = newDealership:getDealershipCar(3)

    luaUnit.assertEquals(firstDealerCar:getMake(), "Ford")
    luaUnit.assertEquals(firstDealerCar:getModel(), "Focus")
    luaUnit.assertEquals(firstDealerCar:getColor(), "Black")
    luaUnit.assertEquals(firstDealerCar:getType(), "Sedan")
    luaUnit.assertEquals(firstDealerCar:getPurchasePrice(), 14000)
    luaUnit.assertEquals(firstDealerCar:getSellPrice(), 17000)

    luaUnit.assertEquals(secondDealerCar:getMake(), "Buick")
    luaUnit.assertEquals(secondDealerCar:getModel(), "Lucerne")
    luaUnit.assertEquals(secondDealerCar:getColor(), "Gold")
    luaUnit.assertEquals(secondDealerCar:getType(), "Sedan")
    luaUnit.assertEquals(secondDealerCar:getPurchasePrice(), 15000)
    luaUnit.assertEquals(secondDealerCar:getSellPrice(), 19000)

    luaUnit.assertEquals(nil, thirdDealerCar)
end

function testShouldRemoveLastDealershipCar()
    newDealership = dealershipFile.new("dealer", 15000, {})
    local firstNewCar = carFile.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondNewCar = carFile.new("Chevrolet", "Silverado", "Red", "Truck", 19000, 22000)
    local thirdNewCar = carFile.new("Buick", "Lucerne", "Gold", "Sedan", 15000, 19000)
    newDealership:addDealershipCar(firstNewCar)
    newDealership:addDealershipCar(secondNewCar)
    newDealership:addDealershipCar(thirdNewCar)

    luaUnit.assertTrue(newDealership:removeDealershipCar(thirdNewCar))

    firstDealerCar = newDealership:getDealershipCar(1)
    secondDealerCar = newDealership:getDealershipCar(2)
    thirdDealerCar = newDealership:getDealershipCar(3)

    luaUnit.assertEquals(firstDealerCar:getMake(), "Ford")
    luaUnit.assertEquals(firstDealerCar:getModel(), "Focus")
    luaUnit.assertEquals(firstDealerCar:getColor(), "Black")
    luaUnit.assertEquals(firstDealerCar:getType(), "Sedan")
    luaUnit.assertEquals(firstDealerCar:getPurchasePrice(), 14000)
    luaUnit.assertEquals(firstDealerCar:getSellPrice(), 17000)

    luaUnit.assertEquals(secondDealerCar:getMake(), "Chevrolet")
    luaUnit.assertEquals(secondDealerCar:getModel(), "Silverado")
    luaUnit.assertEquals(secondDealerCar:getColor(), "Red")
    luaUnit.assertEquals(secondDealerCar:getType(), "Truck")
    luaUnit.assertEquals(secondDealerCar:getPurchasePrice(), 19000)
    luaUnit.assertEquals(secondDealerCar:getSellPrice(), 22000)

    luaUnit.assertEquals(nil, thirdDealerCar)
end

luaUnit.LuaUnit.run()

return RemoveDealershipCarsTests