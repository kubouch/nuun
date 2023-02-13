# TODO:
# * make this a dir module

export use init.nu
export use install.nu
export use new.nu
export use overlay/overlay.nu
export use test.nu

use utils/dirs.nu [ root-dir-prompt ]

export-env {
    if 'NUUN_ROOT' not-in $env {
        let-env 'NUUN_ROOT' = ('~/.nuun' | path expand)
    }
}

# Nuun experimental project management tool
export def main [] {
    root-dir-prompt

    print 'enjoy!'
}
