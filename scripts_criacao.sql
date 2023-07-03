create table Clientes
(
	ClienteID int not null,
	firstname varchar(20),
	middlename varchar(20),
	lastname varchar(20),

)

alter table Clientes
add primary key (ClienteID);


create table Vendas
(
	VendaID int not null,
	ClienteID int not null,
	CarrosID int not null,
	FuncionariosID int not null,
	foreign key (ClienteID) references Clientes(ClienteID),
	foreign key (CarrosID) references Carros(CarrosID),
	foreign key (FuncionariosID) references Funcionarios(FuncionariosID),
	primary key (VendaID),
)

select * from clientes

use Cars_DBA
go

INSERT INTO clientes (ClienteID, firstname, middlename, lastname)
VALUES 
    (1, 'João', 'Carlos', 'Silva'),
    (2, 'Maria', 'Eduarda', 'Santos'),
    (3, 'Pedro', 'Henrique', 'Almeida'),
    (4, 'Ana', 'Carolina', 'Oliveira'),
    (5, 'Luís', 'Felipe', 'Costa'),
    (6, 'Sofia', 'Cristina', 'Pereira'),
    (7, 'Carlos', 'Eduardo', 'Rodrigues'),
    (8, 'Beatriz', 'Fernanda', 'Martins'),
    (9, 'Miguel', 'Ângelo', 'Ferreira'),
    (10, 'Laura', 'Beatriz', 'Carvalho');


delete from Clientes 
where clienteid between 1 and 10;

select * from vendas
select * from carros
select * from Funcionarios

insert into Vendas
values (1, 1, 2, 3)

insert into Vendas
values (2, 2, 1, 1)

insert into Vendas
values (3, 3, 3, 5)

insert into Vendas
values (4, 4, 4, 6)

insert into Vendas
values (5, 6, 5, 4)

insert into Vendas 
values (6, 5, 6, 2)

insert into Vendas
values (7, 7, 7, 4)

insert into Vendas
values (8, 8, 4, 5)

insert into Vendas
values (9, 9, 3, 1)

insert into Vendas
values (10, 10, 5, 6)

insert into Vendas
values (11, 5, 5, 6)

select * from Funcionarios

insert into Funcionarios
values (7, 'Ronaldo', 'Nazario', 'dos Santos', 1);

insert into Funcionarios
values (8, 'Evandro', 'Evangelista', 'Batista', 2);

insert into Funcionarios
values (9, 'Jorge', 'Paulo', 'Leman', 3);

select * from vendas

insert into vendas
values 
(15, 1, 1, 2),
(16, 9, 7, 8), 
(17, 4, 3, 6);	


insert into vendas
values 
(12, 8, 8, 7),
(13, 2, 1, 8), 
(14, 3, 7, 9);





 ## relatório de vendas por automóvel
select carros.modelo, carros.versao, carros.valor, vendas.vendaid
from carros
left join vendas
on vendas.carrosid = carros.carrosid
order by valor

select * from vendas
select * from Funcionarios


select carros.modelo, carros.versao, carros.valor, vendas.vendaid
from carros
left join vendas
on vendas.carrosid = carros.carrosid
order by valor


select funcionarios.firstname, funcionarios.lastname, funcionarios.funcionariosid, vendas.vendaid
from funcionarios
left join vendas
on vendas.funcionariosid = funcionarios.funcionariosid
order by vendaid


--- alterei a forma como lidava com os nomes em CLIENTES E FUNCIONARIOS usando o seguitne prototipo:

update clientes
set nome = 'Joao Carlos'
where ClienteID = 1

-- dropei as colunas desnecessárias com o seguinte prototipo:
alter table clientes
drop column firstname, middlename, lastname

-- alterei a forma como lidava com VENDAS - Associei à tabela também uma coluna de lojas associadas.
-- e coloquei os dados
alter table vendas
add LojaAssociadaID int;

update vendas
set LojaAssociadaID = 3
where FuncionariosID = 4 or FuncionariosID = 6 or FuncionariosID = 9


