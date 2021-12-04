#!/usr/bin/bash

# cleanup mdata-store
mdata-delete mail_smarthost || true
mdata-delete mail_auth_user || true
mdata-delete mail_auth_pass || true
mdata-delete mail_adminaddr || true
mdata-delete admin_authorized_keys || true
mdata-delete root_authorized_keys || true
mdata-delete mysql_host || true
mdata-delete mysql_user || true
mdata-delete mysql_database || true
mdata-delete mysql_password || true
