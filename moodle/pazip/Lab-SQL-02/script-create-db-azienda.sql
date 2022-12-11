drop table if exists Impiegato cascade;
drop table if exists Dipartimento cascade;
drop table if exists Progetto cascade;
drop table if exists PP cascade;

create table Impiegato(
  Matricola varchar(20) primary key,
  Nome varchar(50) not null,
  Cognome varchar(50) not null,
  Dipartimento varchar(50),
  Stipendio decimal(10,2) CONSTRAINT stipendio_positivo 
    check (stipendio>=0) );

create table Dipartimento(
  Codice varchar(50) primary key,
  Nome varchar(50) not null,
  Direttore varchar(20) CONSTRAINT Direttore_fk
    references Impiegato on delete set null on update cascade);

alter table Impiegato add constraint dipartimento_fk 
  foreign key (Dipartimento) references Dipartimento (Codice) 
  on delete set null on update cascade;
	
create table Progetto(
  Codice varchar(50) primary key,
  Nome varchar(50) not null,
  Budget decimal(10,2),
  Responsabile varchar(20) references Impiegato 
  on delete set null on update cascade);
  
create table PP(
  Impiegato varchar(50),
  Progetto varchar(50) references Progetto,
    primary key (impiegato, progetto),
    foreign key (impiegato) references Impiegato
	on delete set null on update cascade);
	
insert into Dipartimento values('D001', 'Amministrazione', null);
insert into Dipartimento values('D002', 'Commerciale', null);
insert into Dipartimento values('D003', 'Direzione', null);
insert into Dipartimento values('D004', 'Ricerca', null);
insert into Dipartimento values('D005', 'Sviluppo', null);

insert into Impiegato values('AA998CC', 'Carlo', 'Cancelli', 'D001', 88000);
insert into Impiegato values('AA999BK', 'Giuliano', 'Casini', 'D002', 10500);
insert into Impiegato values('AA999BB', 'Francesco', 'Casini', 'D002', 104500);
insert into Impiegato values('AB999RT', 'Simone', 'Fochini', 'D001', 22000);
insert into Impiegato values('AD645GG', 'Serse', 'Moschini', 'D001', 66000);
insert into Impiegato values('AD999RT', 'Alfredo', 'Alfredi', 'D002', 71500);
insert into Impiegato values('AF145GG', 'Emilio', 'Sottani', 'D002', 71500);
insert into Impiegato values('AF444ED', 'Gino', 'Rampollo', 'D001', 79000);
insert into Impiegato values('AF445ED', 'Gino', 'Rampollo', 'D003', 89000);
insert into Impiegato values('AF676GR', 'Giuliano', 'Magri', 'D001', 93500);
insert into Impiegato values('AF978BF', 'Davide', 'Turli', null, 16500);
insert into Impiegato values('AG642GZ', 'Paolino', 'Galletto', 'D001', null);
insert into Impiegato values('AG978BF', 'Giulio', 'Magri', 'D003', 44000);
insert into Impiegato values('AH756RF', 'Carla', 'Bruni', 'D004', 77000);
insert into Impiegato values('AS764TK', 'Angela', 'Gogoli', 'D001', 38500);
insert into Impiegato values('BF132FR', 'Augusto', 'Meda', 'D002', 41800);
insert into Impiegato values('BH756RF', 'Luca', 'Frondi', 'D005', 60500);
insert into Impiegato values('RF132FR', 'Laura', 'Casini', 'D004', 99000);
insert into Impiegato values('RF133FR', 'Laura', 'Casini', 'D005', 100000);

update Dipartimento set direttore = 'AA998CC' where codice= 'D001'; 
update Dipartimento set direttore = 'AD999RT' where codice= 'D002'; 
update Dipartimento set direttore = 'AF978BF' where codice= 'D003'; 
update Dipartimento set direttore = 'AH756RF' where codice= 'D004'; 
update Dipartimento set direttore = 'RF133FR' where codice= 'D005';

insert into Progetto values('P001', 'Reti in fibra', 300000.00, 'AA998CC');
insert into Progetto values('P002', 'Reti wireless', 350000.00, 'AF445ED');
insert into Progetto values('P003', 'Ultimo miglio', 250000.00, 'RF132FR');
insert into Progetto values('P004', 'Reti salettitari', 250000.00, 'AF445ED');

insert into PP values('AA998CC', 'P001');
insert into PP values('AA999BB', 'P002');
insert into PP values('AB999RT', 'P001');
insert into PP values('AD645GG', 'P001');
insert into PP values('AD999RT', 'P002');
insert into PP values('AF145GG', 'P002');
insert into PP values('AF444ED', 'P001');
insert into PP values('AF445ED', 'P003');
insert into PP values('AF676GR', 'P001');
insert into PP values('AF978BF', 'P003');
insert into PP values('AG642GZ', 'P001');
insert into PP values('AG978BF', 'P003');
insert into PP values('AH756RF', 'P004');
insert into PP values('AS764TK', 'P001');
insert into PP values('BF132FR', 'P002');
insert into PP values('BH756RF', 'P002');
insert into PP values('RF132FR', 'P004');
insert into PP values('RF133FR', 'P002');
insert into PP values('RF133FR', 'P003');