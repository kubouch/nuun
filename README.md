# Nushell package manager exploration

This project explores ideas how package management could be handled in Nushell and also serves as a test bed to see how it feels to write a full standalone program in Nu.

## Installation

No permanent installation available. It is most usable as an overlay right now: `overlay use nuun/ --prefix`.

Nuun expects:
* `~/.nuun/bin` to be in your $env.PATH or $env.Path
* `~/.nuun/overlays` to be in you $env.NU_LIB_DIRS

## Uninstallation

`overlay hide nuun` and any other overlays you might have activated (or just keep calling `overlay hide` until sufficient).

## Usage

* `nuun` root command, does not do much
* `nuun new` creates a new project (directory project or a script)
* `nuun install` installs a project into the
* `nuun test` runs tests

### Basic "virtual environment" functionality

Handled by `nuun overlay` family of commands and Nushell's overlay mechanism.

`nuun overlay new <name>` will create a new overlay under `~/.nuun/overlays`. Calling `overlay use <name>.nu` will activate the overlay with PATH/Path pointing at `~/.nuun/overlays/<name>/bin`. Any projects installed by `nuun install` will be installed there.

## TODO

* Use https://github.com/jntrnr/nu_app to compile to binaries
* Support Windows Path as well

## Notes

* Need better handling of help messages of `main` (compare `nu nuun/mod.nu --help` vs. `overlay use nuun/ --prefix; nuun --help`)
  * Might need renaming `main` to the module name also inside the module
  * We could support running a directory: `nu nuun/`
* Needs directory as module support
* Need a way to run tests dynamically (see test.nu subcommand, it shouldn't statically include tests/tests.nu)
  * Could be solved by "type-safe" eval
* Command signatures seem to auto-expand args wrong (see new.nu)
* Maybe support running module even with subcommands (`nu nuun/nu.nu test`)
* Wrong err-val spans (try 2x `nuun new spam`)
  * Maybe the span is not preserved when going through the signature?
* autoformatter would be great for the auto-generated project.nuon files
* auto-appending to project.nuon should preserve comments
