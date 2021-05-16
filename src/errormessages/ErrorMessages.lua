local ErrorMessages = {}
ErrorMessages.__index = ErrorMessages

function ErrorMessages.new()

    local newErrorMessages = setmetatable({}, ErrorMessages)

    --error messages for car class constructor--
    newErrorMessages.SHOULD_NOT_ALLOW_NIL_CAR_MAKE = "There was an attempt at creating a car with a nil car"
    newErrorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_MAKE = "There was an attempt at creating a car with an empty car make"
    newErrorMessages.SHOULD_NOT_ALLOW_NIL_CAR_MODEL = "There was an attempt at creating a car with a nil car make"
    newErrorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_MODEL = "There was an attempt at creating a car with an empty car model"
    newErrorMessages.SHOULD_NOT_ALLOW_NIL_CAR_COLOR = "There was an attempt at creating a car with a nil car color"
    newErrorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_COLOR = "There was an attempt at creating a car with an empty car color"
    newErrorMessages.SHOULD_NOT_ALLOW_NIL_CAR_TYPE = "There was an attempt at creating a car with a nil car type"
    newErrorMessages.SHOULD_NOT_ALLOW_EMPTY_CAR_TYPE = "There was an attempt at creating a car with an empty car type"
    newErrorMessages.SHOULD_NOT_ALLOW_CAR_WITH_PURCHASE_PRICE_ZERO_OR_LESS = "There was an attempt at creating a car with a purchase price at zero or less"
    newErrorMessages.SHOULD_NOT_ALLOW_CAR_WITH_SELL_PRICE_ZERO_OR_LESS = "There was an attempt at creating a car with a sell price at zero or less"

    --error messages for car class setters--
    newErrorMessages.SHOULD_NOT_SET_PURCHASE_PRICE_ZERO_OR_LESS = "Cannot set the cars purchase price to zero or less"
    newErrorMessages.SHOULD_NOT_SET_SELL_PRICE_ZERO_OR_LESS = "Cannot set the cars sell price to zero or less"

    --error messages for the car class equals method
    newErrorMessages.SHOULD_NOT_CHECK_EQUALS_FOR_NIL_CAR = "Cannot check if car is equal to nil car"

    --error messages for the dealership class constructor--
    newErrorMessages.SHOULD_NOT_ALLOW_NIL_DEALER_NAME = "Cannot make a new dealership with a nil name"
    newErrorMessages.SHOULD_NOT_ALLOW_EMPTY_DEALER_NAME = "Cannot make a new dealership with an empty name"
    newErrorMessages.SHOULD_NOT_ALLOW_CASH_BALANCE_AT_ZERO_OR_LESS = "Cannot make a new dealership with a cash balance at zero or less"
    newErrorMessages.SHOULD_NOT_ALLOW_NIL_DEALER_CARS = "Cannot make a new dealership with nil cars"

    --error messages for the set dealership name--
    newErrorMessages.SHOULD_NOT_SET_NIL_DEALER_NAME = "Cannot set dealership name to nil value"
    newErrorMessages.SHOULD_NOT_SET_EMPTY_DEALER_NAME = "Cannot set dealership name to an empty name"

    --error messages for the set cash balance--
    newErrorMessages.SHOULD_NOT_SET_CASH_BALANCE_TO_BELOW_ZERO = "Cannot set the dealership cash balance to below zero"

    --error messages for the increment cash balance--
    newErrorMessages.SHOULD_NOT_INCREMENT_CASH_BALANCE_BY_ZERO_OR_LESS= "Cannot increment the dealership cash balance by zero or less"

    --error messages for the decrement cash balance--
    newErrorMessages.SHOULD_NOT_DECREMENT_CASH_BALANCE_BY_ZERO_OR_LESS = "Cannot decrement the dealership cash balance by zero or less"
    newErrorMessages.SHOULD_NOT_DECREMENT_CASH_BALANCE_BY_MORE_THAN_CASH_BALANCE = "Dealership does not have enough cash balance"

    --error messages for the dealership method add car--
    newErrorMessages.SHOULD_NOT_ALLOW_NIL_CAR_TO_ADD = "Cannot add a nil car to the dealership"

    --error messages for the dealership method remove car--
    newErrorMessages.SHOULD_NOT_ALLOW_NIL_CAR_TO_REMOVE = "Cannot remove a nil car from the dealership"

    return newErrorMessages
end

return ErrorMessages