# Nuun: experimental project management tool

export module init.nu
export module install.nu
export module new.nu
export module overlay/
export module test.nu

use utils/dirs.nu [ root-dir-prompt ]

export-env {
    if 'NUUN_ROOT' not-in $env {
        let-env 'NUUN_ROOT' = ('~/.nuun' | path expand)
    }
}

# Top-level command. Does nothing, just ensures the root directory is set up.
export def main [] {
    root-dir-prompt

    print 'enjoy!'
}
