@echo=off

cd source

..\pasdoc --staronly --graphviz-classes --graphviz-uses -N SQLite4Delphi -O html -E ..\help  -S ..\pasdoc_src.txt  >> ..\pasdoc_log.txt

cd ..


