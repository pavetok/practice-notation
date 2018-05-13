signature TEST = sig
  type sketched
  type implemented
  type 'state test
  val sketch : unit -> sketched test
  val implement : sketched test -> implemented test
end

structure AutoTest : TEST = struct
type sketched = { sketched_at : string }
type implemented = {}
type 'level test = 'level
fun sketch () = { sketched_at = "now" }
fun implement x = {}
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
type planned = {}
type test_implemented = AutoTest.implemented AutoTest.test
type solution_implemented = {}
type tested = {}
type 'level feature = 'level
fun plan () = {}
fun implementTest x = AutoTest.implement (AutoTest.sketch ())
fun implementSolution x = {}
fun test x = {}
end

val planned = Feature.plan ()
val testImplemented = Feature.implementTest (planned)
val solutionImplemented = Feature.implementSolution (testImplemented)
val tested = Feature.test (solutionImplemented)
