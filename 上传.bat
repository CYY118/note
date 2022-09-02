@echo off 
echo File is being uploaded, please wait...... 
H:\>cd note
dir
git add .
git commit -m "test"
git push

echo File uploaded successfully ! 
echo. & pause 
exit