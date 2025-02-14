#!/bin/bash
docker cp tde.sql pge:/tmp/tde.sql
docker exec -it pge psql -U postgres -f /tmp/tde.sql
docker exec -it pge bash -c "hexdump -C /var/lib/edb/pge-17/data/base/5/16384"

