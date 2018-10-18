@echo off
echo Running After >> akk.log
move "%2_tidy.txt" "tidy\%2_tidy.txt" >> akk.log
move "%2_stripped.au3" "stripped\%2_stripped.au3" >> akk.log
echo Ended >> akk.log