module type SPRINT = sig
  type planned
  type started
  type 'state sprint
  val plan : unit -> planned sprint
  val start : planned sprint -> started sprint
end

module type TEST = sig
  type sketched
  type implemented
  type passed
  type 'state test
  val sketch : unit -> sketched test
  val implement : sketched test -> implemented test
  val run : implemented test -> passed test
end

module AutoTest : TEST = struct
  type sketched = Sketched
  type implemented = Implemented
  type passed = Passed
  type 'level test = Test of 'level
  let sketch () = Test Sketched
  let implement x = Test Implemented
  let run x = Test Passed
end

module type FEATURE = sig
  type planned
  type test_implemented
  type solution_implemented
  type tested
  type 'state feature
  val plan : unit -> planned feature
  val implement_test : planned feature -> test_implemented feature
  val implement_solution : test_implemented feature -> solution_implemented feature
  val test : solution_implemented feature -> tested feature
end

module Feature : FEATURE = struct
  type planned = Planned
  type test_implemented = AutoTest.implemented AutoTest.test
  type solution_implemented = SolutionImplemented
  type tested = AutoTest.passed AutoTest.test
  type 'level feature = Feature of 'level
  let plan () = Feature Planned
  let implement_test x = Feature (AutoTest.implement (AutoTest.sketch ()))
  let implement_solution x = Feature SolutionImplemented
  let test x = Feature (AutoTest.run (AutoTest.implement (AutoTest.sketch ())))
end

let planned = Feature.plan ()
let test_implemented = Feature.implement_test planned
let solution_implemented = Feature.implement_solution test_implemented
let tested = Feature.test solution_implemented
