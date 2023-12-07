.PHONY: default install run build clean

default: run

install:
	@echo "Installing dependencies"

run:
	@echo "Running the application"
	@.\scripts\run.bat

build:
	@echo "Building the application"
	@mkdir -p build
	@.\scripts\build.bat
	@.\scripts\compile.bat

clean:
	@echo "Cleaning the application"
	@rm -rf build
