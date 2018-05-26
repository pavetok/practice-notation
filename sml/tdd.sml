signature TEST = sig
  type 'state test
end

structure Test : TEST = struct
type 'level test = 'level
end

signature DEVELOPER_TEST = sig
  structure T : TEST
  type sketched
  type implemented
  val sketch : unit -> sketched T.test
  val implement : sketched T.test -> implemented T.test
end

structure DeveloperTest : DEVELOPER_TEST = struct
structure T = Test
type sketched =
     { at : string }
type implemented =
     { sketch : sketched T.test,
       at : string }
fun sketch () =
    { at = "now" }
fun implement sketch =
    { sketch = sketch,
      at = "now" }
end

signature SOLUTION = sig
  type 'state solution
end

structure Soluton = struct
type 'level solution = 'level
end

signature DEVELOPER_SOLUTION = sig
  structure S : SOLUTION
  type implemented
  val implement : unit -> implemented S.solution
end

structure DeveloperSolution : DEVELOPER_SOLUTION = struct
structure S = Solution
type implemented =
     { at : string }
fun implement () =
    { at = "now" }
end

signature FEATURE = sig
  type 'state feature
end

structure Feature : FEATURE = struct
type 'level feature = 'level
end

signature MANAGER_FEATURE = sig
  structure F : FEATURE
  type planned
  val plan : unit -> planned F.feature
end

structure ManagerFeature : MANAGER_FEATURE = struct
structure F = Feature
type planned =
     { at : string }
fun plan () =
    { at = "now" }
end

signature DEVELOPER_FEATURE = sig
  structure F : FEATURE
  type designed
  type implemented
  type tested
  val design : unit -> designed F.feature
  val implement : designed F.feature -> implemented F.feature
  val test : implemented F.feature -> tested F.feature
end

structure DeveloperFeature : DEVELOPER_FEATURE = struct
structure F = Feature
type designed = {}
type implemented = {}
type tested = {}
fun design () = {}
fun implement x = {}
fun test x = {}
end

signature IMPLEMENTER_FEATURE = sig
  structure F : FEATURE
  type planned
  type deployed
  type in_use
  val plan : unit -> planned F.feature
  val deploy : planned F.feature -> deployed F.feature
end

structure ImplementerFeature : IMPLEMENTER_FEATURE = struct
structure F = Feature
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
  structure F : FEATURE
  type working_well
  type broken
end

signature ENGINEER_FEATURE = sig
  structure DeveloperFeature : DEVELOPER_FEATURE
  structure ImplementerFeature : IMPLEMENTER_FEATURE
end

structure EngineerFeature : ENGINEER_FEATURE = struct
structure DeveloperFeature = DeveloperFeature
structure ImplementerFeature = ImplementerFeature
end

val planned = ImplementerFeature.plan ()
val deployed = ImplementerFeature.deploy planned
