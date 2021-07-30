script {
    use 0x1::DiemAccount;
    use 0x1::PONT::PONT;
    use 0x1::Signer;
    use 5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty::Store;

    fun transfer_from(bob: signer, alice: signer, to_move: u64) {
        let alise_withdraw_cap = DiemAccount::extract_withdraw_capability(&bob);
        DiemAccount::pay_from<PONT>(&alise_withdraw_cap, Signer::address_of(&alice), to_move, x"", x"");
        DiemAccount::restore_withdraw_capability(alise_withdraw_cap);

        let balance = DiemAccount::balance<PONT>(Signer::address_of(&bob));
        Store::store_u64(&bob, balance);
    }
}

script {
    use 0x1::DiemAccount;
    use 0x1::PONT::PONT;
    use 0x1::Signer;
    use 5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty::Store;

    fun transfer_to(alice: signer, bob: signer, to_move: u64) {
        let alice_withdraw_cap = DiemAccount::extract_withdraw_capability(&alice);
        DiemAccount::pay_from<PONT>(&alice_withdraw_cap, Signer::address_of(&bob), to_move, x"", x"");
        DiemAccount::restore_withdraw_capability(alice_withdraw_cap);

        Store::store_u64(&bob, DiemAccount::balance<PONT>(Signer::address_of(&bob)));
    }
}