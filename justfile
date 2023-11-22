log := "debug"

export JUST_LOG := log

run HOST *TAGS:
  ansible-playbook run.yaml -u root --limit {{HOST}} {{TAGS}}

# vault edit
vaultedit FILE:
    EDITOR='code --wait' ansible-vault edit includes/{{FILE}}

# vault decrypt
decrypt:
    ansible-vault decrypt includes/*

# vault encrypt
encrypt:
    ansible-vault encrypt includes/*
