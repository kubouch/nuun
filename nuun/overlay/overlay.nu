# TODO: Convert to dir module

export use new.nu

use ../utils/dirs.nu [ root-dir-prompt ]

# Manage Nuun overlays
export def main [] {
    root-dir-prompt

    print $'Current overlay path: ($env.NUUN_ROOT)'
}
