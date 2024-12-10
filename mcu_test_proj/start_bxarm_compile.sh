rm -rf build
cmake . --preset=bxarm-debug
cmake --build --preset=bxarm-debug
cd build/bxarm-debug
${HOME}/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI -c port=SWD -d mcu_test_proj.elf -g