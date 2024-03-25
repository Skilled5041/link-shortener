import wisp.{type Request, type Response}
import mist
import gleam/erlang/process
import templates/home
import templates/not_found
import gleam/regex
import gleam/string

pub fn handle_request(req: Request) -> Response {
  let req = wisp.method_override(req)
  use <- wisp.log_request(req)
  use <- wisp.rescue_crashes
  use req <- wisp.handle_head(req)

  case wisp.path_segments(req) {
    [] -> wisp.html_response(home.render_builder(), 200)
    [_] -> get_full_link(req.path)
    [_, _, ..] -> wisp.html_response(not_found.render_builder(), 200)
  }
}

pub fn get_full_link(path: String) -> Response {
  // Alphanumeric, 64 characters long max
  let assert Ok(validation_regex) = regex.compile("^[a-zA-Z0-9]{1,64}$", regex.Options(case_insensitive: True, multi_line: False))
  case regex.check(with: validation_regex, content: string.lowercase(path)) {
    True -> wisp.html_response(home.render_builder(), 200)
    False -> wisp.html_response(not_found.render_builder(), 200)
  }
}

pub fn main() {
  let assert Ok(_) =
    wisp.mist_handler(handle_request, "a")
    |> mist.new
    |> mist.port(8000)
    |> mist.start_http

  process.sleep_forever()
}
