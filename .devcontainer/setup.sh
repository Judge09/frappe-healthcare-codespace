#!/bin/bash

echo "Setting up Frappe Healthcare..."

cd /workspace

bench init healthcare-bench --frappe-branch version-15 --skip-redis-config-generation
cd healthcare-bench

bench new-site site1.local --admin-password admin --mariadb-root-password 123

bench get-app erpnext --branch version-15
bench --site site1.local install-app erpnext

bench get-app healthcare https://github.com/frappe/healthcare
bench --site site1.local install-app healthcare

bench use site1.local
