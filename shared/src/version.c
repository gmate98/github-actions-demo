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
	.patch = 4,
	.hash = {0xe1, 0x3f, 0x0c, 0x85},
	.flags.rc = 0,
	.flags.dev = 1,
	.flags.dirty = 1
};