select funcionarios.nome, funcionarios.funcionariosid, vendas.vendaid
from funcionarios
left join vendas
on vendas.funcionariosid = funcionarios.funcionariosid
order by vendaid

			-- relatório de venda POR Cidade (Cada loja numa cidade)
			select vendas.VendaID, vendas.CarrosID, carros.Modelo, carros.valor, vendas.FuncionariosID
			from vendas
			join carros
			on vendas.CarrosID = carros.CarrosID
			where vendas.LojaAssociadaID = 1


			-- relatório de vendas por vendedor x loja
			select Funcionarios.nome, Funcionarios.LojaVinculada, Vendas.VendaID
			from Funcionarios
			join Vendas
			on Vendas.FuncionariosID = Funcionarios.FuncionariosID
			where LojaVinculada = 1
			
			-- relatório de vendas por automóvel
			select carros.Modelo, vendas.VendaID
			from carros
			join Vendas
			on carros.CarrosID = vendas.CarrosID
			where carros.CarrosID = 1
			
			-- relatório de vendas POR VENDEDOR
			select vendas.VendaID, vendas.FuncionariosID, Funcionarios.nome, vendas.LojaAssociadaID
			from funcionarios
			join vendas
			on vendas.FuncionariosID = funcionarios.FuncionariosID
			where funcionarios.FuncionariosID = 9
			
			
			-- relatório de contas a pagar
			select * from ContasAPagar
			where LojaAssociadaID = 1 
			
	create table ContasAPagar
	(	
		ContaID int not null,
		LojaAssociadaID int not null,
		NomeConta varchar (20),
		primary key (ContaID),
		foreign key (LojaAssociadaID) references Loja(LojaID),
		Valor int not null
	)
	
Utilizei o seguinte prototipo ao criar a tabela contas a pagar:

create table ContasAPagar
(	
	ContaID int not null,
	LojaAssociadaID int not null,
	NomeConta varchar(20),
	valor int not null,
	primary key contaid,
)
insert into ContasAPagar
values (1, 1, 'Luz Elétrica', 800), (2, 1, 'Água', 400), (3, 2, 'Folha de Pagamentos', 8000)

update ContasAPagar
set LojaAssociadaID = 1
where NomeConta = 'Folha de Pagamentos'


insert into ContasAPagar
values (4, 2, 'Luz Elétrica', 750), (5, 2, 'Água', 550), (6, 2, 'Folha de Pagamentos', 7000)

insert into ContasAPagar
values (7, 3, 'Luz Elétrica', 880), (8, 3, 'Água', 760), (9, 3, 'Folha de Pagamentos', 8700)


select sum(valor)
from contasapagar
where LojaAssociadaID = 3 and MesVencimento > '2023-07-01' and MesVencimento < '2023-07-31';


	-- fiz um update na tabela vendas para conseguir puxar um relatório de entradas e saidas mensal
	update vendas
	set ValorVenda = 160000
	where vendaid = 3

	update vendas
	set ValorVenda = 75000
	where vendaid = 4

	update vendas
	set ValorVenda = 90000
	where vendaid = 5

	update vendas
	set ValorVenda = 81000
	where vendaid = 6

	update vendas
	set ValorVenda = 50000
	where vendaid = 7

	update vendas
	set ValorVenda = 75000
	where vendaid = 8

	update vendas
	set ValorVenda = 160000
	where vendaid = 9

	update vendas
	set ValorVenda = 90000
	where vendaid = 10

	update vendas
	set ValorVenda = 90000
	where vendaid = 11

	update vendas
	set ValorVenda = 75000
	where vendaid = 12

	update vendas
	set ValorVenda = 80000
	where vendaid = 13

	update vendas
	set ValorVenda = 50000
	where vendaid = 14

	update vendas
	set ValorVenda = 80000
	where vendaid = 15

	update vendas
	set ValorVenda = 50000
	where vendaid = 16

	update vendas
	set ValorVenda = 160000
	where vendaid = 17
	


