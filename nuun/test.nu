# Run tests

# TODO: Remove this dependency, should be run-time
use ../tests/tests.nu

def tmp-dir [] {
    $env.NUUN_ROOT
    | path join tests
    | path join tmp
    | path join (random chars -l 8)
}

# Run project tests
export def main [] {
    tests | par-each {|test|
        let tmp_dir = tmp-dir
        mkdir $tmp_dir
        cd $tmp_dir

        mut failed_msg = ""
        mut success = true

        let result = do $test.run

        for row in ($result | zip $test.expected | enumerate) {
            let i = $row.index
            let pair = $row.item
            if $pair.0 != $pair.1 {
                $success = false
                $failed_msg += $"[($i)] expected: ($pair.1)\n"
                $failed_msg += $"[($i)] got:      ($pair.0)\n"
            }
        }

        let info = if $success {
            $'($test.name) ($tmp_dir) ... success'
        } else {
            [
                $'($test.name) ($tmp_dir) ... failed'
                $failed_msg
            ]
            | str join (char nl)
        }

        print $info

        cd -
        rm -rf $tmp_dir
    }
}
