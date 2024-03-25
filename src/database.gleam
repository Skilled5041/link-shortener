import gleam/result
import sqlight
import error.{type AppError}

pub fn with_connection(name: String, f: fn(sqlight.Connection) -> a) -> a {
  use db <- sqlight.with_connection(name)
  let assert Ok(_) = sqlight.exec("pragma foreign_keys = on;", db)
  f(db)
}

pub fn migrate_schema(db: sqlight.Connection) -> Result(Nil, AppError) {
  sqlight.exec(
    "
    create table if not exists links (
        shortened_link text primary key not null,
        original_link text not null
    );",
    db,
  )
  |> result.map_error(error.SqlightError)
}
