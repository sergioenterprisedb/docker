drop table users;
create table users (userid int, username varchar(10), password varchar(100));
insert into users values (1, 'sergio','Thisismypassword01#');
select * from users;

-- Flush dirty pages
checkpoint;

select pg_relation_filepath('users');
