#use "alpha.ml"
#use "developer.ml"

module type TEST_ALPHA = sig
  include ALPHA
end

module Test : TEST_ALPHA = struct
  include DefaultAlpha
end

module type TEST_VIEW = sig
  include VIEW with module Alpha = Test
end

module type DEVELOPER_VIEW = sig
  include TEST_VIEW with module Stakeholder = Developer
  type sketched
  type implemented
  val sketch : unit -> sketched Alpha.state
  val implement : sketched Alpha.state -> implemented Alpha.state
end

module DeveloperView : DEVELOPER_VIEW = struct
  module Alpha = Test
  module Stakeholder = Developer
  type sketched = Sketched
  type implemented = Implemented
  let sketch () = Alpha.mk Sketched
  let implement x = Alpha.mk Implemented
end

let sketched = DeveloperView.sketch ()
let implemented = DeveloperView.implement sketched
