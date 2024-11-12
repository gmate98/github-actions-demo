#pragma once

#include <gmock/gmock.h>

extern "C" {
    #include "stm32l1xx_hal.h"
}


/**
 * Mock class with HAL_GPIO_TogglePin function of stm32 hal library
 */
class STM32HalGPIOTogglePinFunctionMock {
public:
    MOCK_METHOD(void, HAL_GPIO_TogglePin, (GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin));
};

/**
 * We need the following to be able to inject the mocked function
 * 
 * Make sure to initialize this pointer before calling HAL_GPIO_TogglePin
 * Make sure to delete it after the test function is done
 * 
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 * !!! Because of this we can not parallelize the tests !!!
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 */
extern STM32HalGPIOTogglePinFunctionMock* stm32hgtpfm;