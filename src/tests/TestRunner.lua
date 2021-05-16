luaUnit = require("luaunit")

--[[
    This is the test runner for the lua tests, it simply loops through and calls each test in the test files

    author Alex DeCesare
    version 12-May-2021
]]--

visitedPaths = {}

rootFilePath = ".\\src\\tests"
fileExtension = ".lua"

--[[
    This function is responsible for looping through each file in the given root location and runs the tests in that file

    precondition none
    postcondition none

    param directoryTestLocation the location to loop through the test files
]]--

function runTests(directoryTestLocation)
    local fileInfo = io.popen('dir "' .. directoryTestLocation .. '" -1')
    if fileInfo then
        for line in fileInfo:lines() do
            if line == nil then
                fileInfo:close()
                break
            end
            
            delimiter = "|==|"
            addComma = string.gsub(line, "%s+", delimiter)
            addComma = addComma .. delimiter
            splitFileInfo = {}
            for fileInfo in addComma:gmatch("(.-)" .. delimiter) do 
                table.insert(splitFileInfo, fileInfo)
            end

            if (splitFileInfo[4] == "<DIR>") then
                if (splitFileInfo[5] ~= "." and splitFileInfo[5] ~= "..") then
                    table.insert(visitedPaths, directoryTestLocation)
                    runTests(directoryTestLocation .. "\\" .. splitFileInfo[5])
                end
            else
                if (splitFileInfo[5] ~= nil and not isContained(visitedPaths, directoryTestLocation)) then
                    local fileName = string.match(splitFileInfo[5], "(%w+)(%.lua)$")
                    if (fileName ~= nil) then
                        require(directoryTestLocation .."\\" .. fileName)
                    end
                end
            end
        end
    end

    return
end

--[[
    Checks if the path is contained within the visited paths table

    precondition none
    postcondition none

    param theVisitedPaths the paths that were visited already
    param theDirectoryLocation the location to see if it was visited already

    return true if the path is contained in the visited paths, false otherwise
]]--

function isContained(theVisitedPaths, theDirectoryLocation) 
    for index, value in pairs(theVisitedPaths) do
        if (value == theDirectoryLocation) then
            return true
        end
    end

    return false
end

runTests(rootFilePath)
os.exit()