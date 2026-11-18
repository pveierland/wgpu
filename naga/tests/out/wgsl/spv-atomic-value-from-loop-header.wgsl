var<private> global: vec3<u32>;
var<workgroup> global_1: atomic<u32>;

fn function_() {
    var phi_21_: u32;
    var phi_24_: u32;
    var local: u32;
    var local_1: u32;

    let _e6 = global[0u];
    phi_21_ = 0u;
    phi_24_ = 0u;
    loop {
        let _e8 = phi_21_;
        let _e10 = phi_24_;
        local = _e10;
        if (_e8 < 8u) {
            local_1 = (_e10 + (_e6 & 1u));
            continue;
        } else {
            break;
        }
        continuing {
            phi_21_ = (_e8 + 1u);
            let _e21 = local_1;
            phi_24_ = _e21;
        }
    }
    workgroupBarrier();
    let _e16 = local;
    let _e17 = atomicAdd((&global_1), _e16);
    return;
}

@compute @workgroup_size(64, 1, 1) 
fn main(@builtin(local_invocation_id) param: vec3<u32>) {
    global = param;
    function_();
}
