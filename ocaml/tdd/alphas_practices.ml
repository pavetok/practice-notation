module type PRACTICE = sig
  include Alphas_core.ALPHA
end

module Practice : PRACTICE = struct
  include Alphas_core.Alpha
end
