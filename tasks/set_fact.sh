#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_key_value+x}" ];
  then params="${params} key_value=\"${PT_key_value}\""
fi

ansible localhost -m set_fact --args "${params}" --one-line | cut -f2- -d">"