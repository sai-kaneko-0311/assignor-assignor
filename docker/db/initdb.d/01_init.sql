use assignor_assignor;
create table if not exists users (
    id int unsigned auto_increment,
    name varchar(255) not null,
    registered_at timestamp default current_timestamp,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    primary key (`id`),
    unique key (`name`)
);