lu = require("luaunit")
local Car = dofile(".\\src\\shared\\car.lua")

function test_should_initialize_value_values()
    local newCar = Car.new("Ford", "Focus", "Black", "Sedan")
    lu.assertEquals(newCar:getMake(), "Ford")
    lu.assertEquals(newCar:getModel(), "Ford")
end

os.exit(lu.LuaUnit.run())