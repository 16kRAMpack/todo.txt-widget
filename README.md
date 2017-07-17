# Übersicht todo.txt widget

![A screenshot showing todo.txt-widget in action](https://github.com/16kRAMpack/todo.txt-widget/blob/master/screenshot.png "todo.txt widget")

Made for [Übersicht](http://tracesof.net/uebersicht/)

Reads your [todo.txt](https://github.com/ginatrapani/todo.txt-cli/wiki/The-Todo.txt-Format) file and displays your to-do list.

`todo.coffee` is hopefully easy to follow - and hack. `todo2html.awk` is the (`awk`, obviously) script which does the heavy-lifting - transmogrifying the to-do list into HTML ready for Übersicht.

The widget uses [Solarized](http://ethanschoonover.com/solarized) colours, and also adds a few nicities to `todo.txt`: words can be emphasised by enclosing them in `*`s or `_`s, e.g. `this is *italic*` and `this is _underlined_`:

![A screenshot showing todo.txt-widget's additional features](https://github.com/16kRAMpack/todo.txt-widget/blob/master/screenshot-alt.png "todo.txt widget's additional features")
