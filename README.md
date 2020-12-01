# knowledge_test
SQL knowledge test and the like for hiring in the database analyst position.


__________________________________________________________________________________________________

Segue exercício:

1) Criar uma estrutura em DB que comporte o seguinte cenário:

    - Um cadastro básico de cliente contendo Nome, CPF/CNPJ, RG, Inscrição Estadual, Telefone, E-mail e endereço.

    - Estes clientes terão N (N podendo ser ZERO) contratos associados a eles e conterão as seguintes informações (Descrição, Vigência, e Valor praticado)

    - Cada contrato terá N serviços prestados ao cliente.

    - Os serviços prestados ao cliente podem ser das mais diversas naturezas, sendo que uma delas pode ser um serviço de internet.

    - Para um serviço de internet são necessárias informações de conexão, tais como usuário e senha de autenticação.

 

2) Agora que já temos nossa estrutura, o cliente está solicitando um relatório contendo quantos clientes ativos ele possui por cidade, bem como o valor total contratado.

 

3) Nosso cliente também deseja saber quantos de seus clientes não possuem serviços de internet, e qual o valor total praticado por serviço.

 

4) Agora nosso cliente identificou um erro operacional de sua equipe, todos os usuários de internet da cidade de Santa Maria foram criados sem o sufixo "@voalle.com.br",

o que está ocasionando a não autenticação dos mesmos. Você deve adicionar esta informação a este campo.
