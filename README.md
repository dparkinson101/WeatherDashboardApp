# Weather Dashboard App

## Installing Dependencies:
Dependencies are managed by the CMake `ExternalProject` module so make sure this is enabled and then all dependencies should be downloaded and built automatically.

## Building & Testing
This project untilises two shell scripts to build and test to project:
`./build.sh`
`./test.sh`

## Adding Tests
In the `tests` folder you will find the current boost unit test modules. You can add to these by doing the following:
- Before creating new module look through existing ones to see if there's a realivant place for it already.
    - If not place your new .cpp test file in the appropriate sub-folder or create one
- Add any source files you require from the main project into the `tests/CMakeLists.txt` file
- Register new test module (if new module added) with CTest in `tests/CMakeLists.txt`
- Run `test.sh` to ensure the test passes