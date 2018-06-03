module Alpha = Alphas.Tests.Test
module Stakeholder = Alphas.Stakeholders.Developers.Developer

module type DEVELOPER = sig
  include Views_tests_core.VIEW with module Stakeholder = Stakeholder
  type sketched
  type implemented
  val sketch : unit -> sketched Alpha.state
  val implement : sketched Alpha.state -> implemented Alpha.state
end

module Developer : DEVELOPER = struct
  module Alpha = Alpha
  module Stakeholder = Stakeholder
  type sketched = Sketched
  type implemented = Implemented
  let sketch () = Alpha.mk Sketched
  let implement x = Alpha.mk Implemented
end
