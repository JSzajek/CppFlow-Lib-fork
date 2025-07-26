function InstallTensorFlowLib()
	-- Get the location of the current script file
	local scriptLocation = debug.getinfo(1, "S").source:sub(2)
	local relativeDir = path.getdirectory(scriptLocation)
	
	local tf_version = "2.18.1"
	local tf_url = "https://storage.googleapis.com/tensorflow/versions/" .. tf_version  .. "/libtensorflow-cpu-windows-x86_64.zip"
	local output_dir = relativeDir .. "/libtensorflow-cpu-windows-x86_64/"

	print("Checking For TensorFlow C API")
	
	if os.isdir(output_dir) then
		print("TensorFlow C API Found At '" .. output_dir .. "'. Skipping download.")
		return
	end
	
	local download_file = relativeDir .. '/tensorflow.zip'
	print("Downloading TensorFlow C API " .. tf_version .. "...")
	
	os.execute('mkdir "' .. output_dir .. '"')
	os.execute('curl -L -o "' .. download_file .. '" "' .. tf_url .. '"')
	os.execute('powershell -Command "Expand-Archive -Path \'' .. download_file .. '\' -DestinationPath \'' .. output_dir .. '\' -Force"')
	os.execute('powershell -Command "Remove-Item -Path \'' .. download_file .. '\' -Force"')

	print("TensorFlow C API downloaded to " .. output_dir)
	end