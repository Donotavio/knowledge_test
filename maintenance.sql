/*------------------------ UPDATES ------------------------*/
-- 4) Agora nosso cliente identificou um erro operacional de sua equipe, todos os usuários de internet da cidade de Santa Maria foram criados sem o sufixo "@voalle.com.br",
-- o que está ocasionando a não autenticação dos mesmos. Você deve adicionar esta informação a este campo.

UPDATE servico_info
  JOIN contratos_servicos ON contratos_servicos.id = servico_info.id_contrato_servico AND servico_info.usuario NOT LIKE '%@%'
  JOIN servicos ON servicos.id = contratos_servicos.id_servico AND servicos.natureza = 'internet'
  JOIN contratos ON contratos.id = contratos_servicos.id_contrato
  JOIN clientes ON clientes.id = contratos.id_cliente AND clientes.cidade = 'Santa Maria'
SET usuario = CONCAT(usuario, '@voalle.com.br’)
WHERE
  TRUE;
