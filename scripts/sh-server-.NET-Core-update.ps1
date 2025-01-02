Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/6.0.26/dotnet-runtime-6.0.26-win-x64.exe" -OutFile "C:\Temp\dotnet-runtime-6.0.26-win-x64.exe"
Start-Process -FilePath "C:\Temp\dotnet-runtime-6.0.26-win-x64.exe" -ArgumentList "/quiet" -Wait
