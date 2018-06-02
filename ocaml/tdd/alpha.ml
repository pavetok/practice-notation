module type ALPHA = sig
  type 'a state
  val mk : 'a -> 'a state
end

module DefaultAlpha : ALPHA = struct
  type 'a state = 'a
  let mk a = a
end

module type STAKEHOLDER = sig
  include ALPHA
end

module type VIEW = sig
  module Alpha : ALPHA
  module Stakeholder : STAKEHOLDER
end
