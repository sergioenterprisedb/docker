docker run -d \
	--name pge \
	-e POSTGRES_PASSWORD=mysecretpassword \
	-e PGDATA=/var/lib/edb/pge-17/data \
	-v pgdata:/var/lib/edb/pge-17/data \
	-p 5432:5432 \
	pge:17.2 sleep infinity 

docker exec -it pge bash -c "pg_ctl start -D /var/lib/edb/pge-17/data" 
