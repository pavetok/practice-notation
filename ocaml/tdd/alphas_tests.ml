module type TEST = sig
  include Alphas_core.ALPHA
end

module Test : TEST = struct
  include Alphas_core.Alpha
end
