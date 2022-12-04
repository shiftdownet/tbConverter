
@set src=%1
@set dest="./bin.txt"
@set /P key="key:"

@echo %src%
@echo %dest%
@echo %key%

powershell -ExecutionPolicy RemoteSigned -File Cnv2Txt.ps1 -Path %src% -Destination %dest% -Key %key%
