local errorMessagesFile = dofile(".\\src\\shared\\errormessages\\ErrorMessages.lua")
local errorMessages = errorMessagesFile.new()

--[[
    This class stores the information for each car dealership, including the cars for the dealship

    author: Alex DeCesare
    version: 09-May-2021
]]--

local Dealership = {}
Dealership.__index = Dealership

--[[
    This is the constructor of the dealership object

    preconditions
        name != nil
        && len(name) != 0
        && cashBalance > 0
        && dealerCars != nil

    postconditions
        self.Name == name
        self.CashBalance == cashBalance
        self.DealerCars == dealerCars

    return the new dealership that was created
]]--

function Dealership.new(name, cashBalance, dealerCars)

    if (name == nil) then
        error(errorMessages.SHOULD_NOT_ALLOW_NIL_DEALER_NAME)
    end
    if (string.len(name) == 0) then
        error(errorMessages.SHOULD_NOT_ALLOW_EMPTY_DEALER_NAME)
    end
    if (cashBalance <= 0) then
        error(errorMessages.SHOULD_NOT_ALLOW_CASH_BALANCE_AT_ZERO_OR_LESS)
    end
    if (dealerCars == nil) then
        error(errorMessages.SHOULD_NOT_ALLOW_NIL_DEALER_CARS)
    end

    local newDealer = setmetatable({}, Dealership)
    newDealer.Name = name
    newDealer.CashBalance = cashBalance
    newDealer.DealerCars = dealerCars

    return newDealer
end

--[[
    Gets the dealership name

    precondition none
    postcondition none

    return the dealership name
]]--

function Dealership:getName()
    return self.Name
end

--[[
    Sets the dealership name

    precondition nameToSet != nil && len(nameToSet) !=0
    postcondition self.Name = nameToSet

    param nameToSet the name of the dealership to set
]]--

function Dealership:setName(nameToSet)

    if (nameToSet == nil) then
        error(errorMessages.SHOULD_NOT_SET_NIL_DEALER_NAME)
    end
    if (string.len(nameToSet) == 0) then
        error(errorMessages.SHOULD_NOT_SET_EMPTY_DEALER_NAME)
    end

    self.Name = nameToSet
end

--[[
    Gets the cash balance of the dealership

    precondition none
    postcondition none

    return the dealerships cash balance 
]]--

function Dealership:getCashBalance()
    return self.CashBalance
end

--[[
    Sets the cash balance of the dealership

    precondition cashBalanceToSet > 0
    postcondition self.CashBalance == cashBalanceToSet

    param cashBalanceToSet the cash balance to set
]]--

function Dealership:setCashBalance(cashBalanceToSet)

    if (cashBalanceToSet < 0) then
        error(errorMessages.SHOULD_NOT_SET_CASH_BALANCE_TO_BELOW_ZERO)
    end

    self.CashBalance = cashBalanceToSet
end

--[[
    Increments the cash balance of the dealership

    precondition cashBalanceToIncrement > 0
    postcondition self.CashBalance == self.CashBalance + cashBalanceToIncrement

    param cashBalanceToIncrement the cash balance to increment
]]--

function Dealership:incrementCashBalance(cashBalanceToIncrement)

    if (cashBalanceToIncrement <= 0) then
        error(errorMessages.SHOULD_NOT_INCREMENT_CASH_BALANCE_BY_ZERO_OR_LESS)
    end

    self.CashBalance = self.CashBalance + cashBalanceToIncrement
end

--[[
    Decrements the cash balance of the dealership

    precondition cashBalanceToDecrement > 0 && self.CashBalance - cashBalanceToDecrement > 0
    postcondition self.CashBalance == self.CashBalance - cashBalanceToDecrement

    param cashBalanceToDecrement the cash balance to decrement

]]--

function Dealership:decrementCashBalance(cashBalanceToDecrement)

    if (cashBalanceToDecrement <= 0) then
        error(errorMessages.SHOULD_NOT_DECREMENT_CASH_BALANCE_BY_ZERO_OR_LESS)
    end
    if (cashBalanceToDecrement > self.CashBalance) then
        error(errorMessages.SHOULD_NOT_DECREMENT_CASH_BALANCE_BY_MORE_THAN_CASH_BALANCE)
    end

    self.CashBalance = self.CashBalance - cashBalanceToDecrement
end

--[[
    Gets the cars of the dealership

    precondition none
    postcondition none

    return all of the cars of the dealership
]]--

function Dealership:getDealershipCars()
    return self.DealerCars
end

--[[
    Gets a car of the dealership at an index

    precondition none
    postcondition none

    param indexToGet the index to get the car of the dealership

    return the car of the dealership at the index
]]--

function Dealership:getDealershipCar(indexToGet)
    return self.DealerCars[indexToGet]
end

--[[
    Adds a car to the dealership

    precondition carToAdd != nil
    postcondition self.DealerCars == self.DealerCars + carToAdd

    param carToAdd the car to add to the dealership
]]--

function Dealership:addDealershipCar(carToAdd)

    if (carToAdd == nil) then
        error(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_TO_ADD)
    end

    table.insert(self.DealerCars, carToAdd)
end

--[[
    Removes a car from the dealership

    precondition carToRemove != nil
    postcondition self.DealerCars == self.DealerCars - carToAdd

    param carToRemove the car to remove from the dealership

    return true if the car was removed and false if the car was not removed
]]--

function Dealership:removeDealershipCar(carToRemove)

    if (carToRemove == nil) then
        error(errorMessages.SHOULD_NOT_ALLOW_NIL_CAR_TO_REMOVE)
    end

    indexToRemove = 0

    for key, value in ipairs(self.DealerCars) do
        if (carToRemove:isEqual(value)) then
            table.remove(self.DealerCars, key)
            return true
        end

        indexToRemove = indexToRemove + 1
    end
   
    return false
end

return Dealership