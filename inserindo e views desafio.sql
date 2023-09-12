use desafio1;

select * from pessoafisica; 

-- inserindo pessoafisica
insert into pessoafisica (CPF,RG,fname,lname,sexo,rua,bairro,cidade,numero_end,telefone)
values (4121915875,456322152,'Wendell','Rodrigues','Masculino','Rua Altair Leite','Carolina','Bauru',719,14998509496);
insert into pessoafisica (CPF,RG,fname,lname,sexo,rua,bairro,cidade,numero_end,telefone)
values (4159875556,333587842,'Carolina','Antunes','Feminino','Rua Treze de Maio','Jardim Lais','São Paulo',7219,11998758969);
insert into pessoafisica (CPF,RG,fname,lname,sexo,rua,bairro,cidade,numero_end,telefone)
values	   (8896475624,555789942,'Marcele','Juarez',default ,'Rua da Graça','Vila Palmas','São Paulo',7889,11998778969);
insert into pessoafisica (CPF,RG,fname,lname,sexo,rua,bairro,cidade,numero_end,telefone)
values       (8975472556,991234542,'Guilherme','Brighes','Masculino','Oscar Freire','Jardins','São Paulo',419,11995552969);
insert into pessoafisica (CPF,RG,fname,lname,sexo,rua,bairro,cidade,numero_end,telefone)
values (1237895996,775100242,'Henrique','Cartiê',default,'Rua Bahamas','Alphavile','Rio de Janeiro',027,21998457878);

-- inserindo pessoajuridica

insert into pessoajuridica (CNPJ,nomefantasia,razao_social)
values(12345678910123,'UNLTD','Comercio Varejo');
      
      delete from cadastrocliente where pjuridica_id = 1;
      
      
      -- inserindo cadastrocliente
      
      
select * from pessoafisica; 
select * from pessoajuridica; 
select * from cadastrocliente; 


insert into cadastrocliente (identificação,pfisica_id)
values ('Física',1);
insert into cadastrocliente (identificação,pfisica_id)
values ('Física',2),
	   ('Física',3),
       ('Física',4),
       ('Física',5);
       
insert into cadastrocliente (identificação,pjuridica_id)
values ('Jurídica',1);



-- inserindo produto

insert into produto(nome,categoria,tamanho,valor,descrição)
values ('Dunk Travis','Tênis','42','20000',null),
	   ('Air Jordan 1 Rebelionare','Tênis','41','2500',null),
       ('Camiseta Stussy Logo NY','Vestuário','GG','650',null),
       ('Dunk Travis','Tênis','41','20000',null),
       ('Dunk Travis','Tênis','40','19000',null),
       ('Camiseta Supreme Box Logo','Vestuário','G','750',null),
       ('Camiseta ASSC Roses','Vestuário','G','500',null),
       ('Camiseta ASSC Roses','Vestuário','GG','500',null),
       ('Air Max 97 CR7','Tênis','35','1900',null),
       ('Zippo Supreme','Acessório',null,'500','Isqueiro');
insert into produto(nome,categoria,tamanho,valor,descrição)
values ('Camiseta Nike x Stussy','Vestuário','M','600','Guilherme');
insert into produto(nome,categoria,tamanho,valor,descrição)
values ('Camiseta Nike x Stussy','Vestuário','G','600','Wendell');
insert into produto(nome,categoria,tamanho,valor,descrição)
values ('Air Jordan 1 UNC','Tênis','46','1600','Guilherme Ramos');

       
       select * from produto;
       
 -- inserindo fornecedor
 
 insert into fornecedor(nomesocial,CNPJ,contato)
 values ('LK Sneaker',12131415167895,'11998509397');
 
 -- inserindo estoque fornecedor
 
 insert into estoque(localização,quantidade)
 values ('São Paulo', 4);
 select * from estoque;
 
 -- inserindo consignado
 
 insert into consignado(nome,CPF,telefone)
 values ('Guilherme',40120365001,14997514698),
	    ('Wendell',41211915875,14998509496),
        ('Guilherme Ramos',33748198715,11987885030);
        
        
-- inserindo estoque produto

