module week_2::counter;

public struct Counter has key {
    id: UID,
    value: u64,
}

public struct AdminCap has key {
    id: UID,
}

public fun create(ctx: &mut TxContext) {
    let counter = Counter {
        id: object::new(ctx),
        value: 0,
    };
    transfer::share_object(counter);
    let admin_cap = AdminCap {
        id: object::new(ctx),
    };
    transfer::transfer(admin_cap, tx_context::sender(ctx));
}

public fun increment(counter: &mut Counter) {
    counter.value = counter.value + 1;
}

public fun decrement(counter: &mut Counter) {
    assert!(counter.value > 0, 1);
    counter.value = counter.value - 1;
}

public fun reset(_cap: &AdminCap, counter: &mut Counter) {
    counter.value = 0;
}
