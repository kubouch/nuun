use utils/dirs.nu [ root-dir-prompt ]
use utils/errors.nu [ err-val ]

# Install a project
export def main [
    dir: path  # The project directory containing project.nuon
] {
    root-dir-prompt

    if not ($dir | path join project.nuon | path exists) {
        (err-val $dir
            $'Directory does not seem to be a project'
            $"Directory ($dir) does not contain 'project.nuon'")
    }

    cd $dir

    let project_data = (open project.nuon)

    let project_type = try {
        $project_data.type
    } catch {
        (err-val $dir
            "Project does not have a type"
            "project.nuon is missing 'type' column")
    }

    let project_name = try {
        $project_data.name
    } catch {
        (err-val $dir
            "Project does not have a name"
            "project.nuon is missing 'name' column")
    }

    let bin_dir = ($env.NUUN_ROOT | path join 'bin')

    if $project_type == 'script' {
        let script_file = $project_name + '.nu'
        mkdir $bin_dir
        cp $script_file $bin_dir
    } else if $project_type == 'project' {
        err-val $project_type "TODO!"
    } else {
        err-val $project_type $"Unknown project type: ($project_type)"
    }

}
