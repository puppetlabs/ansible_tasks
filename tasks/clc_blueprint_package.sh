#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_server_ids+x}" ];
  then params="${params} server_ids=\"${PT_server_ids}\""
fi

if [ ! -z "${PT_package_id+x}" ];
  then params="${params} package_id=\"${PT_package_id}\""
fi

if [ ! -z "${PT_package_params+x}" ];
  then params="${params} package_params=\"${PT_package_params}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m clc_blueprint_package --args "${params}" --one-line | cut -f2- -d">"