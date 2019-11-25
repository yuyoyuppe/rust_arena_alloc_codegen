/* see 
https://bugs.llvm.org/show_bug.cgi?id=42794
https://bugs.llvm.org/show_bug.cgi?id=40011#c1
https://github.com/rust-lang/rust/issues/56333
https://github.com/rust-lang/rust/issues/32966

// similar cpp implementation and ir output
https://gcc.godbolt.org/z/D4qm_N

cargo build --release
cargo asm rust_arena_alloc_codegen::main --rust
cargo llvm-ir rust_arena_alloc_codegen::main --rust

cargo rustc --release -- --emit=llvm-ir
 
*/

#![no_std]
#![allow(dead_code)]

use typed_arena::Arena;

struct Big {
    storage: [u8; 2048]
}

impl Default for Big {
    fn default() -> Self {
        Big { storage: [0; 2048] }
    }
}

#[inline(always)]
fn optimized() -> u8 {
    let arena = Arena::new();
    let v = arena.alloc(Big::default());
    v.storage[123]
}

#[inline(always)]
fn not_optimized(arena: &typed_arena::Arena<Big>) -> &mut Big {
    let v = arena.alloc(Big::default());
    v
}

#[derive(Debug)]
struct MyError { }

fn main() -> Result<(), MyError> {

    // not_optimized.asm
    let arena = Arena::new();
    let v = not_optimized(&arena).storage[123];

    // optimized.asm
    // let v = optimized();

    // poor man's optimization prevention
    match v {
        6 => Err(MyError{}),
        _ => Ok(())
    }
}
