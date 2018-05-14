signature TEST = sig
  type 'state test
  type sketched
  type implemented
  val sketch : unit -> sketched test
  val implement : sketched test -> implemented test
end

structure AutoTest : TEST = struct
type 'level test = 'level
type sketched = { sketchedAt : string }
type implemented =
     { sketch : sketched test,
       implementedAt : string }
fun sketch () = { sketchedAt = "now" }
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
  type test_implemented
  type solution_implemented
  type tested
  val plan : unit -> planned feature
  val implementTest : planned feature -> test_implemented feature
  val implementSolution : test_implemented feature -> solution_implemented feature
  val test : solution_implemented feature -> tested feature
end

structure Feature : FEATURE = struct
structure T = AutoTest
structure S = Solution
type 'level feature = 'level
type planned = {}
type test_implemented =
     { test : T.implemented T.test }
type solution_implemented =
     { solution : S.implemented S.solution }
type tested = {}
fun plan () = {}
fun implementTest x =
    { test = T.implement (T.sketch ()) }
fun implementSolution x =
    { solution = S.implement () }
fun test x = {}
end

val planned = Feature.plan ()
val implementedTest = Feature.implementTest (planned)
val implementedSolution = Feature.implementSolution (implementedTest)
val tested = Feature.test (implementedSolution)
