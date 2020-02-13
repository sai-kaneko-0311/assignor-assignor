use assignor_assignor;
create table if not exists users (
    id int unsigned auto_increment,
    name varchar(255) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    primary key (`id`),
    unique key (`name`)
);

create table if not exists categories (
    id int unsigned auto_increment,
    name varchar(255) not null,
    registered_by int unsigned not null,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp,
    primary key (`id`),
    unique key (`name`),
    index idx_registered_by (`registered_by`),
    foreign key registered_by_fk (`registered_by`) references users (`id`)
);

create table if not exists tasks (
    id int unsigned auto_increment,
    category_id int unsigned not null,
    name varchar(255) not null,
    status int not null comment "0:not yet, 1:wip, 2:review, 3:done",
    registered_by int unsigned not null,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp,
    primary key (`id`),
    index idx_category_id (`category_id`),
    foreign key category_id_fk (`category_id`) references categories (`id`),
    index idx_registered_by (`registered_by`),
    foreign key registered_by_fk (`registered_by`) references users (`id`)
);

create table if not exists assigns (
    id int unsigned auto_increment,
    task_id int unsigned not null,
    user_id int unsigned not null,
    status int not null comment "0:not yet, 1:wip, 2:review, 3:done",
    registered_by int unsigned not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    primary key (`id`),
    unique key (`task_id`, `user_id`),
    index idx_task_id (`task_id`),
    foreign key task_fk (`task_id`) references tasks (`id`),
    index idx_user_id (`user_id`),
    foreign key user_id_fk (`user_id`) references users (`id`),
    index idx_registered_by (`registered_by`),
    foreign key registered_by_fk (`registered_by`) references users (`id`)
);