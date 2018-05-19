#use "test.ml"

module type FEATURE = sig
  type 'state feature
  type planned
  type designed
  type implemented
  type tested
  type deployed
  type in_use
  type deprecated
  type retired
  val plan : unit -> planned feature
  val design : planned feature -> designed feature
  val implement : designed feature -> implemented feature
  val test : implemented feature -> tested feature
end

module Feature : FEATURE = struct
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
