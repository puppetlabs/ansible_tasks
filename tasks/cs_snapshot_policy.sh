#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_api_http_method+x}" ];
  then params="${params} api_http_method=\"${PT_api_http_method}\""
fi

if [ ! -z "${PT_schedule+x}" ];
  then params="${params} schedule=\"${PT_schedule}\""
fi

if [ ! -z "${PT_api_secret+x}" ];
  then params="${params} api_secret=\"${PT_api_secret}\""
fi

if [ ! -z "${PT_api_timeout+x}" ];
  then params="${params} api_timeout=\"${PT_api_timeout}\""
fi

if [ ! -z "${PT_vm+x}" ];
  then params="${params} vm=\"${PT_vm}\""
fi

if [ ! -z "${PT_time_zone+x}" ];
  then params="${params} time_zone=\"${PT_time_zone}\""
fi

if [ ! -z "${PT_volume+x}" ];
  then params="${params} volume=\"${PT_volume}\""
fi

if [ ! -z "${PT_vpc+x}" ];
  then params="${params} vpc=\"${PT_vpc}\""
fi

if [ ! -z "${PT_max_snaps+x}" ];
  then params="${params} max_snaps=\"${PT_max_snaps}\""
fi

if [ ! -z "${PT_device_id+x}" ];
  then params="${params} device_id=\"${PT_device_id}\""
fi

if [ ! -z "${PT_account+x}" ];
  then params="${params} account=\"${PT_account}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_interval_type+x}" ];
  then params="${params} interval_type=\"${PT_interval_type}\""
fi

if [ ! -z "${PT_api_region+x}" ];
  then params="${params} api_region=\"${PT_api_region}\""
fi

if [ ! -z "${PT_volume_type+x}" ];
  then params="${params} volume_type=\"${PT_volume_type}\""
fi

if [ ! -z "${PT_project+x}" ];
  then params="${params} project=\"${PT_project}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

ansible localhost -m cs_snapshot_policy --args "${params}" --one-line | cut -f2- -d">"