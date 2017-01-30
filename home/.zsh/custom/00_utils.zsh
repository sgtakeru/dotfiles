# is_exists returns true if executable $1 exists in $PATH
is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

# has is wrapper function
has() {
    is_exists "$@"
}
