function LinkCppFlow()
	-- Get the location of the current script file
    local scriptLocation = debug.getinfo(1, "S").source:sub(2)

    -- Determine the relative directory based on the current script location
    local relativeDir = path.getdirectory(scriptLocation)

	filter "configurations:Debug"
		includedirs
		{
			relativeDir .. "/include",
			relativeDir .. "/libtensorflow-cpu-x86_64/include",
		}
		links
		{
			"tensorflow.lib"
		}
		libdirs
		{
			relativeDir .. "/libtensorflow-cpu-x86_64/lib"
		}
		postbuildcommands
		{
			"{COPY} " .. '"' .. relativeDir .. "/libtensorflow-cpu-x86_64/lib/*.dll" .. '"' .. " %{cfg.targetdir}"
		}
	filter "configurations:Release"
		includedirs
		{
			relativeDir .. "/include",
			relativeDir .. "/libtensorflow-cpu-x86_64/include",
		}
		links
		{
			"tensorflow.lib"
		}
		libdirs
		{
			relativeDir .. "/libtensorflow-cpu-x86_64/lib"
		}
		postbuildcommands
		{
			"{COPY} " .. '"' .. relativeDir .. "/libtensorflow-cpu-x86_64/lib/*.dll" .. '"' .. " %{cfg.targetdir}"
		}
	filter "configurations:Dist"
		includedirs
		{
			relativeDir .. "/include",
			relativeDir .. "/libtensorflow-cpu-x86_64/include",
		}
		links
		{
			"tensorflow.lib"
		}
		libdirs
		{
			relativeDir .. "/libtensorflow-cpu-x86_64/lib"
		}
		postbuildcommands
		{
			"{COPY} " .. '"' .. relativeDir .. "/libtensorflow-cpu-x86_64/lib/*.dll" .. '"' .. " %{cfg.targetdir}"
		}
end