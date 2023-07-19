use std::env::args;

fn main() {
    let pos = args().skip(1).next().unwrap_or("1".to_string());
    let pos: i64 = pos.parse().expect("invalid number");
    println!("{}", pi(pos));
}


// momentum m1 m2 v1 v2 = let v1out = ((m1 - m2) / (m1 + m2)) * v1 + ((m2 * 2) / (m1 + m2)) * v2
// v2out = ((m1 * 2) / (m1 + m2)) * v1 + ((m2 - m1) / (m1 + m2)) * v2
// in (v1out, v2out)

fn momentum(m1: f64, m2: f64, v1: f64, v2: f64) -> (f64, f64) {
    let v1out = ((m1 - m2) / (m1 + m2)) * v1 + ((m2 * 2f64) / (m1 + m2)) * v2;
    let v2out = ((m1 * 2f64) / (m1 + m2)) * v1 + ((m2 - m1) / (m1 + m2)) * v2;
    (v1out, v2out)
}

// simulate :: Double -> Double -> Int
// simulate m1 m2 = rec 0 0 (-1000)
// where
// rec :: Int -> Double -> Double -> Int
// rec i v1 v2 | v1 >= 0 && v1 <= v2 = i
// rec i v1 v2 | v1 < 0 = rec (i + 1) (-v1) v2
// rec i v1 v2 = let (a, b) = momentum m1 m2 v1 v2
// in rec (i + 1) a b

fn simulate(m1: f64, m2: f64) -> i64 {
    let mut v1 = 0f64;
    let mut v2 = -1000f64;
    let mut i = 0i64;

    while v1 < 0f64 || v1 > v2 {
        i += 1;
        if v1 < 0f64 {
            v1 = -v1;
            continue;
        }

        (v1, v2) = momentum(m1, m2, v1, v2);
    }

    return i;
}

// picalc :: Int -> Double
// picalc pos = let p = fromIntegral $ simulate 1 (1 * 100 ^ pos)
// d = 10 ^ pos
// in p / d

fn pi(pos: i64) -> f64 {
    let p = simulate(1f64, 1f64 * 100f64.powf(pos as f64));
    let d = 10i64.pow(pos as u32);
    (p as f64 / d as f64)
}
