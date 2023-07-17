@echo off 
echo File is being uploaded, please wait...... 
cd E:\note
git add .
set t=%date%  %time%
git commit -m "%t%"
@echo %t%
git push
echo File uploaded successfully ! 
del /f /s /q "C:\Users\cyy\AppData\Roaming\Typora\typora-user-images\*.*"
echo Prcture Clear successfully ! 

exit