luaUnit = require("luaunit")
local dealershipFile = require(".\\src\\ReplicatedStorage\\Common\\Dealership")
local carFile = require(".\\src\\ReplicatedStorage\\Common\\Car")
local errorMessagesFile = require(".\\src\\ReplicatedStorage\\Common\\errormessages\\ErrorMessages")
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
    local secondDealerCar = newDealership:getDealershipCar(2)

    luaUnit.assertEquals("Ford", firstDealerCar:getMake())
    luaUnit.assertEquals("Focus", firstDealerCar:getModel())
    luaUnit.assertEquals("Black", firstDealerCar:getColor())
    luaUnit.assertEquals("Sedan", firstDealerCar:getType())
    luaUnit.assertEquals(14000, firstDealerCar:getPurchasePrice())
    luaUnit.assertEquals(17000, firstDealerCar:getSellPrice())
    luaUnit.assertEquals(nil, secondDealerCar)
end

function testShouldAddManyCars()
    local newDealership = dealershipFile.new("dealer", 15000, {})
    local firstNewCar = carFile.new("Ford", "Focus", "Black", "Sedan", 14000, 17000)
    local secondNewCar = carFile.new("Chevrolet", "Spark", "Blue", "Hatchback", 11000, 13000)
    local thirdNewCar = carFile.new("Buick", "Grand National", "Red", "Coupe", 21000, 30000)
    newDealership:addDealershipCar(firstNewCar)
    newDealership:addDealershipCar(secondNewCar)
    newDealership:addDealershipCar(thirdNewCar)

    local firstDealerCar = newDealership:getDealershipCar(1)
    local secondDealerCar = newDealership:getDealershipCar(2)
    local thirdDealerCar = newDealership:getDealershipCar(3)
    local fourthDealerCar = newDealership:getDealershipCar(4)

    luaUnit.assertEquals("Ford", firstDealerCar:getMake())
    luaUnit.assertEquals("Focus", firstDealerCar:getModel())
    luaUnit.assertEquals("Black", firstDealerCar:getColor())
    luaUnit.assertEquals("Sedan", firstDealerCar:getType())
    luaUnit.assertEquals(14000, firstDealerCar:getPurchasePrice())
    luaUnit.assertEquals(17000, firstDealerCar:getSellPrice())
    
    luaUnit.assertEquals("Chevrolet", secondDealerCar:getMake())
    luaUnit.assertEquals("Spark", secondDealerCar:getModel())
    luaUnit.assertEquals("Blue", secondDealerCar:getColor())
    luaUnit.assertEquals("Hatchback", secondDealerCar:getType())
    luaUnit.assertEquals(11000, secondDealerCar:getPurchasePrice())
    luaUnit.assertEquals(13000, secondDealerCar:getSellPrice())

    luaUnit.assertEquals("Buick", thirdDealerCar:getMake())
    luaUnit.assertEquals("Grand National", thirdDealerCar:getModel())
    luaUnit.assertEquals("Red", thirdDealerCar:getColor())
    luaUnit.assertEquals("Coupe", thirdDealerCar:getType())
    luaUnit.assertEquals(21000, thirdDealerCar:getPurchasePrice())
    luaUnit.assertEquals(30000, thirdDealerCar:getSellPrice())

    luaUnit.assertEquals(nil, fourthDealerCar)
end

luaUnit.LuaUnit.run()

return AddDealershipCarsTests