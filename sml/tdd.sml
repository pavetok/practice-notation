signature TEST = sig
  type sketched
  type implemented
  type 'state test
  val sketch : unit -> sketched test
  val implement : sketched test -> implemented test
end

structure AutoTest : TEST = struct
type sketched = { sketchedAt : string }
type implemented = {}
type 'level test = 'level
fun sketch () = { sketchedAt = "now" }
fun implement x = {}
end

signature SOLUTION = sig
  type implemented
  type 'state solution
  val implement : unit -> implemented solution
end

structure Solution : SOLUTION = struct
type implemented = {}
type 'level solution = 'level
fun implement () = {}
end

signature FEATURE = sig
  type planned
  type test_implemented
  type solution_implemented
  type tested
  type 'state feature
  val plan : unit -> planned feature
  val implementTest : planned feature -> test_implemented feature
  val implementSolution : test_implemented feature -> solution_implemented feature
  val test : solution_implemented feature -> tested feature
end

structure Feature : FEATURE = struct
structure T = AutoTest
structure S = Solution
type planned = {}
type test_implemented = { test : T.implemented T.test }
type solution_implemented = { solution : S.implemented S.solution }
type tested = {}
type 'level feature = 'level
fun plan () = {}
fun implementTest x = { test = T.implement (T.sketch ()) }
fun implementSolution x = { solution = S.implement () }
fun test x = {}
end

val planned = Feature.plan ()
val implementedTest = Feature.implementTest (planned)
val implementedSolution = Feature.implementSolution (implementedTest)
val tested = Feature.test (implementedSolution)
