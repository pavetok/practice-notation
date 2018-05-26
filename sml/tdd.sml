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

signature FEATURE_ALPHA = sig
  type 'state feature
  val new : 'state -> 'state feature
end

structure Feature : FEATURE_ALPHA = struct
type 'level feature = 'level
fun new level = level
end

signature MANAGER_VIEW = sig
  structure F : FEATURE_ALPHA
  type planned
  val plan : unit -> planned F.feature
end

structure ManagerFeature : MANAGER_VIEW = struct
structure F = Feature
type planned =
     { at : string }
fun plan () =
    F.new { at = "now" }
end

signature DEVELOPER_VIEW = sig
  structure F : FEATURE_ALPHA
  type designed
  type implemented
  type tested
  val design : unit -> designed F.feature
  val implement : designed F.feature -> implemented F.feature
  val test : implemented F.feature -> tested F.feature
end

structure DeveloperFeature : DEVELOPER_VIEW = struct
structure F = Feature
type designed = {}
type implemented = {}
type tested = {}
fun design () = F.new {}
fun implement x = F.new {}
fun test x = F.new {}
end

signature IMPLEMENTER_VIEW = sig
  structure F : FEATURE_ALPHA
  type planned
  type deployed
  type in_use
  val plan : unit -> planned F.feature
  val deploy : planned F.feature -> deployed F.feature
end

structure ImplementerFeature : IMPLEMENTER_VIEW = struct
structure F = Feature
type planned =
     { at : string }
type deployed =
     { at : string }
type in_use = {}
fun plan () =
    F.new { at = "now" }
fun deploy x =
    F.new { at = "now" }
end

signature SUPPORTER_VIEW = sig
  structure F : FEATURE_ALPHA
  type working_well
  type broken
end

signature ENGINEER_VIEW = sig
  structure DeveloperFeature : DEVELOPER_VIEW
  structure ImplementerFeature : IMPLEMENTER_VIEW
end

structure EngineerFeature : ENGINEER_VIEW = struct
structure DeveloperFeature = DeveloperFeature
structure ImplementerFeature = ImplementerFeature
end

val planned = ImplementerFeature.plan ()
val deployed = ImplementerFeature.deploy planned
