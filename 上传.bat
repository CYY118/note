@echo off 
echo File is being uploaded, please wait...... 
git add .
git commit -m "test"
git push
echo File uploaded successfully ! 
del /f /s /q "C:\Windows\System32\config\systemprofile\Waytech\CloudDrive\Temp\*.*"
echo Prcture Clear successfully ! 
exit