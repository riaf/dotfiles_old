get_color_index() {
    # There are 7 colors and black then use them cyclic.
    result=$(($1 % 7 + 1))
}

get_prompt_color_indexes() {
    get_hash_id "whoami"; get_color_index $result
    local user=$result
    get_hash_id "hostname"; get_color_index $result
    local host=$result
    get_color_index $(($SHLVL + 2))
    local shlvl=$result
    result=($user $host $shlvl)
}

