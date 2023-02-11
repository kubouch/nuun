# Nushell package manager exploration

This project explores ideas how package management could be handled in Nushell and also serves as a test bed to see how it feels to write a full standalone program in Nu.

## Installation

For now: Clone this repository and call `nu nuun.nu` directly.

## Notes

* Need better handling of help messages of `main` (compare `nu nuun.nu --help` vs. `overlay use nuun.nu --prefix; nuun --help`)
* Needs directory as module support
* Need a way to run tests dynamically (see test.nu subcommand, it shouldn't statically include tests/tests.nu)
* Command signatures seem to auto-expand args wrong (see new.nu)
