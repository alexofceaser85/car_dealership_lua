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

    return newErrorMessages
end

return ErrorMessages