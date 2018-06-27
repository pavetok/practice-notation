module type WORK_PRODUCT = sig
  type 'a level
end

module Work_product : WORK_PRODUCT = struct
  type 'a level = 'a
end
