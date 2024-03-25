// DO NOT EDIT: Code generated by matcha from home.matcha

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
    <form>
        <input type=\"text\" name=\"url\" id=\"url\" placeholder=\"Enter a URL\" required>
        <button hx-post=\"/shorten\" hx-target=\"#shortened\">Shorten</button>
    </form>
    <div id=\"shortened\">
    </div>
  </body>
</html>
")

    builder
}

pub fn render() -> String {
    string_builder.to_string(render_builder())
}

