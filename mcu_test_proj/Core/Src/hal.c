#include "hal.h"
#include "main.h"

void toggleLED() {
	HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
}