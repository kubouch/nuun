use ../utils/dirs.nu [ root-dir-prompt ]
use ../utils/errors.nu [ err-val ]

# Create new overlay
export def main [
    name: string  # name of the overlay
] {
    root-dir-prompt

    let overlay_file = ($env.NUUN_ROOT
        | path join overlays
        | path join ($name + '.nu'))

    if ($overlay_file | path exists) {
        (err-val $overlay_file
            $'Overlay "($name)" already exists!'
            $'found ($overlay_file)')
    }

    let overlay_dir = ($env.NUUN_ROOT | path join overlays | path join $name)
    let overlay_bin_dir = ($overlay_dir | path join bin)
    mkdir $overlay_dir
    mkdir $overlay_bin_dir

    [
        'export-env {'
        '    $env.PATH = ($env.PATH | where $it != ($env.NUUN_ROOT | path join bin))'
        $"    $env.PATH = \($env.PATH | prepend ($overlay_bin_dir)\)"
        $'    $env.NUUN_ROOT = ($overlay_dir)'
        '}'
    ]
    | str join (char nl)
    | save $overlay_file

    print $'Created ($overlay_file)!'
}
