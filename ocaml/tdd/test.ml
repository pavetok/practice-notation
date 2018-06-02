#mod_use "alpha.ml"
#mod_use "stakeholder.ml"

module type TEST_ALPHA = sig
  include Alpha.ALPHA
end

module Test : TEST_ALPHA = struct
  include Alpha.Alpha
end

module type TEST_VIEW = sig
  include Alpha.VIEW with module Alpha = Test
end

module type DEVELOPER_VIEW = sig
  include TEST_VIEW with module Stakeholder = Stakeholder.Developer
  type sketched
  type implemented
  val sketch : unit -> sketched Alpha.state
  val implement : sketched Alpha.state -> implemented Alpha.state
end

module DeveloperView : DEVELOPER_VIEW = struct
  module Alpha = Test
  module Stakeholder = Stakeholder.Developer
  type sketched = Sketched
  type implemented = Implemented
  let sketch () = Alpha.mk Sketched
  let implement x = Alpha.mk Implemented
end

let sketched = DeveloperView.sketch ()
let implemented = DeveloperView.implement sketched
