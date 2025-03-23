-- Creating spring security schema users and authorities tables
create table users(username varchar(50) not null primary key,password varchar(500) not null,enabled boolean not null);
create table authorities (username varchar(50) not null,authority varchar(50) not null,constraint fk_authorities_users foreign key(username) references users(username));
create unique index ix_auth_username on authorities (username,authority);

insert into users (username, password,enabled)
values ('admin','{bcrypt}$2a$12$7IAGXv4jZ2l5/TheV5b7iOxH/4BMnJBcNqZk8NqtzKEDVyIOEUfX6','1');

insert into authorities (username, authority)
values('admin','admin');

create table customer(
                         id serial primary key,
                         email varchar(45) not null,
                         password varchar(200) not null,
                         role varchar(45) not null
);

INSERT INTO public.customer
(email, "password", "role")
VALUES('user@test.com', '{noop}12345', 'read');

INSERT INTO public.customer
(email, "password", "role")
VALUES('admin@test.com', '{bcrypt}$2a$12$7IAGXv4jZ2l5/TheV5b7iOxH/4BMnJBcNqZk8NqtzKEDVyIOEUfX6', 'admin');

SELECT * FROM customer;