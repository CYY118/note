@echo off 
echo File is being uploaded, please wait...... 
git add .
git commit -m "test"
git push
echo File uploaded successfully ! 
del /f /s /q "C:\Users\caoyangyang\AppData\Roaming\Typora\typora-user-images\*.*"
echo Prcture Clear successfully ! 
exit