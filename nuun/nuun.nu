# TODO:
# * make this a dir module

export use init.nu
export use install.nu
export use new.nu
export use test.nu

export-env {
    if 'NUUN_ROOT' not-in $env {
        let-env 'NUUN_ROOT' = ('~/.nuun' | path expand)
    }
}

def root-prompt [] {
    if not ($env.NUUN_ROOT | path exists) {
        mut answer = ''

        while ($answer | str downcase) not-in [ y n ] {
            $answer = (input $'Root directory "($env.NUUN_ROOT)" does not exist. Do you want to create one? [y/n] ')
        }

        if ($answer | str downcase) == 'y' {
            mkdir $env.NUUN_ROOT
            print $"Don't forget to put \"($env.NUUN_ROOT)\" to your PATH/Path!"
        } else {
            return
        }
    }
}

# Nuun experimental project management tool
export def main [] {
    root-prompt

    print 'enjoy!'
}
