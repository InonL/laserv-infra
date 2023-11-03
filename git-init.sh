#!/bin/bash
# sets up a pre-commit hook to ensure that vault.yaml is encrypted
#
# credit goes to nick busey from homelabos for this neat little trick
# https://gitlab.com/NickBusey/HomelabOS/-/issues/355

if [ -d .git/ ]; then
rm .git/hooks/pre-commit
cat <<'EOT' >> .git/hooks/pre-commit
for FILE in vars/*; do
    if ( git show :${FILE} | grep -q "\$ANSIBLE_VAULT;" ); then
        echo "${FILE} is Encrypted. Safe to commit."
    else
        echo "${FILE} is not encrypted! Run 'ansible-vault encrypt ${FILE}' and try again."
        exit_status=1
        break
    fi
done
exit ${exit_status}
EOT

fi

chmod +x .git/hooks/pre-commit