module type DEVELOPER = sig
  include Alphas_stakeholders_core.STAKEHOLDER
end

module Developer : DEVELOPER = struct
  include Alphas_core.Alpha
end
