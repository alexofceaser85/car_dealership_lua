local errorMessages = dofile(".\\src\\errormessages\\ErrorMessages.lua")

--[[
    This is the car object that holds the data for each car in the dealership

    author: Alex DeCesare
    version: 08-May-2021
]]

local Car = {}
Car.__index = Car

--[[
    This is the constructor of the car object

    preconditions
        make != nil && len(make) >= 1
        && model != nil && len(model) >= 1
        && color != nil && len(color) >= 1
        && type != nil && len(type) >= 1

    postconditions
        self.Make == make
        self.Model == model
        self.Color == color
        self.Type == type
]]

function Car.new(make, model, color, type)

    if (make == nil) then
        error(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_MAKE)
    end
    if (len(make) < 1) then
        error(errorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_MAKE)
    end


    local newCar = setmetatable({}, Car)
    newCar.Make = make
    newCar.Model = model
    newCar.Color = color
    newCar.Type = type

    return newCar
end

function Car:getMake()
    return self.Make
end

function Car:getModel()
    return self.Model
end

return Car