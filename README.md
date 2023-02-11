# Nushell package manager exploration

This project explores ideas how package management could be handled in Nushell and also serves as a test bed to see how it feels to write a full standalone program in Nu.

## Installation

`use nuun/nuun.nu` or `overlay use nuun/nuun.nu --prefix` brings in the `nuun xxx` commands.

## Notes

* Need better handling of help messages of `main` (compare `nu nuun.nu --help` vs. `overlay use nuun.nu --prefix; nuun --help`)
  * Might need renaming `main` to the module name also inside the module
* Needs directory as module support
* Need a way to run tests dynamically (see test.nu subcommand, it shouldn't statically include tests/tests.nu)
  * Could be solved by "type-safe" eval
* Command signatures seem to auto-expand args wrong (see new.nu)
