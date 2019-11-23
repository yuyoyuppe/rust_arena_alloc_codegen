/* see 
https://bugs.llvm.org/show_bug.cgi?id=42794
https://bugs.llvm.org/show_bug.cgi?id=40011#c1
https://github.com/rust-lang/rust/issues/56333

// similar cpp implementation and ir output
https://gcc.godbolt.org/z/BhZ6tF

cargo build --release
cargo asm rust_arena_alloc_codegen::main --rust
cargo llvm-ir rust_arena_alloc_codegen::main --rust
*/

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
fn optimized() {
    let arena = Arena::new();
    let v = arena.alloc(Big::default());
    println!("do not optimize {}", v.storage[123]);
}

#[inline(always)]
fn not_optimized(arena: &typed_arena::Arena<Big>) -> &mut Big {
    let v = arena.alloc(Big::default());
    v
}

fn main() {

    // not_optimized.asm
    // let arena = Arena::new();
    // println!("do not optimize {}", not_optimized(&arena).storage[123]);

    // optimized.asm
    optimized()
}
