export def err-val [val: any, msg: string, label?: string] {
    let label = ($label | default "originates from here")
    let span = (metadata $val).span
    error make {
        msg: $msg
        label: {
            text: $label
            start: $span.start
            end: $span.end
        }
    }
}
