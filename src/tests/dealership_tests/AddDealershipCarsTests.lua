luaUnit = require("luaunit")
local dealershipFile = dofile(".\\src\\shared\\Dealership.lua")
local carFile = dofile(".\\src\\shared\\Car.lua")
local errorMessagesFile = dofile(".\\src\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

local AddDealershipCarsTests = {}
AddDealershipCarsTests.__index = AddDealershipCarsTests

function testShouldNotAllowNilCar()
    newDealership = dealershipFile.new("dealer", 15000, {})
    luaUnit.assertErrorMsgContains(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_TO_ADD, newDealership.addDealershipCar, newDealership, nil)
end 

function testShouldAddOneCar()
    newDealership = dealershipFile.new("dealer", 15000, {})
    local newCar = carFile.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    newDealership:addDealershipCar(newCar)

    firstDealerCar = newDealership:getDealershipCar(1)
    secondDealerCar = newDealership:getDealershipCar(2)

    luaUnit.assertEquals("Ford", firstDealerCar:getMake())
    luaUnit.assertEquals("Focus", firstDealerCar:getModel())
    luaUnit.assertEquals("Black", firstDealerCar:getColor())
    luaUnit.assertEquals("Sedan", firstDealerCar:getType())
    luaUnit.assertEquals(14000, firstDealerCar:getPurchasePrice())
    luaUnit.assertEquals(17000, firstDealerCar:getSellPrice())
    luaUnit.assertEquals(nil, secondDealerCar)
end

function testShouldAddManyCars()
    newDealership = dealershipFile.new("dealer", 15000, {})
    local firstNewCar = carFile.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondNewCar = carFile.new("Chevrolet", "Spark", "Blue", "Hatchback", 11000, 13000)
    local thirdNewCar = carFile.new("Buick", "Grand National", "Red", "Coupe", 21000, 30000)
    newDealership:addDealershipCar(firstNewCar)
    newDealership:addDealershipCar(secondNewCar)
    newDealership:addDealershipCar(thirdNewCar)

    firstDealerCar = newDealership:getDealershipCar(1)
    secondDealerCar = newDealership:getDealershipCar(2)
    thirdDealerCar = newDealership:getDealershipCar(3)
    fourthDealerCar = newDealership:getDealershipCar(4)

    luaUnit.assertEquals("Ford", firstDealerCar:getMake())
    luaUnit.assertEquals("Focus", firstDealerCar:getModel())
    luaUnit.assertEquals("Black", firstDealerCar:getColor())
    luaUnit.assertEquals("Sedan", firstDealerCar:getType())
    luaUnit.assertEquals(14000, firstDealerCar:getPurchasePrice())
    luaUnit.assertEquals(17000, firstDealerCar:getSellPrice())
    
    luaUnit.assertEquals("Chevrolet", secondNewCar:getMake())
    luaUnit.assertEquals("Spark", secondNewCar:getModel())
    luaUnit.assertEquals("Blue", secondNewCar:getColor())
    luaUnit.assertEquals("Hatchback", secondNewCar:getType())
    luaUnit.assertEquals(11000, secondNewCar:getPurchasePrice())
    luaUnit.assertEquals(13000, secondNewCar:getSellPrice())

    luaUnit.assertEquals("Buick", thirdNewCar:getMake())
    luaUnit.assertEquals("Grand National", thirdNewCar:getModel())
    luaUnit.assertEquals("Red", thirdNewCar:getColor())
    luaUnit.assertEquals("Coupe", thirdNewCar:getType())
    luaUnit.assertEquals(21000, thirdNewCar:getPurchasePrice())
    luaUnit.assertEquals(30000, thirdNewCar:getSellPrice())

    luaUnit.assertEquals(nil, fourthNewCar)
end

luaUnit.LuaUnit.run()

return AddDealershipCarsTests