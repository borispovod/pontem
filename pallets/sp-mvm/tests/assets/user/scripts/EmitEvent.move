script {
    use 5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty::EventProxy;

    fun emit_event(acc: signer, val: u64) {
        EventProxy::emit_event(&acc, val);
    }
}
