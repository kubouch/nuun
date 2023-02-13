use utils/dirs.nu [ root-dir-prompt ]
use utils/errors.nu [ err-val ]

# Install a project
export def main [
    name: path  # The project directory containing project.nuon
] {
    root-dir-prompt

    if not ($name | path join project.nuon | path exists) {
        (err-val $name
            $'Directory does not seem to be a project'
            $"Directory ($name) does not contain 'project.nuon'")
    }

    cd $name

    let project_data = (open project.nuon)

    let project_type = try {
        $project_data.type
    } catch {
        (err-val $name
            "Project does not have a type"
            "project.nuon is missing 'type' column")
    }

    let project_name = try {
        $project_data.name
    } catch {
        (err-val $name
            "Project does not have a name"
            "project.nuon is missing 'name' column")
    }

    let install_dir = ($env.NUUN_ROOT | path join 'bin')

    if $project_type == 'script' {
        let script_file = $project_name + '.nu'
        mkdir $install_dir
        cp $script_file $install_dir
    } else if $project_type == 'project' {
        err-val $project_type "TODO!"
    } else {
        err-val $project_type $"Unknown project type: ($project_type)"
    }
}
