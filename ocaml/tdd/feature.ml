#use "test.ml"

module type META_VIEW = sig
  type 'state feature
end

module type ARCHITECT_VIEW = sig
  type usable
  type deprecated
  type retired
end

module type MANAGER_VIEW = sig
  type planned
  type shipped
  val plan : unit -> planned feature
end

module type DEVELOPER_VIEW = sig
  type designed
  type implemented
  type tested
  val design : planned feature -> designed feature
  val implement : designed feature -> implemented feature
  val test : implemented feature -> tested feature
end

module type IMPLEMENTER_VIEW = sig
  type deployed
  type in_use
end

module type SUPPORTER_VIEW = sig
  type working
  type broken
end

module type ENGINEER_VIEW = sig
  include META_VIEW
  include MANAGER_VIEW
  include DEVELOPER_VIEW
  include IMPLEMENTER_VIEW
  include SUPPORTER_VIEW
end

(*
module Feature : ENGINEER_VIEW = struct
  type 'level feature = 'level
  type planned =
    { plannedAt : string }
  type designed =
    { designedAt : string }
  type implemented =
    { implementedAt : string }
  type tested =
    { testedAt : string }
  type deployed =
    { deployedAt : string }
  type in_use =
    { inUseSince : string }
  type deprecated =
    { deprecatedAt : string }
  type retired =
    { retiredAt : string }
  let plan () =
    { plannedAt = "now" }
  let design x =
    { designedAt = "now" }
  let implement x =
    { implementedAt = "now" }
  let test x =
    { testedAt = "now" }
end

let planned = Feature.plan ()
let designed = Feature.design planned
let implemented = Feature.implement designed
let tested = Feature.test implemented
*)
