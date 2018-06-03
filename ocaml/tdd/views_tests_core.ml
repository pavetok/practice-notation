module type VIEW = sig
  include Views_core.VIEW with module Alpha = Alphas.Tests.Test
end
