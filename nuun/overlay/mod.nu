export module new.nu

use ../utils/dirs.nu [ root-dir-prompt ]

# Manage Nuun overlays
export def main [] {
    root-dir-prompt

    print $'Current overlay path: ($env.NUUN_ROOT)'
}
