module type ASPECT = sig
  module Alpha : Alphas.ALPHA
  module Stakeholder : Alphas.Stakeholders.STAKEHOLDER
end
