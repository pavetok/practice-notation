signature TEST = sig
  type 'state test
  type sketched
  type implemented
  val sketch : unit -> sketched test
  val implement : sketched test -> implemented test
end

structure AutoTest : TEST = struct
type 'level test = 'level
type sketched =
     { sketchedAt : string }
type implemented =
     { sketch : sketched test,
       implementedAt : string }
fun sketch () =
    { sketchedAt = "now" }
fun implement sketch =
    { sketch = sketch,
      implementedAt = "now" }
end

signature SOLUTION = sig
  type 'state solution
  type implemented
  val implement : unit -> implemented solution
end

structure Solution : SOLUTION = struct
type 'level solution = 'level
type implemented = {}
fun implement () = {}
end

signature FEATURE = sig
  type 'state feature
  type planned
  type designed
  type implemented
  type tested
  type deployed
  type in_use
  type retired
  val plan : unit -> planned feature
  val implement : planned feature -> implemented feature
  val test : implemented feature -> tested feature
end

structure Feature : FEATURE = struct
structure T = AutoTest
structure S = Solution
type 'level feature = 'level
type planned = {}
type designed = {}
type implemented = {}
type tested = {}
type deployed = {}
type in_use = {}
type retired = {}
fun plan () = {}
fun implement x = {}
fun test x = {}
end

val planned = Feature.plan ()
val implemented = Feature.implement (planned)
val tested = Feature.test (implemented)
