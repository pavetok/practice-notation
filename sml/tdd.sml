signature ALPHA = sig
  type 'a state
end

signature STAKEHOLDER = sig
  include ALPHA
end

structure Stakeholder : STAKEHOLDER = struct
type 'a state = 'a
end

signature VIEW = sig
  structure Alpha : ALPHA
  structure Stakeholder : STAKEHOLDER
end

signature TEST = sig
  include ALPHA
end

structure Test : TEST = struct
type 'a state = 'a
end

structure Developer : STAKEHOLDER = struct
open Stakeholder
end

signature DEVELOPER_TEST = sig
  include VIEW
  type sketched
  type implemented
  val sketch : unit -> sketched Alpha.state
  val implement : sketched Alpha.state -> implemented Alpha.state
end

structure DeveloperTest : DEVELOPER_TEST = struct
structure Alpha = Test
structure Stakeholder = Developer
type sketched =
     { at : string }
type implemented =
     { sketch : sketched Alpha.state,
       at : string }
fun sketch () =
    { at = "now" }
fun implement sketch =
    { sketch = sketch,
      at = "now" }
end

val sketched = DeveloperTest.sketch ()
val implemented = DeveloperTest.implement sketched

signature SOLUTION = sig
  include ALPHA
end

structure Solution = struct
type 'a state = 'a
end

signature DEVELOPER_SOLUTION = sig
  include VIEW
  type implemented
  val implement : unit -> implemented Alpha.state
end

structure DeveloperSolution : DEVELOPER_SOLUTION = struct
structure Alpha = Solution
structure Stakeholder = Developer
type implemented =
     { at : string }
fun implement () =
    { at = "now" }
end

signature FEATURE = sig
  include ALPHA
end

structure Feature : FEATURE = struct
type 'a state = 'a
end

structure Manager : STAKEHOLDER = struct
open Stakeholder
end

signature MANAGER_FEATURE = sig
  include VIEW
  type planned
  val plan : unit -> planned Alpha.state
end

structure ManagerFeature : MANAGER_FEATURE = struct
structure Alpha = Feature
structure Stakeholder = Manager
type planned =
     { at : string }
fun plan () =
    { at = "now" }
end

signature DEVELOPER_FEATURE = sig
  include VIEW
  type designed
  type implemented
  type tested
  val design : unit -> designed Alpha.state
  val implement : designed Alpha.state -> implemented Alpha.state
  val test : implemented Alpha.state -> tested Alpha.state
end

structure DeveloperFeature : DEVELOPER_FEATURE = struct
structure Alpha = Feature
structure Stakeholder = Developer
type designed = {}
type implemented = {}
type tested = {}
fun design () = {}
fun implement x = {}
fun test x = {}
end

signature TESTER_FEATURE = sig
  include VIEW
  type described
  type tested
end

signature TECHNICAL_WRITER_FEATURE = sig
  include VIEW
  type described
  type documented
end

structure Integrator : STAKEHOLDER = struct
open Stakeholder
end

signature INTEGRATOR_FEATURE = sig
  include VIEW
  type planned
  type deployed
  type in_use
  val plan : unit -> planned Alpha.state
  val deploy : planned Alpha.state -> deployed Alpha.state
end

structure IntegratorFeature : INTEGRATOR_FEATURE = struct
structure Alpha = Feature
structure Stakeholder = Integrator
type planned =
     { at : string }
type deployed =
     { at : string }
type in_use = {}
fun plan () =
    { at = "now" }
fun deploy x =
    { at = "now" }
end

signature SUPPORTER_FEATURE = sig
  include VIEW
  type working_well
  type broken
end

structure Engineer : STAKEHOLDER = struct
open Stakeholder
end

signature ENGINEER_FEATURE = sig
  include VIEW
  structure DeveloperFeature : DEVELOPER_FEATURE
  structure IntegratorFeature : INTEGRATOR_FEATURE
end

structure EngineerFeature : ENGINEER_FEATURE = struct
structure Alpha = Feature
structure Stakeholder = Engineer
structure DeveloperFeature = DeveloperFeature
structure IntegratorFeature = IntegratorFeature
end

val planned = IntegratorFeature.plan ()
val deployed = IntegratorFeature.deploy planned
