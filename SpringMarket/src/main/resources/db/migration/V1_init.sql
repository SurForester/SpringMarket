/*
 Security section
 */
CREATE TABLE IF NOT EXISTS public.users
(
    id bigserial primary key,
    username varchar(128) NOT NULL,
    password varchar(512) NOT NULL,
    first_name varchar(64),
    last_name varchar(64),
    email varchar(128)
);

ALTER TABLE IF EXISTS public.users OWNER to postgres;

insert into users(username, password)
values
    ('admin', '$2a$12$6219QjD/6gngnRKhv1knlO.9YkaUEHpQbsvP.vXQdRlnHFTWQj8iW'), /* admin */
    ('manager', '$2a$12$vz5.NGEH91o1KIKDw/ZiBunDqByi1VjYaa.gFV79.ePxnyQ9PWmLa') /* 123 */
;

CREATE TABLE IF NOT EXISTS public.roles
(
    id serial primary key,
    name varchar(80) NOT NULL
);

ALTER TABLE IF EXISTS public.roles OWNER to postgres;

insert into roles(name)
values
    ('ROLE_ADMIN'), ('ROLE_MANAGER'),('ROLE_USER');

CREATE TABLE IF NOT EXISTS public.users_roles
(
    user_id bigint NOT NULL,
    role_id int NOT NULL,
    CONSTRAINT order_users_id_foreign_key FOREIGN KEY (user_id)
        REFERENCES public.users (id),
    CONSTRAINT order_roles_id_foreign_key FOREIGN KEY (role_id)
        REFERENCES public.roles (id)
);

ALTER TABLE IF EXISTS public.users_roles OWNER to postgres;

insert into users_roles(user_id, role_id)
values
    (1, 1), (1, 2), (1, 3),
    (2, 2), (2, 3);

/*
 Products section
 */

