/*------------------------ RELATÓRIOS ------------------------*/
-- 2) Agora que já temos nossa estrutura, o cliente está solicitando um relatório contendo quantos clientes ativos ele possui por cidade, bem como o valor total contratado.

SELECT clientes.cidade, COUNT(DISTINCT clientes.id) AS totalclientes, SUM(contratos_servicos.valor_venda) AS valor_total 
FROM clientes 
  JOIN contratos ON contratos.id_cliente = clientes.id AND contratos.validade_data >= NOW() 
  JOIN contratos_servicos ON contratos_servicos.id_contrato = contratos.id 
WHERE clientes.cidade = 'Santa Maria';

-- 3) Nosso cliente também deseja saber quantos de seus clientes não possuem serviços de internet, e qual o valor total praticado por serviço.

SELECT servicos.natureza, COUNT(DISTINCT clientes.id) AS clientes_total, contratos_servicos.valor_venda AS valor_total 
FROM contratos
  JOIN contratos_servicos ON contratos_servicos.id_contrato = contratos.id
  JOIN servicos ON servicos.id = contratos_servicos.id_servico AND servicos.natureza != 'internet'
  JOIN clientes ON clientes.id = contratos.id_cliente
GROUP BY servicos.natureza;
