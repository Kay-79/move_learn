module week_1::profile;

use std::string::{Self, String};

public struct UserProfile has key, store {
    id: UID,
    name: String,
    bio: String,
}

entry fun create_profile(name_bytes: vector<u8>, bio_bytes: vector<u8>, ctx: &mut TxContext) {
    let profile = UserProfile {
        id: object::new(ctx),
        name: string::utf8(name_bytes),
        bio: string::utf8(bio_bytes),
    };

    transfer::public_transfer(profile, ctx.sender());
}

entry fun update_bio(profile: &mut UserProfile, new_bio_bytes: vector<u8>) {
    profile.bio = string::utf8(new_bio_bytes);
}
