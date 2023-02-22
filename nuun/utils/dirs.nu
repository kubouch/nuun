export def root-dir-prompt [] {
    if not ($env.NUUN_ROOT | path exists) {
        mut answer = ''

        while ($answer | str downcase) not-in [ y n ] {
            $answer = (input (
                $'Root directory "($env.NUUN_ROOT)" does not exist.'
                + ' Do you want to create one? [y/n] '))
        }

        if ($answer | str downcase) != 'y' {
            return
        }

        mkdir $env.NUUN_ROOT

        let bin_dir = ($env.NUUN_ROOT | path join bin)
        let overlays_dir = ($env.NUUN_ROOT | path join overlays)

        mkdir $bin_dir
        mkdir $overlays_dir

        print ($"Don't forget to add ($bin_dir) to PATH/Path"
            + $" and ($overlays_dir) to NU_LIB_DIRS environment variables!")
    }
}


export def tmp-dir [subdir: string] {
    $env.NUUN_ROOT
    | path join tmp
    | path join $subdir
    | path join (random chars -l 8)
}
