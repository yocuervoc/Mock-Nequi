insert into accounts (disponible,mattress, total) values (0,0,0);
insert into accounts (disponible,mattress, total) values (0,0,0);
insert into accounts (disponible,mattress, total) values (0,0,0);
insert into accounts (disponible,mattress, total) values (0,0,0);
insert into accounts (disponible,mattress, total) values (0,0,0);
insert into accounts (disponible,mattress, total) values (0,0,0);
insert into accounts (disponible,mattress, total) values (0,0,0);
insert into accounts (disponible,mattress, total) values (0,0,0);
insert into accounts (disponible,mattress, total) values (0,0,0);
insert into accounts (disponible,mattress, total) values (0,0,0);
insert into accounts (disponible,mattress, total) values (0,0,0);
insert into accounts (disponible,mattress, total) values (0,0,0);

insert into users(mail, password, accounts_id ) values ('yocc@gmail.com', 'pasw0rd', 1);
insert into users(mail, password, accounts_id ) values ('jorge@gmail.com', 'pasw0rd', 2);
insert into users(mail, password, accounts_id ) values ('camilo@gmail.com', 'pasw0rd',3);
insert into users(mail, password, accounts_id ) values ('ivan@gmail.com', 'pasw0rd', 4);
insert into users(mail, password, accounts_id ) values ('orlando@gmail.com', 'pasw0rd', 5);
insert into users(mail, password, accounts_id ) values ('maria@gmail.com', 'pasw0rd', 6);
insert into users(mail, password, accounts_id ) values ('angelica@gmail.com', 'pasw0rd', 7);
insert into users(mail, password, accounts_id ) values ('natalia@gmail.com', 'pasw0rd', 8);

insert into pockets(pocketMoney, name, accounts_id ) values (0, 'Carro', 3);
insert into pockets(pocketMoney, name, accounts_id ) values (0, 'Casa', 3);

select total from accounts where id = 1;

select disponible from accounts where id = 1;

select name, pocketMoney from pockets where accounts_id = 1;
select name, date, savedMoney, totalAmount, from goals where accounts_id = 1;


sebastian peña 
