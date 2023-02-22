use utils/errors.nu [ err-val ]

def generate-default-nuon [name: string, type: string] {
    {
        name: $name
        type: $type
        version: "0.1.0"
    }
    | save project.nuon
}

def generate-hello-world [] {
    [
        'def main [] {'
        '    "Hello world!"'
        '}'
    ]
    | str collect (char nl)
}

def new-script [
    name: string  # name of the script (without extension)
] {
    generate-default-nuon $name script
    # FIXME: why is path expand needed?
    [
        '#!/usr/bin/env nu'
        (generate-hello-world)
    ]
    | str collect (char nl)
    | save ($'($name).nu' | path expand)
}

def new-project [
    name: string  # name of the project
] {
    generate-default-nuon $name project

    mkdir $name
    cd $name
    generate-hello-world | save main.nu
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
        (err-val $root
            'Directory seems to be an existing project'
            $"Directory ($root) already contains 'project.nuon'")
    }

    if $script {
        new-script $name
    } else {
        new-project $name
    }
}
