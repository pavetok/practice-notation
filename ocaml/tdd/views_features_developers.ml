module Alpha = Alphas.Features.Feature
module Stakeholder = Alphas.Stakeholders.Developers.Developer

module type DEVELOPER = sig
  include Views_features_core.VIEW with module Stakeholder = Stakeholder
  type designed
  type implemented
  val design : unit -> designed Alpha.state
  val implement : designed Alpha.state -> implemented Alpha.state
end

module Developer : DEVELOPER = struct
  module Alpha = Alpha
  module Stakeholder = Stakeholder
  type designed = Designed
  type implemented = Implemented
  let design () = Alpha.mk Designed
  let implement x = Alpha.mk Implemented
end
