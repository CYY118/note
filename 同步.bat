@echo off 
echo File is being uploaded（git pull）, please wait...... 
cd H:\note
git pull

cd E:\Program Files (x86)\Typora\
start Typora.exe
echo File uploaded successfully（git pull） ! 
exit