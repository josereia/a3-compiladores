.PHONY: default run

default: run

build:
	@echo "Building the application"
	@echo "Generating jflex and jcup"
	@.\scripts\gera_jflex_jcup.bat
	@echo "Compiling..."
	@.\scripts\compila.bat
	@echo "Build finished!"

run:
	@echo "Running the application"
	@.\scripts\executa.bat
