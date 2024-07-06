create database caminhão;
use caminhão;

create table fornecedor (
	cd_fornecedor int not null,
    nm_fornecedor varchar (30),
    cd_cnpj varchar(14),
    constraint pk_fornecedor 
    primary key(cd_fornecedor));
    
create table funcionario (
	cd_funcionario int not null ,
    nm_funcionario varchar (30),
    primary key (cd_funcionario)
);

create table cliente(
	cd_cliente int not null,
    nm_cliente varchar(30),
    ds_cliente varchar(40),
		cd_funcionario int not null,
		constraint pk_cliente primary key(cd_cliente),
        constraint fk_funcionario_cliente foreign key(cd_funcionario) references funcionario(cd_funcionario));
        
create table carga (
	cd_carga int not null,
    sg_carga varchar(45),
    ds_carga varchar(45),
		dt_carga_entrada DATE,
			dt_carga_saida DATE,
				cd_funcionario int not null,
					cd_cliente int not null,
						cd_fornecedor int not null,
							constraint pk_carga primary key(cd_carga),
								constraint fk_funcionario_carga foreign key(cd_funcionario) references funcionario(cd_funcionario),
									constraint fk_cliente_carga foreign key(cd_cliente) references cliente(cd_cliente),
										constraint fk_fornecedor_carga foreign key(cd_fornecedor) references cliente(cd_cliente));
                                        
create table container(
	cd_container int not null,
    ds_container varchar(30),
    nm_container varchar(20),
    cd_fornecedor int ,
    qt_container int, 
		cd_carga int not null,
			constraint pk_container primary key(cd_container),
				constraint fk_container_carga foreign key(cd_carga) references carga (cd_carga),
					constraint fk_container_fornecedor foreign key(cd_fornecedor) references fornecedor(cd_fornecedor));
                    
create table caminhao (
	cd_caminhao int not null ,
    ds_caminhao varchar (50),
    cd_fornecedor int not null,
    cd_carga int not null,
    constraint pk_caminhao primary key(cd_caminhao),
			constraint fk_fornecedor_caminhao foreign key (cd_fornecedor) references fornecedor(cd_fornecedor),
				constraint fk_carga_caminhao foreign key(cd_carga) references carga(cd_carga));
                

-- tabela de normalização segunda regra
create table funcionario_caminhao(
	cd_funcionario int,
    cd_caminhao int,
    constraint pk_funcionario foreign key(cd_funcionario) references funcionario(cd_funcionario),
    constraint pk_caminhao foreign key (cd_caminhao) references caminhao(cd_caminhao));


-- posteriormente criar uma tabela periculosidade que vai servir como uma tabela categoria,ela vai definir os varios niveis de periculosidade das cargas,haverá uma chave estrangeira ou na tabela caminhao ou carga


-- Inserção de dados na tabela fornecedor

INSERT INTO fornecedor (cd_fornecedor,nm_fornecedor, cd_cnpj) VALUES
(1,'Luzia e Sérgio Corretores Ltda', '98616490000150'),
(2,'Natália Marcenaria Ltda', '96962997000130'),
(3,'Raul e Laura Transportes ME', '13950708000155'),
(4,'Raimundo Corretores Ltda', '91284928294291'),
(5,'Paulo e Luan Vidros Ltda', '42764198420112'),
(6,'Aparecida Corretores', '92823990238098'),
(7,'Thiago e Lara Entregas Ltda', '12837897300129'),
(8,'Marcelo e Nelson Entregas Ltda', '09284098309802'),
(9,'Daniel e Luna Transportes ME', '92903748738737'),
(10,'Cláudio e Caio Ferragens Ltda', '74843939229023');

-- Inserção de dados na tabela funcionário
INSERT INTO funcionario (cd_funcionario,nm_funcionario) VALUES
(1,'Enzo Hugo Rodrigo Freitas'),
(2,'Lucca Nathan Almada'),
(3,'Jorge Caleb Silveira'),
(4,'Tomás Carlos da Mota'),
(5,'João Henrique da Cruz'),
(6,'Diego Yago Peixoto'),
(7,'Luiz Filipe Edson Almeida'),
(8,'Murilo Enzo Geraldo Assunção'),
(9,'Osvaldo Iago Kevin Nogueira'),
(10,'Sebastião Hugo da Conceição');

-- Inserção de dados na tabela cliente
INSERT INTO cliente (cd_cliente, nm_cliente, ds_cliente, cd_funcionario) VALUES
(1,'Diego Anthony Nunes', 'Descrição Cliente 1', 1),
(2,'Marcos Luiz da Mota', 'Descrição Cliente 2', 2),
(3,'Samuel Lorenzo Francisco', 'Descrição Cliente 3', 3),
(4,'Thomas Leonardo Fernandes', 'Descrição Cliente 4', 4),
(5,'Carlos Eduardo Rodrigo Antonio', 'Descrição Cliente 5', 5),
(6,'Rodrigo Geraldo Nogueira', 'Descrição Cliente 6', 6),
(7,'Thales Ricardo Nathan Viana', 'Descrição Cliente 7', 7),
(8,'Miguel Victor Corte Real', 'Descrição Cliente 8', 8),
(9,'Leandro Thiago Barbosa', 'Descrição Cliente 9', 9),
(10,'Victor Ruan da Silva', 'Descrição Cliente 10', 10);

