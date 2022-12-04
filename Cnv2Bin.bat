
@set src=%1
@set dest="./bin.zip"
@set /P key="key:"

@echo %src%
@echo %dest%
@echo %key%

powershell -ExecutionPolicy RemoteSigned -File Cnv2Bin.ps1 -Path %src% -Destination %dest% -Key %key%
