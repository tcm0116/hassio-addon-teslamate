#!/usr/bin/env bashio

# Database things
export DATABASE_USER=$(bashio::config 'database_user')
export DATABASE_PASS=$(bashio::config 'database_pass')
export DATABASE_NAME=$(bashio::config 'database_name')
export DATABASE_HOST=$(bashio::config 'database_host')
export DATABASE_PORT=$(bashio::config 'database_port')

# MQTT things
export DISABLE_MQTT=$(bashio::config 'disable_mqtt')
export MQTT_HOST=$(bashio::config 'mqtt_host')
export MQTT_USERNAME=$(bashio::config 'mqtt_user')
export MQTT_PASSWORD=$(bashio::config 'mqtt_pass')
export MQTT_TLS=$(bashio::config 'mqtt_tls')
export MQTT_TLS_ACCEPT_INVALID_CERTS=$(bashio::config 'mqtt_tls_accept_invalid_certs')
export MQTT_NAMESPACE=export MQTT_TLS=$(bashio::config 'mqtt_namespace')

# Other things
export TZ=$(bashio::config 'timezone')
export PORT=$(bashio::config 'port')

# Import dashboards
if [ $(bashio::config 'grafana_import_dashboards') == 'true' ]; then
    /dashboards.sh restore
fi

exec $(/usr/bin/env sh) /entrypoint.sh "$@"