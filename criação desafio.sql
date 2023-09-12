create database desafio1;
use desafio1;

-- criando table pessoa física
create table pessoafisica (
	pfisica_id int auto_increment primary key,
    CPF char (11) not null,
    RG char(9) not null,
    fname varchar (15),
    lname varchar (15),
    sexo enum ('Masculino', 'Feminino','Não Informado') default 'Não Informado',
    rua varchar (50),
    bairro varchar (20),
    cidade varchar (20),
    numero_end char (6),
    telefone char (11),
    constraint unique_cpf_pessoafisica unique (CPF)
    );
    alter table pessoafisica auto_increment = 1;
    
    
-- criando pessoa juridica

create table pessoajuridica (
	pjuridica_id int auto_increment primary key,
    CNPJ char (14) not null,
    nomefantasia varchar (15),
    razao_social varchar (20),
    constraint unique_cnpj_pessoajuridica unique (CNPJ)
    );
     alter table pessoajuridica auto_increment = 1;
    
    
-- criando cliente/cadastro
create table cadastrocliente (
	cliente_id int auto_increment primary key,
    identificação enum ('Jurídica', 'Física') not null,
    pjuridica_id int,
    pfisica_id int,
    constraint fk_cliente_fisica foreign key (pfisica_id) references pessoafisica (pfisica_id),
    constraint fk_cliente_juridica foreign key (pjuridica_id) references pessoajuridica (pjuridica_id)
        );
        alter table cadastrocliente auto_increment = 1;
        
 -- produto
 
 create table produto (
	produto_id int auto_increment primary key,
    nome varchar (50),
    categoria enum ('Vestuário','Tênis','Acessório') not null,
    tamanho varchar (5),
    valor float (6),
    descrição varchar (80)
    );
    alter table produto auto_increment = 1;
    
    
    
  -- fornecedor
  
create table fornecedor (
	fornecedor_id int auto_increment primary key,
	nomesocial varchar(255) not null,
	CNPJ char(15) not null,
	contato varchar(11) not null,
	constraint unique_supplier unique (CNPJ)
    );
    alter table fornecedor auto_increment = 1;
    
  -- estoque
  
create table estoque(
	estoque_id int auto_increment primary key,
	localização varchar(45) not null,
	quantidade int default 0
);
alter table estoque auto_increment = 1;

-- consignado ( Destinado a vendedores autonomos que deixam o produto até ser vendido)
create table consignado(
	consignado_id int auto_increment primary key,
	nome varchar(255) not null,
	CPF char(11),
	telefone char(11) not null,
	constraint unique_cpf_seller unique (CPF)
);
alter table consignado auto_increment = 1;

-- produto e estoque ligação 

create table estoquedoproduto(
	estoquep_id int,
	produtoe_id int,
	quantidade int not null,
	primary key (estoquep_id, produtoe_id),
	constraint fk_estoqueproduto_produto foreign key (produtoe_id) references produto (produto_id),
	constraint fk_estoqueproduto_estoque foreign key (estoquep_id) references estoque (estoque_id)
);

-- ligação consignado com produto

create table produtosconsignados(
	consignadoprod_id int,
    produtocons_id int,
    quantidade int not null,
    constraint fk_consignadoproduto_consignado foreign key (consignadoprod_id) references consignado (consignado_id),
	constraint fk_consignadoproduto_produto foreign key (produtocons_id) references produto (produto_id)
    );
    
    -- criação pedido
    
    create table pedidos(
    pedido_id int auto_increment primary key,
    status_pedido enum ('Confirmado','Cancelado','Processando') default 'Processando',
    Descricao varchar(80),
    frete float,
    valortotal float not null,
    clienteped_id int,
    constraint fk_pedido_client foreign key (clienteped_id) references cadastrocliente (cliente_id)
    );
    alter table pedidos auto_increment = 1;
    
    -- criação entrega
    create table entrega(
    entrega_id int auto_increment primary key,
    entregapedido_id int,
    status_entrega enum ('Em transporte','Separado','Entregue','Não Enviado') default 'Não enviado',
    código varchar (13),
	constraint fk_entrega_pedido foreign key (entregapedido_id) references pedidos (pedido_id)
    );
    alter table entrega auto_increment = 1;
    
    -- criação pagamento
    
    create table pagamento(
    pagamento_id int auto_increment primary key,
    pedidopag_id int,
    clientpag_id int,
    valor float not null,
    datapagamemto date not null,
    metodopagamento enum ('Pix', 'Cartão de Crédito','Boleto') not null,
    constraint fk_pagamento_pedido foreign key (pedidopag_id) references pedidos (pedido_id),
    constraint fk_pagamento_cliente foreign key (clientpag_id) references cadastrocliente (cliente_id)
    );
     alter table pagamento auto_increment = 1;
    
    -- criação pix
    
    create table pix (
    pix_id int auto_increment primary key,
    pagamentopix_id int,
    valor float not null,
    status_pix enum ('Pago','Não Pago') default 'Não Pago',
	constraint fk_pix_pagamento foreign key (pagamentopix_id) references pagamento (pagamento_id)
    );
    alter table pix auto_increment = 1;
    
    show tables;
    
    -- criação CC
    
    create table cartaocredito(
    cartaocredito_id int auto_increment primary key,
    ccpagamento_id int,
    Nome varchar (20) not null,
    numero char (16) not null unique,
    data_vencimento char (4) not null,
    cvc char (3) not null unique,
    cpf char (11) not null unique,
    valor float,
    status enum ('Aprovado', 'Rejeitado','Processando') default 'Processando',
	constraint fk_cartaocredito_pagamento foreign key (ccpagamento_id) references pagamento (pagamento_id)
    );
    alter table cartaocredito auto_increment = 1;
    drop table cartaocredito;
    
    update cartaocredito set numero = char(16);
    select * from cartaocredito;

-- criação boleto

create table boleto(
boleto_id int auto_increment primary key,
boletopag_id int,
Nome varchar (45) not null,
CPF char (11) not null,
valor float,
constraint fk_boleto_pagamento foreign key (boletopag_id) references pagamento (pagamento_id)
);
alter table boleto auto_increment = 1;
    
    
show tables;
    
    -- terminar