/**
 * version.c
 *
 *  Created on: 26.1.2021
 *      Author: Lukas Zembrot (lz@3rd-element.com)
 */

#include "version.h"

struct Version version = {
	.major = 1,
	.minor = 1,
	.patch = 2,
	.hash = {0xd4, 0x1c, 0x6f, 0xda},
	.flags.rc = 0,
	.flags.dev = 1,
	.flags.dirty = 1
};
