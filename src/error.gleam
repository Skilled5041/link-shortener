import sqlight

pub type AppError {
  NotFound
  MethodNotAllowed
  BadRequest
  SqlightError(sqlight.Error)
}