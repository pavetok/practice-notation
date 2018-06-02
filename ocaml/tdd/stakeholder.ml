#mod_use "alpha.ml"

module type DEVELOPER = sig
  include Alpha.STAKEHOLDER
end

module Developer : DEVELOPER = struct
  include Alpha.Alpha
end

