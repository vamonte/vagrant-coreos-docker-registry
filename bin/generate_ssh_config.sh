#!/bin/bash

cat > ansible.cfg << EOF
[ssh_connection]
ssh_args = -o ControlMaster=auto -o ControlPersist=60s -F ssh.config
EOF

cat > ssh.config << EOF
    Host *
    User core
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no
    PasswordAuthentication no
    IdentityFile $HOME/.vagrant.d/insecure_private_key
    IdentitiesOnly yes
    LogLevel FATAL
EOF