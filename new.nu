def generate-default-nuon [name: string, type: string] {
    {
        name: $name
        type: $type
    }
    | save project.nuon
}

def generate-hello-world [file: path] {
    [
        'def main [] {'
        '    "Hello world!"'
        '}'
    ]
    | str collect (char nl)
    | save $file
}

def new-script [
    name: string  # name of the script (without extension)
] {
    generate-default-nuon $name script
    # FIXME: why is path expand needed?
    generate-hello-world ($'($name).nu' | path expand)
}

def new-project [
    name: string  # name of the project
] {
    generate-default-nuon $name project

    mkdir $name
    cd $name
    generate-hello-world main.nu
}

# Generate a new empty project
export def main [
    name: string  # name of the project
    path?: path   # path to the project directory
    --script      # generate a script instead
] {
    let root = ($path | default $name)
    mkdir $root
    let root = ($root | path expand -s)
    cd $root

    if ($root | path join project.nuon | path exists) {
        let span = (metadata $root).span
        error make {
            msg: $'Directory seems to be an existing project'
            label: {
                text: $"Directory ($root) already contains 'project.nuon'"
                start: $span.start
                end: $span.end
            }
        }
    }

    if $script {
        new-script $name
    } else {
        new-project $name
    }

}
