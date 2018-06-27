module type ASPECT = sig
  include Aspects_core.ASPECT with module Alpha = Alphas.Tests.Test
end
