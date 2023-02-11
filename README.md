# Nushell package manager exploration

This project explores ideas how package management could be handled in Nushell and also serves as a test bed to see how it feels to write a full standalone program in Nu.

## Installation

No permanent installation available. It is most usable as an overlay right now: `overlay use nuun/nuun.nu --prefix`

## Uninstallation

`overlay hide nuun` or just `overlay nuun`.

## Usage

* `nuun` root command, does not do much
* `nuun new` creates a new project (directory project or a script)
* `nuun install` installs a project
* `nuun test` runs tests

## Notes

* Need better handling of help messages of `main` (compare `nu nuun.nu --help` vs. `overlay use nuun.nu --prefix; nuun --help`)
  * Might need renaming `main` to the module name also inside the module
* Needs directory as module support
* Need a way to run tests dynamically (see test.nu subcommand, it shouldn't statically include tests/tests.nu)
  * Could be solved by "type-safe" eval
* Command signatures seem to auto-expand args wrong (see new.nu)
* Maybe support running module even with subcommands (`nu nuun/nu.nu test`)
* Wrong err-val spans (try 2x `nuun new spam`)
  * Maybe the span is not preserved when going through the signature?
* `use nuun/nuun.nu` does not work for some reason?
