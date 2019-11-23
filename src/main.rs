#![allow(dead_code)]
use std::mem::{MaybeUninit};
use typed_arena::Arena;

struct OneMB {
    storage: [u8; 1048576]
}

impl Default for OneMB {
    fn default() -> Self {
        OneMB { storage: [0; 1048576] }
    }
}

#[derive(Default)]
struct HalfKB {
    a0 : u128,
    a1 : u128,
    a2 : u128,
    a3 : u128,
    a4 : u128,
    a5 : u128,
    a6 : u128,
    a7 : u128,
    a8 : u128,
    a9 : u128,
    a10 : u128,
    a11 : u128,
    a12 : u128,
    a13 : u128,
    a14 : u128,
    a15 : u128,
    a16 : u128,
    a17 : u128,
    a18 : u128,
    a19 : u128,
    a20 : u128,
    a21 : u128,
    a22 : u128,
    a23 : u128,
    a24 : u128,
    a25 : u128,
    a26 : u128,
    a27 : u128,
    a28 : u128,
    a29 : u128,
    a30 : u128,
    a31 : u128,
}

fn mb_test() {
    let arena = Arena::new();
    unsafe {
        let v = arena.alloc(OneMB{storage : MaybeUninit::uninit().assume_init()}); // ok
        println!("{}", v.storage[123])
    }
}

fn hkb_test() {
    let arena = Arena::new();
    unsafe {
        let v = arena.alloc(HalfKB::default()); // ok
        println!("{}", v.a1)
    }
}

/* see 
https://bugs.llvm.org/show_bug.cgi?id=42794
https://bugs.llvm.org/show_bug.cgi?id=40011#c1
https://github.com/rust-lang/rust/issues/56333

cargo build --release
cargo asm arena_memcpy::main --rust
cargo llvm-ir arena_memcpy::main --rust
*/


fn main() {
    mb_test();
    hkb_test();
}
