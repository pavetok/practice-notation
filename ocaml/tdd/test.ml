module type TEST = sig
  type 'state test
  type sketched
  type implemented
  type executed
  val sketch : unit -> sketched test
  val implement : sketched test -> implemented test
  val execute : implemented test -> executed test
end

module AutoTest : TEST = struct
  type 'level test = 'level
  type sketched =
    { sketchedAt : string }
  type implemented =
    { implementedAt : string }
  type executed =
    { executedAt : string }
  let sketch () =
    { sketchedAt = "now" }
  let implement x =
    { implementedAt = "now" }
  let execute x =
    { executedAt = "now" }
end
