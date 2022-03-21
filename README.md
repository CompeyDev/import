## 📥 Import
This is a mimic of the `import` function from JavaScript/Python ported to Roblox Luau. Basically, What it does, Is import ModuleScripts from a string (Path) and require it. It's good to use this over the regular `require()` function as you don't need to reference alot of Instances/Folders/Paths to get the ModuleScript and also because you can just use strings for doing so. Those are not the only good things about it, It's also good because:

1. It uses `Instance:WaitForChild()` instead of just directly indexing.
2. As it uses WaitForChild, It is Client-safe, As the Client takes a small time to Load Instances and not waiting for them can result in errors.
3. Only returns if the Object is a ModuleScript.
4. Automatically returns the ModuleScript's required version.

## 🧪 Getting Started
To get started, Grab the [**Source Code**](https://github.com/CrunchAstroX/import/blob/main/src/init.lua) and paste it inside an empty ModuleScript. (Create a new ModuleScript, Put it anywhere you want to that can easily be accessed by Scripts, Clear the ModuleScript and paste it) It's recommended to not put it at a "deep end" place (Inside alot of Folders) as it would be tiring to always need to write alot of paths just to get it.

After you do the Setup-steps, You can just require the Module. (Make sure that you name the Module's variable "import") And then you're ready to go! Here's an example of what it would look like:

```lua
-- Assuming the Module is inside the Script...
local import = require(script.import)
```

<hr class = "solid">

For testing, Let's try getting a Module named "Test" from ReplicatedStorage. Before we do this, Keep in mind that there's two different ways of using the Module. The first way of calling the Module is without parentheses, And the second one is with parentheses. None of them are better than each other, It mostly depends on the way you like to use it, I personally prefer using without, But that's just a personal choice!

_**Note that the first parameter of the Path must be the name of a valid Roblox Service, Not providing it will result in an error.**_

```lua
-- Using parentheses
local Test = import('ReplicatedStorage/Test')

-- Without using parentheses
local Test = import 'ReplicatedStorage/Test'
```

After we get the Module, We are gonna test it, Assuming that there's a function inside of it called "DidItWork", But you can use any other function that you want to!

```lua
Test.DidItWork()
```

Output:

```
Congratulations! You found me! The module worked! :)
```
