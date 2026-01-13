module final::secret_counter;

public struct Counter has key {
    id: UID,
    value: u64,
}

public struct Admin has key {
    id: UID,
}

public fun create(ctx: &mut TxContext) {
    let counter = Counter {
        id: object::new(ctx),
        value: 0,
    };
    let admin = Admin {
        id: object::new(ctx),
    };

    transfer::share_object(counter);
    transfer::transfer(admin, tx_context::sender(ctx));
}

public fun increment(_cap: &Admin, counter: &mut Counter) {
    counter.value = counter.value + 1;
}

public fun value(counter: &Counter): u64 {
    counter.value
}
