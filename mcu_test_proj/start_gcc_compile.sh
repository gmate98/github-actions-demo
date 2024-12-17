rm -rf build
cmake . --preset=gcc-debug
cmake --build --preset=gcc-debug -v
cd build/gcc-debug
${HOME}/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI -c port=SWD -d mcu_test_proj.elf -g