# TODO: Make this a dir module

# FIXME: cyclical import:
#use ../nuun.nu

export def main [] {
    [
        {
            name: creates-project
            run: {||
                nuun new spam

                [
                    (open spam/project.nuon)
                    ('Hello world!' in (open spam/spam/main.nu))
                ]
            }
            expected: [
                { name: spam, type: project, version: "0.1.0" }
                true
            ]
        }
        {
            name: creates-script
            run: {||
                nuun new spam --script

                [
                    (open spam/project.nuon | to nuon)
                    ('Hello world!' in (open spam/spam.nu))
                ]
            }
            expected: [
                ({ name: spam, type: script, version: "0.1.0" } | to nuon)
                true
            ]
        }
        {
            name: intentional-fail
            run: {|| 'spam' }
            expected: 'eggs'
        }
    ]
}
