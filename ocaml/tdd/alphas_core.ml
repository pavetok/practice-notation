module type ALPHA = sig
  type 'a state
  val mk : 'a -> 'a state
end

module Alpha : ALPHA = struct
  type 'a state = 'a
  let mk a = a
end
