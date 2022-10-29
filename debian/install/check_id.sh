
check_id() {
	ID=$1
	FILENAME=$2

	[ $(grep "$ID" "$FILENAME" | wc -l) -gt 0 ]
}

