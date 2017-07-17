Version = "0.1.0"

config = {
    font: "PT Mono"  # e.g. "Courier New", "PT Mono", "OperatorMono-Light"
    backgroundBlur: "5px"   # e.g. false, "15px"
}

command: ". ~/.bashrc; export TERM=xterm-256color; /usr/local/bin/todo.sh -p list | todo.widget/todo2html.awk"

refreshFrequency: 5000 # ms: 5000ms = 5s

render: (output) ->
        "<div id=\"todoid\">#{output}</div>"

afterRender: (domEl) ->
    $(domEl).find('#todoid').width screen.width + "px"

style: """
    z-index: 0
    font-family: #{config.font}
    padding-left: 0.75em
    padding-right: 0.75em
    padding-top: 0.5em
    padding-bottom: 0.5em
    color: #93a1a1
    left: 0px
    bottom: 0px
    font-size: 110%
    background: linear-gradient(left, rgba(0, 43, 54, 1.0), rgba(0, 43, 54, 0.5))
    if #{config.backgroundBlur}
        -webkit-backdrop-filter: blur(#{config.backgroundBlur})

    div#todoid table
        table-layout: normal

    td
        padding-right: 0.5em
        border: 0
        box-sizing: content-box

    td div
        max-width: 95vw
        overflow: hidden
        text-overflow: ellipsis
        white-space: nowrap

    span.todo_item
        color: #fdf6e3

    span.todo_priority
        color: #fdf6e3
        padding-left: 0.25em
        padding-right: 0.25em

    span.todo_pri_A
        background-color: #dc322f
        font-weight: bold

    span.todo_pri_B
        background-color: #dc322f

    span.todo_pri_C
        background-color: #b58900
        font-weight: bold

    span.todo_pri_D
        background-color: #b58900

    span.todo_pri_E
        font-weight: bold

    span.todo_project
        color: #2aa198

    span.todo_context
        color: #859900

    span.todo_star
        font-weight: bold
        font-style: italic

    span.todo_line
        text-decoration: underline

    span.todo_lowlight
        color: #586e75

    span.todo_highlight
        color: #fdf6e3

    span.todo_date
        color: #586e75

    span.todo_kvp_key
        color: #268bd2

    span.todo_kvp_value
        color: #b58900
"""
