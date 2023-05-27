def main [project_nuon: path] {
    let settings = (open $project_nuon)
    let version = $settings.version
    let os = $nu.os-info.name

    let archive_name = $'nu-($version)-x86_64-unknown-linux-gnu.tar.gz'
    let url = ([
        https://github.com/nushell/nushell/releases/download
        $version
        $archive_name
    ]
    | str join '/')

    if $os == 'linux' {
        http get $url | save $archive_name
        tar -xvzf $archive_name

        cd ($archive_name | path parse -e tar.gz).stem
        cp nu* ($env.NUUN_ROOT | path join bin)
    } else if $os == 'windows' {
        print 'TODO!'
    } else if $os == 'macos' {
        print 'TODO!'
    } else {
        print $'Unsupported OS: ($os)'
    }
}
