module type ASPECT = sig
  include Aspects_core.ASPECT with module Alpha = Alphas.Features.Feature
end