-- Inserção de dados na tabela carga
INSERT INTO carga (cd_carga, sg_carga, ds_carga, dt_carga_entrada, dt_carga_saida, cd_funcionario, cd_cliente, cd_fornecedor) VALUES
(1,'Carga A', 'Carga Viva', '2024-03-12', '2024-03-15', 1, 1, 1),
(2,'Carga B', 'Carga seca', '2024-03-13', '2024-03-16', 2, 2, 2),
(3,'Carga C', 'Carga perigosa', '2024-03-14', '2024-03-17', 3, 3, 3),
(4,'Carga D', 'Carga indivisível e excepcional', '2024-03-15', '2024-03-18', 4, 4, 4),
(5,'Carga E', 'Cargas frigoríficas', '2024-03-16', '2024-03-19', 5, 5, 5),
(6,'Carga F', 'Carga perigosa', '2024-03-17', '2024-03-20', 6, 6, 6),
(7,'Carga G', 'Cargas especiais', '2024-03-18', '2024-03-21', 7, 7, 7),
(8,'Carga H', 'Cargas frágeis', '2024-03-19', '2024-03-22', 8, 8, 8),
(9,'Carga I', 'Carga farmacêutica', '2024-03-20', '2024-03-23', 9, 9, 9),
(10,'Carga J', 'Transporte de veículos', '2024-03-21', '2024-03-24', 10, 10, 10);

-- Inserção de dados na tabela container
INSERT INTO container (cd_container,ds_container, nm_container, cd_fornecedor, qt_container, cd_carga) VALUES
(1,'Container A', 'Container1', 1, 10, 1),
(2,'Container B', 'Container2', 2, 15, 2),
(3,'Container C', 'Container3', 3, 20, 3),
(4,'Container D', 'Container4', 4, 25, 4),
(5,'Container E', 'Container5', 5, 30, 5),
(6,'Container F', 'Container6', 6, 35, 6),
(7,'Container G', 'Container7', 7, 40, 7),
(8,'Container H', 'Container8', 8, 45, 8),
(9,'Container I', 'Container9', 9, 50, 9),
(10,'Container J', 'Container10', 10, 55, 10);


-- Inserção de dados na tabela caminhão
INSERT INTO caminhao (cd_caminhao,ds_caminhao, cd_fornecedor, cd_carga) VALUES
(1,'Caminhão 1', 1, 1),
(2,'Caminhão 2', 2, 2),
(3,'Caminhão 3', 3, 3),
(4,'Caminhão 4', 4, 4),
(5,'Caminhão 5', 5, 5),
(6,'Caminhão 6', 6, 6),
(7,'Caminhão 7', 7, 7),
(8,'Caminhão 8', 8, 8),
(9,'Caminhão 9', 9, 9),
(10,'Caminhão 10', 10, 10);

-- Selecionar todos os fornecedores
SELECT * FROM fornecedor;

-- Selecionar todos os funcionários
SELECT * FROM funcionario;

-- Selecionar todos os clientes
SELECT * FROM cliente;

-- Selecionar todas as cargas
SELECT * FROM carga;


-- Selecionar todos os fornecedores ordenados por nome
SELECT * FROM fornecedor ORDER BY nm_fornecedor;

-- Selecionar todos os funcionários ordenados por nome
SELECT * FROM funcionario ORDER BY nm_funcionario;

-- Selecionar todos os clientes ordenados por nome
SELECT * FROM cliente ORDER BY nm_cliente;

-- Selecionar todas as cargas ordenadas por data de entrada
SELECT * FROM carga ORDER BY dt_carga_entrada;

-- Contar quantas cargas cada fornecedor tem
SELECT cd_fornecedor, COUNT(*) as qtd_cargas FROM carga GROUP BY cd_fornecedor;

-- Calcular a média de containers por carga
SELECT cd_carga, AVG(qt_container) as media_containers FROM container GROUP BY cd_carga;

-- Contar quantos clientes cada funcionário atende
SELECT cd_funcionario, COUNT(*) as qtd_clientes FROM cliente GROUP BY cd_funcionario;

-- Contar quantas cargas cada fornecedor tem e ordenar pelo número de cargas
SELECT cd_fornecedor, COUNT(*) as qtd_cargas FROM carga GROUP BY cd_fornecedor ORDER BY qtd_cargas DESC;

-- Calcular a média de containers por carga e ordenar pelo número médio de containers
SELECT cd_carga, AVG(qt_container) as media_containers FROM container GROUP BY cd_carga ORDER BY media_containers DESC;

-- Contar quantos clientes cada funcionário atende e ordenar pelo número de clientes
SELECT cd_funcionario, COUNT(*) as qtd_clientes FROM cliente GROUP BY cd_funcionario ORDER BY qtd_clientes DESC;

-- Selecionar todas as cargas com detalhes de fornecedor
SELECT c.*, f.nm_fornecedor
FROM carga c
JOIN fornecedor f ON c.cd_fornecedor = f.cd_fornecedor;

-- Selecionar todos os containers com detalhes de carga e fornecedor
SELECT co.*, ca.sg_carga, f.nm_fornecedor
FROM container co
JOIN carga ca ON co.cd_carga = ca.cd_carga
JOIN fornecedor f ON co.cd_fornecedor = f.cd_fornecedor;

-- Selecionar todas as cargas com detalhes de cliente e funcionário
SELECT c.*, cl.nm_cliente, fu.nm_funcionario
FROM carga c
JOIN cliente cl ON c.cd_cliente = cl.cd_cliente
JOIN funcionario fu ON c.cd_funcionario = fu.cd_funcionario;






