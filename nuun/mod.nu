# Nuun: experimental project management tool

export module overlay/

use utils/dirs.nu [ root-dir-prompt ]

export-env {
    if 'NUUN_ROOT' not-in $env {
        let-env 'NUUN_ROOT' = ('~/.nuun' | path expand)
    }
}

# Nuun: experimental project management tool
export def main [] {
    root-dir-prompt

    print 'enjoy!'
}
