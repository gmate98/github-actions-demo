/**
 * version.h
 *
 *  Created on: 26.1.2021
 *      Author: Lukas Zembrot (lz@3rd-element.com)
 */

#ifndef INC_VERSION_H_
#define INC_VERSION_H_

#include <stdint.h>

/**
 * Struct to hold the version number
 */
struct Version {
	/**
	 * Major revision number
	 */
	uint8_t major;
	/**
	 * Minor revision number
	 */
	uint8_t minor;
	/**
	 * Patch number
	 */
	uint8_t patch;
	/**
	 * The first 4 bytes of the git commit hash
	 */
	uint8_t hash[4];
	union {
		struct {
			uint8_t rc: 1;
			uint8_t dev: 1;
			uint8_t dirty: 1;
		} flags;
		uint8_t flags_grouped;
	};
};

/**
 * The version of the program/source.
 * Do not change!
 */
extern struct Version version;

#endif /* INC_VERSION_H_ */
