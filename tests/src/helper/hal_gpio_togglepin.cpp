#include "hal_gpio_togglepin.hpp"

void HAL_GPIO_TogglePin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin) {
    return stm32hgtpfm->HAL_GPIO_TogglePin(GPIOx, GPIO_Pin);
}

STM32HalGPIOTogglePinFunctionMock* stm32hgtpfm = nullptr;