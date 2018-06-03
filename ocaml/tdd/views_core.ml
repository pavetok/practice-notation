module type VIEW = sig
  module Alpha : Alphas.ALPHA
  module Stakeholder : Alphas.Stakeholders.STAKEHOLDER
end
