get_hash_id() {
    result=$($1|sum|awk '{print $1}')
}