insert into estoquedoproduto(estoquep_id,produtoe_id,quantidade)
values (1,11,1);

select * from estoquedoproduto;
select * from produto;
select * from produtosconsignados;


-- inserindo produtosconsignados

insert into produtosconsignados(consignadoprod_id,produtocons_id,quantidade)
values (1,11,1),
	   (2,12,1),
       (3,13,1);
       
-- inserindo pedidos

select * from cadastrocliente;
select * from pedidos;

insert into pedidos(status_pedido,Descricao,frete,valortotal,clienteped_id)
values ('Confirmado','Air Max 97 CR7',25,1925,1);
insert into pedidos(status_pedido,Descricao,frete,valortotal,clienteped_id)
values ('Cancelado','Air Max 97 CR7',25,1925,9);
       ('Confirmado','Dunk Travis - 40',15,19015,3),
       ('Confirmado','Camiseta Stussy Logo NY',25,675,4),
       (default,'Camiseta ASSC Roses',0,500,5),
       ('Cancelado','Dunk Travis 42',101,20101,6);
       
       delete from pedidos where pedido_id = 2;
       
       
-- inserindo entrega

select * from pedidos;
select * from entrega;


insert into entrega(entregapedido_id,status_entrega,código)
values (1,'Em transporte','TR345678912BR'),
       (3,default,'TR889755629BR'),
       (4,'Entregue','TR112266547BR'),
       (5,'Separado',null);
       
-- inserindo pagamento

select * from pedidos;
select * from cadastrocliente;
select * from pagamento;
select * from pessoafisica;

insert into pagamento(pedidopag_id,clientpag_id,valor,datapagamemto,metodopagamento)
values (3,3,19015,'2023-08-10','Cartão de Crédito'),
       (4,4,675,'2023-08-25','Cartão de Crédito'),
       (5,5,500,'2023-09-01','Boleto');
       
 -- inserindo pix
 
 insert into pix(pagamentopix_id,valor,status_pix)
 values (1,1925,'Pago');
 
 -- inserindo cartaocredito
 
 insert into cartaocredito(ccpagamento_id,Nome,numero,data_vencimento,cvc,cpf,valor)
 values (2,'Marcele',1111222233334444,2030,012,8896475624,19015);
 insert into cartaocredito(ccpagamento_id,Nome,numero,data_vencimento,cvc,cpf,valor)
 values (3,'Guilherme',2222111144443333,1528,912,8975472556,675);
 
 -- inserindo boleto
 
 insert into boleto(boletopag_id,Nome,CPF,valor)
 values (4,'Henrique',1237895996,500);
 
 
 -- tudo inserindo CRIAR QUERYS
 


select * from pedidos;

-- Quantos pedidos foram feitos por cada cliente / total pedidos por cliente fisico
select pf.fname as NOME, count(clienteped_id) as TOTAL_PEDIDOS from pessoafisica pf
				inner join cadastrocliente c ON c.pfisica_id = pf.pfisica_id
                inner join pedidos p on p.clienteped_id = c.cliente_id
		group by clienteped_id; 
        
-- Quantos pedidos foram feitos por cada cliente/ total pedidos por cliente juridico
                select pj.nomefantasia as NOME,count(clienteped_id) as TOTAL_PEDIDOS from pessoajuridica pj
				inner join cadastrocliente c ON c.pjuridica_id = pj.pjuridica_id
                inner join pedidos p on p.clienteped_id = c.cliente_id
		group by clienteped_id; 
        
  -- Relação de nomes dos fornecedores e nomes dos produtos / vendedor que fornece produtos
  
  select pd.produto_id,cs.consignado_id, pd.nome as NOME_PRODUTO, cs.CPF,cs.nome from produto pd
  inner join produtosconsignados ps on pd.produto_id = ps.produtocons_id
  inner join consignado cs on ps.consignadoprod_id = cs.consignado_id; 
  
  -- fornecedor/consignado e seu produto
  select cs.nome as CONSIGNADO, pd.nome as PRODUTO from produto pd
  inner join produtosconsignados ps on pd.produto_id = ps.produtocons_id
  inner join consignado cs on ps.consignadoprod_id = cs.consignado_id;
  
  







