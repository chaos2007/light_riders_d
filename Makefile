all:
	dmd -O -release main && ./main

dist:
	zip dist.zip main.d


