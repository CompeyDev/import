-- File Name: import
-- Written by MeCrunchAstroX
-- Last updated at March 21, 2022

--[[
	This is a mimic of the import function from JavaScript/Python.
	It's really good to use this over other import functions as it doesn't directly indexes into the Instance and also
	because it uses Instance:WaitForChild() which is useful if you're using it on the Client. (Since the Client takes some time to Load Instances, etc)
--]]

return function (Path: string)
	assert(Path ~= nil, "[Import] - Argument #1 (Path) Must not be nil!")
	assert(typeof(Path) == "string", "[Import] - Argument #1 (Path) Must be a string!")

	local SplittedPath = string.split(tostring(Path), "/")
	local SplittedPathSize = #SplittedPath
	local SplittedPathInstance = nil

	if SplittedPath and SplittedPathSize > 0 then
		assert(game:FindService(SplittedPath[1]), "[Import] - To import a module, Make sure that the First part of your Path is the name of a Service!")
		assert(SplittedPathSize >= 2, "[Import] - Your module must contain atleast 2 Parameters or more on it's Path to be imported!")

		SplittedPathInstance = game:GetService(SplittedPath[1])

		for X = 2, SplittedPathSize do
			local Success, Result = pcall(function()
				return SplittedPathInstance:WaitForChild(SplittedPath[X])
			end)

			if Success and Result ~= nil then
				SplittedPathInstance = Result
			else
				return error(string.format("[Import] - An unexpected error happened while trying to import a module:\n%s", tostring(Result)), 3)
			end
		end

		if SplittedPathInstance and SplittedPathInstance:IsA("ModuleScript") then
			return require(SplittedPathInstance)
		end
	end
end