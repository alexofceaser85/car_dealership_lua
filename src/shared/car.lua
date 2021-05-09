local errorMessagesFile = dofile(".\\src\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

--[[
    This is the car object that holds the data for each car in the dealership

    author: Alex DeCesare
    version: 08-May-2021
]]--

local Car = {}
Car.__index = Car

--[[
    This is the constructor of the car object

    preconditions
        make != nil && len(make) >= 1
        && model != nil && len(model) >= 1
        && color != nil && len(color) >= 1
        && type != nil && len(type) >= 1
        && purchasePrice >= 0 && sell_price >= 0

    postconditions
        self.Make == make
        self.Model == model
        self.Color == color
        self.Type == type

    return
        the new car that was created
]]--

function Car.new(make, model, color, type, purchasePrice, sellPrice)

    if (make == nil) then
        error(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_MAKE)
    end
    if (string.len(make) <= 0) then
        error(errorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_MAKE)
    end
    if (model == nil) then
        error(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_MODEL)
    end
    if (string.len(model) <= 0) then
        error(errorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_MODEL)
    end
    if (color == nil) then
        error(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_COLOR)
    end
    if (string.len(color) <= 0) then
        error(errorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_COLOR)
    end
    if (type == nil) then
        error(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_TYPE)
    end
    if (string.len(type) <= 0) then
        error(errorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_TYPE)
    end
    if (purchasePrice <= 0) then
        error(errorMessages.SHOULD_NOT_ALLOW_CAR_WITH_PURCHASE_PRICE_ZERO_OR_LESS)
    end
    if (sellPrice <= 0) then
        error(errorMessages.SHOULD_NOT_ALLOW_CAR_WITH_SELL_PRICE_ZERO_OR_LESS)
    end    

    local newCar = setmetatable({}, Car)
    newCar.Make = make
    newCar.Model = model
    newCar.Color = color
    newCar.Type = type
    newCar.PurchasePrice = purchasePrice
    newCar.SellPrice = sellPrice

    return newCar
end

--[[
    Gets the make of the car

    precondition none
    postcondition none

    return: the make of the car
]]--

function Car:getMake()
    return self.Make
end

--[[
    Gets the model of the car

    precondition none
    postcondition none

    return: the model of the car
]]--

function Car:getModel()
    return self.Model
end

--[[
    Gets the color of the car

    precondition none
    postcondition none

    return: the color of the car
]]--

function Car:getColor()
    return self.Color
end

--[[
    Gets the type of the car

    precondition none
    postcondition none

    return: the type of the car
]]--

function Car:getType()
    return self.Type
end

--[[
    Gets the purchase price of the car

    precondition none
    postcondition none

    return: the purchase price of the car
]]--

function Car:getPurchasePrice()
    return self.PurchasePrice
end

--[[
    Sets the purchase price of the car

    precondition purchasePriceToSet > 0
    postcondition self.PurchasePrice == purchasePriceToSet
]]--

function Car:setPurchasePrice(purchasePriceToSet)
    if (purchasePriceToSet <= 0) then
        error(errorMessages.SHOULD_NOT_SET_PURCHASE_PRICE_ZERO_OR_LESS)
    end

    self.PurchasePrice = purchasePriceToSet
end

--[[
    Gets the sell price of the car

    precondition none
    postcondition none

    return: the sell price of the car
]]--

function Car:getSellPrice()
    return self.SellPrice
end

--[[
    Sets the sell price of the car

    precondition sellPriceToSet > 0
    postcondition self.SellPrice == sellPriceToSet
]]--

function Car:setSellPrice(sellPriceToSet)
    if (sellPriceToSet <= 0) then
        error(errorMessages.SHOULD_NOT_SET_SELL_PRICE_ZERO_OR_LESS)
    end

    self.SellPrice = sellPriceToSet
end

return Car