{-# LANGUAGE Strict #-}

module Lib
  ( picalc,
  )
where

-- (defun transfer-momentum (m1 m2 v1 v2)
--  (let ((v1out (+ (* v1 (/ (- m1 m2) (+ m1 m2)))
--                  (* v2 (/ (* 2 m2) (+ m1 m2)))))
--        (v2out (+ (* v1 (/ (* 2 m1) (+ m1 m2)))
--                  (* v2 (/ (- m2 m1) (+ m1 m2))))))
--    (list v1out v2out)))

momentum :: Double -> Double -> Double -> Double -> (Double, Double)
momentum m1 m2 v1 v2 =
  let v1out = ((m1 - m2) / (m1 + m2)) * v1 + ((m2 * 2) / (m1 + m2)) * v2
      v2out = ((m1 * 2) / (m1 + m2)) * v1 + ((m2 - m1) / (m1 + m2)) * v2
   in (v1out, v2out)

-- (defun simulate (m1 m2)
--  (iterate
--    (with v1 = 0)
--    (with v2 = -1000)
--    (with i = 0)
--    (until (and (>= v1 0)
--                (<= v1 v2)))
--    (for (a b) = (if (< v1 0)
--                     (list (- v1) v2)
--                     (transfer-momentum m1 m2 v1 v2)))
--    (setq v1 a
--          v2 b)
--    (incf i)
--    (finally (return i))))

simulate :: Double -> Double -> Int
simulate m1 m2 = rec 0 0 (-1000)
  where
    rec :: Int -> Double -> Double -> Int
    rec i v1 v2 | v1 >= 0 && v1 <= v2 = i
    rec i v1 v2 | v1 < 0 = rec (i + 1) (-v1) v2
    rec i v1 v2 =
      let (a, b) = momentum m1 m2 v1 v2
       in rec (i + 1) a b

picalc :: Int -> Double
picalc pos =
  let p = fromIntegral $ simulate 1 (1 * 100 ^ pos)
      d = 10 ^ pos
   in p / d
