/**
 * version.c
 *
 *  Created on: 26.1.2021
 *      Author: Lukas Zembrot (lz@3rd-element.com)
 */

#include "version.h"

struct Version version = {
	.major = 1,
	.minor = 2,
	.patch = 3,
	.hash = {0xe2, 0xec, 0x05, 0x4e},
	.flags.rc = 0,
	.flags.dev = 1,
	.flags.dirty = 1
};
