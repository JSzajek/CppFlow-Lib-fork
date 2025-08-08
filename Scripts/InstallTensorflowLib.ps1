# Determine the script's directory
$scriptLocation = $MyInvocation.MyCommand.Path
$relativeDir = Split-Path -Parent $scriptLocation


$tf_version = "2.18.1"
$tf_url = "https://storage.googleapis.com/tensorflow/versions/$tf_version/libtensorflow-cpu-windows-x86_64.zip"
$output_dir = Join-Path $relativeDir "../libtensorflow-cpu-windows-x86_64"

Write-Host "Checking For TensorFlow C API"

if (Test-Path $output_dir) {
    Write-Host "TensorFlow C API Found At '$output_dir'. Skipping download."
    exit 0
}


$download_file = Join-Path $relativeDir "tensorflow.zip"
Write-Host "Downloading TensorFlow C API $tf_version..."

# Create the output directory
New-Item -ItemType Directory -Force -Path $output_dir | Out-Null

# Download TensorFlow ZIP
Invoke-WebRequest -Uri $tf_url -OutFile $download_file

# Extract the archive
Expand-Archive -Path $download_file -DestinationPath $output_dir -Force

# Remove the downloaded ZIP
Remove-Item -Path $download_file -Force

Write-Host "TensorFlow C API downloaded to $output_dir"