#use "alpha.ml"

module type DEVELOPER = sig
  include STAKEHOLDER
end

module Developer : DEVELOPER = struct
  include DefaultAlpha
end

