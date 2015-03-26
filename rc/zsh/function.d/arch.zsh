get_arch() {
    local arch=`uname`
    if [ $(uname|sed 's/\(.*\)_.*/\1/') = 'CYGWIN' ]; then
        result='cygwin'
    elif [ "${arch}" = 'Linux' ]; then
        result='linux'
    elif [ "${arch}" = 'Darwin' ]; then
        result='darwin'
    elif [ "${arch}" = 'FreeBSD' ]; then
        result=-'freebsd'
    fi
}
