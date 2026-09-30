#!/bin/bash

PASS=$(secretspec get ANSIBLE_VAULT_PASSWORD)

if [ -z "$PASS" ]; then
    # Print the error message to STDERR so the operator can see it
    echo >&2
    
    # Exit with a non-zero code. This tells Ansible to IMMEDIATELY ABORT.
    exit 1
fi

# 3. If everything is fine, print ONLY the password string to stdout
echo "$PASS"