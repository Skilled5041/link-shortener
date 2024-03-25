// DO NOT EDIT: Code generated by matcha from not_found.matcha

import gleam/string_builder.{type StringBuilder}



pub fn render_builder() -> StringBuilder {
    let builder = string_builder.from_string("")
    let builder = string_builder.append(builder, "<!DOCTYPE html>
<html lang=\"en\">
  <head>
    <meta charset=\"utf-8\" />
    <script src=\"/vendor/htmx.min.js\"></script>
    <title>Link Shortener in Gleam and HTMX</title>
  </head>
  <body>
    <h1>Link Not Found</h1>
  </body>
</html>
")

    builder
}

pub fn render() -> String {
    string_builder.to_string(render_builder())
}
