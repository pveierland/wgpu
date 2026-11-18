struct type_4 {
    member: f32,
}

@group(0) @binding(0) 
var<storage, read_write> global: type_4;

fn function_() {
    let _e3 = modf(2.5f);
    let _e5 = frexp(2.5f);
    global.member = ((((_e3.fract + _e3.whole) + modf(vec2<f32>(2.5f, 2.5f)).whole.x) + _e5.fract) + f32((_e5.exp + frexp(vec2<f32>(2.5f, 2.5f)).exp.x)));
    return;
}

@compute @workgroup_size(1, 1, 1) 
fn main() {
    function_();
}
