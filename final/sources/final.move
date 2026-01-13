module final::secret_counter;

public struct Counter has key {
    id: UID,
    value: u64,
}

public fun create(ctx: &mut TxContext) {
    let counter_public = Counter {
        id: object::new(ctx),
        value: 0,
    };
    let counter_private = Counter {
        id: object::new(ctx),
        value: 0,
    };

    transfer::share_object(counter_public);
    transfer::transfer(counter_private, tx_context::sender(ctx));
}

public fun increment(counter: &mut Counter) {
    counter.value = counter.value + 1;
}

public fun value(counter: &Counter): u64 {
    counter.value
}
