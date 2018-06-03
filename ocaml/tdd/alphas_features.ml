module type FEATURE = sig
  include Alphas_core.ALPHA
end

module Feature : FEATURE = struct
  include Alphas_core.Alpha
end
