export def root-dir-prompt [] {
    if not ($env.NUUN_ROOT | path exists) {
        mut answer = ''

        while ($answer | str downcase) not-in [ y n ] {
            $answer = (input (
                $'Root directory "($env.NUUN_ROOT)" does not exist.'
                + ' Do you want to create one? [y/n] '))
        }

        if ($answer | str downcase) == 'y' {
            mkdir $env.NUUN_ROOT
            print $"Don't forget to update your PATH/Path and/or NU_LIB_DIRS!"
        } else {
            return
        }
    }
}
