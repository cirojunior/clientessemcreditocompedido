--No sistema mercanet fazendo a consulta dos clientes com pedido e sem limite de crédito para avaliação do financeiro.

select distinct DB_PED_CLIENTE, DB_CLI_NOME
from DB_PEDIDO, DB_PEDIDO_COMPL, DB_CLIENTE
where DB_PEDIDO.DB_PED_NRO = DB_PEDIDO_COMPL.DB_PEDC_NRO
and DB_PEDIDO.DB_PED_CLIENTE = db_cliente.DB_CLI_CODIGO
and DB_PEDC_RASCUNHO = '0'
and DB_PED_SITUACAO in ('0','1')
and DB_PED_COND_PGTO <> '1'
and DB_PED_DT_EMISSAO >= '01/03/2021'
and DB_PED_DT_EMISSAO <= '02/03/2021'
and DB_PED_CLIENTE in (select DB_CLI_CODIGO 
                        from DB_CLIENTE 
                        where DB_CLI_LIM_CREDAP <= '1')
