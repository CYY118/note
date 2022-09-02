@echo off 
echo File is being uploaded, please wait...... 
git add .
set time="1235456798"
git commit -m "test"
@echo %time%
git push
echo File uploaded successfully ! 
del /f /s /q "C:\Users\caoyangyang\AppData\Roaming\Typora\typora-user-images\*.*"
echo Prcture Clear successfully ! 
pause
exit