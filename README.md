# Revisão de Tudo que Aprendi

## Conceitos Básicos

### O que são Dados?

​	Valores brutos, fatos brutos, observações documentadas, registros soltos, que são recolhidos e armazenados sem sofrer qualquer tratamento.

### O que são informações?

​	Estruturação de dados, organização de dados. 

​	Conjunto de dados relacionados entre si que geram valor, que criam sentidos aos dados.

​	Material do conhecimento.

## Modelos Relacional

#### Definição:

​	Modelo mais comum, que classifica e organiza as informações em tabelas com linhas e colunas.

#### Definição de Tabelas:

​	Conjuntos de dados dispostos em colunas e linhas referentes a um objetivo comum.

​	As colunas são consideradas como "campos da tabela", como atributos da tabela.

​	As linhas de uma tabela são chamadas também de tuplas, e é onde estão contidos os valores, os dados.

#### O que pode ser definido como Tabela?

* Coisas tangíveis

  Elementos físicos (veículo, produto, animal, etc...).

* Funções

  Perfis de usuário, status de compra.

* Eventos ou ocorrências

  Produtos de um pedido, histórico de dados.

#### Colunas Importantes

* Chave Primária / Primary Key / PK

  Conjunto de um ou mais campos que nunca se repetem. Identidade da tabela. São utilizados como índice de referência na criação de relacionamentos entre tabelas.

* Chave Estrangeira / Foreign Key / FK

  Valor de referência de uma PK de outra tabela ou da mesma tabela para criar um relacionamento.

#### Sistemas de Gerenciamento de Banco de Dados (SGBD)

​	Também chamados de Gestão de Base de Dados. São um conjunto de programas ou softwares responsáveis pelo gerenciamento de um banco de dados.

​	São programas que facilitam a administração de um banco de dados.

## Introdução ao PostgreSQL

## O que é o PostgreSQL?

* Sistema de gerenciamento de Banco de Dados objeto relacional.
* SGBD Opensource*
* Teve início no Departamento de Ciências da Computação na Universidade da Califórnia em Berkeley em 1986.

***Opensource: Pode ser utilizado, modificado e distribuído por qualquer pessoa para qualquer finalidade.**

### Principais Características

* Opensource
* Point in Time Recovery
* Linguagem Procedural com suporte a várias linguagens de programação (Pearl, Python, etc...)
* Views, Functions, Procedures, Triggers
* Consultas Complexas e Common Table Expressions (CTE)
* Suporte a dados geográficos (PostGIS)
* Controle de concorrência multi-versão
* Arquitetura multiprocessos
* Modelo cliente/servidor

## Configurações

### O arquivo postgresql.conf

#### Definição:

​	Arquivo onde estão definidas e armazenadas todas as configurações do servidor PostgreSQL.

#### Localização:

````Diretório
C:\Program Files\PostgreSQL\[versão]\data
````

#### Configurações de Conexão

* LISTEN_ADDRESSES

  Endereço(s) TCP/IP das interfaces que o servidor PostgreSQL vai escutar/liberar conexões.

* PORT

  Porta TCP que o servidor PostgreSQL vai ouvir. **O padrão é 5432.**

* MAX_CONNECTIONS

  Número máximo de conexões simultâneas no servidor PostgreSQL.

* SUPERUSER_RESERVED_CONNECTIONS

  Número de slots reservados para conexões ao banco de dados de super usuários.

#### Configurações de Autenticação

* AUTHENTICATION_TIMEOUT

  Tempo máximo em segundos para o cliente conseguir uma conexão com o servidor.

* PASSWORD_ENCRYPTION

  Algoritmo de criptografia das senhas dos novos usuários criados no banco de dados.

* SSL

  Habilita a conexão criptografada por SSL (Somente se o PostgreSQL foi compilado com suporte SSL).

#### Configurações de Memória

* SHARED_BUFFERS

  Tamanho de memória compartilhada do servidor PostgreSQL para cache/buffer de tabelas, índices e demais relações.

* WORK_MEM

  Tamanho da memória para operações de agrupamento e ordenação (ORDER BY, DISTINCT, MERGE JOINS).

* MAINTENANCE_WORK_MEM

  Tamanho da memória para operações como VACUUM, INDEX e ALTER TABLE.

### O arquivo pg_hba.conf

#### Definição:

​	Arquivo responsável pelo controle de autenticação dos usuários no servidor PostgreSQL.

#### Localização:

````Diretório
C:\Program Files\PostgreSQL\[versão]\data
````

#### Métodos de Autenticação

* TRUST (Conexão sem requisição de senha)
* REJECT (Rejeitar conexões)
* MD5 (Criptografia MD5)
* PASSWORD (Senha sem criptografia)
* GSS (Generic Security Service Application Program Interface)
* SSPI (Security Support Provider Interface - somente para Windows)
* KRB5 (Kerberos V5)
* IDENT (Utiliza o usuário do sistema operacional do cliente via ident server)
* PEER (Utiliza o usuário do sistema operacional do cliente)
* LDAP (LDAP Server)
* RADIUS (RADIUS Server)
* CERT (Autenticação via certificado SSL do cliente)
* PAM (Pluggable Authentication Modules. O usuário precisa estar no banco de dados)

### O arquivo pg_ident.conf

#### Definição:

​	Arquivo responsável por mapear os usuários do sistema operacional com os usuários do banco de dados.

#### Localização:

````Diretório
C:\Program Files\PostgreSQL\[versão]\data
````

## Comandos Administrativos

Usando o programa Serviços do Windows conseguimos utilizar alguns comandos no cluster do PostgreSQL.

#### Localização:

````Diretório
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools
````

***

![img](https://media.discordapp.net/attachments/793135264402767922/862722424767643718/unknown.png?width=400&height=294 "Encontrando o serviço do PostgreSQL")

``Encontrando o serviço do PostgreSQL``

***

![img](https://media.discordapp.net/attachments/793135264402767922/862723624007106582/servicos_clique_direito.png "Comandos Administrativos do Cluster")

``Comandos Administrativos do Cluster``

***

### Arquitetura / Hierarquia

#### Cluster

​	Coleção de bancos de dados que compartilham as mesmas configurações (arquivos de configuração) do PostgreSQL e do sistema operacional (porta, listen_addresses, etc...)

#### Banco de Dados (Database)

​	Conjunto de Schemas

#### Schemas

Conjunto de objetos/relações (tabelas, funções, views, etc...)

## PGAdmin

### Importante para conexão:

1. Liberar acesso ao cluster em postgresql.conf
2. Liberar acesso ao cluster para o usuário do banco de dados em pg_hba.conf
3. Criar/editar usuários.

## Usuários

### Conceitos users / roles / groups

#### Definição:

​	Roles (papéis ou funções), users (usuários) e groups (grupo de usuários) são "contas", perfis de atuação em um banco de dados, que possuem permissões em comum ou específicas.

​	Nas versões anteriores do PostgreSQL 8.1, usuários e roles tinham comportamentos diferentes. Atualmente, roles e users são alias.

​	É possível que roles pertençam a outras roles.

### Administrando users, roles e groups

````sql
CREATE ROLE name [[WITH] option [...]]
Option pode ser:

|SUPERUSER | NOSUPERUSER
|CREATEDB | NOCREATEDB
|CREATEROLE | NOCREATEROLE
|INHERIT | NOINHERIT
|LOGIN | NOLOGIN
|REPLICATION | NOREPLICATION
|BYPASSRLS | NOBYPASSRLS
|CONNECTION LIMIT connlimit
|[ENCRYPTED] PASSWORD 'password' | PASSWORD NULL
|VALID UNTIL 'timestamp'
|IN ROLE role_name [, ...]
|IN GROUP role_name [, ...]
|ROLE role_name [, ...]
|ADMIN role_name [, ...]
|USER role_name [, ...]
|SYSID uid
````

#### Exemplos de criação de roles:

````sql
CREATE ROLE administradores
	CREATEDB
	CREATEROLE
	INHERIT
	NOLOGIN
	REPLICATION
	BYPASSRLS
	CONNECTION LIMIT 1;
	
CREATE ROLE professores
	NOCREATEDB
	NOCREATEROLE
	INHERIT
	NOLOGIN
	NOBYPASSRLS
	CONNECTION LIMIT 10;
	
CREATE ROLE alunos
	NOCREATEDB
	NOCREATEROLE
	INHERIT
	NOLOGIN
	NOBYPASSRLS
	CONNECTION LIMIT 90;
````

### Associação entre Roles

​	Quando uma role assume as permissões de outra role. Necessário a opção ``INHERIT``.

​		No momento da criação da role:

 - ``IN ROLE`` (Passa a pertencer a role informada)
 - ``ROLE`` (a role informada passa a pertencer a nova role)



​	Ou após a criação da role:

````sql
GRANT [role a ser concedida] TO [role a assumir as permissões]
````

#### Exemplos:

````sql
CREATE ROLE professores
	NOCREATEDB
	NOCREATEROLE
	INHERIT
	NOLOGIN
	NOBYPASSRLS
	CONNECTION LIMIT 10;
	
CREATE ROLE daniel 
	LOGIN 
	CONNECTION LIMIT 1 
	PASSWORD '123' 
	IN ROLE professores;
-- A role daniel passa a assumir as permissões da role professores.

CREATE ROLE daniel
	LOGIN
	CONNECTION LIMIT 1
	PASSWORD '123'
	ROLE professores;
-- A role professores passa a fazer parte da role daniel assumindo suas permissões.

CREATE ROLE daniel
	LOGIN
	CONNECTION LIMIT 1
	PASSWORD '123';
	
GRANT professores TO daniel;
-- A role daniel passa a assumir as permissões da role professores.
````

### Desassociar membros entre Roles

 ````sql
 REVOKE [role que será revogada] FROM [role que terá suas permissões revogadas]
 
 -- Exemplo:
 
 REVOKE professores FROM daneil;
 ````

### Alterar uma Role

````sql
ALTER ROLE role_specification [[WITH] option [...]]
Option pode ser:

|SUPERUSER | NOSUPERUSER
|CREATEDB | NOCREATEDB
|CREATEROLE | NOCREATEROLE
|INHERIT | NOINHERIT
|LOGIN | NOLOGIN
|REPLICATION | NOREPLICATION
|BYPASSRLS | NOBYPASSRLS
|CONNECTION LIMIT connlimit
|[ENCRYPTED] PASSWORD 'password' | PASSWORD NULL
|VALID UNTIL 'timestamp'
````

### Excluir uma Role

````sql
DROP ROLE role_specification;
````

## Administrando acessos (GRANT)

#### Definição:

​	São os privilégios de acesso aos objetos do banco de dados.

#### Privilégios:

-- **tabela** 								   -- **function**

-- coluna									-- language

-- sequence   							-- large object

-- **database**							   -- **schema**

-- domain 				 				 -- tablespace

-- foreign data wrapper		   -- type

-- foreign server

### DATABASE

````sql
GRANT {{CREATE | CONNECT | TEMPORARY | TEMP}[, ...] | ALL [PRIVILEGES]}
	ON DATABASE database_name [, ...]
	TO role_specification [, ...] [WITH GRANT OPTION]
````

### SCHEMA

````sql
GRANT {{CREATE | USAGE}[, ...] | ALL [PRIVILEGES]}
	ON SCHEMA schema_name [, ...]
	TO role_specification [, ...] [WITH GRANT OPTION]
````

### TABLE

````sql
GRANT {{SELECT | INSERT | UPDATE | DELETE | TRUNCATE | REFERENCES | TRIGGER}[, ...] | ALL [PRIVILEGES]}
	ON {[TABLE] table_name [, ...] | ALL TABLES IN SCHEMA schema_name [, ...]}
	TO role_specification [, ...] [WITH GRANT OPTION]
````

## Revogando acessos (REVOKE)

### DATABASE

````sql
REVOKE [GRANT OPTION FOR]
	{{CREATE | CONNECT | TEMPORARY | TEMP} [, ...] | ALL [PRIVILEGES]}
	ON DATABASE database_name [, ...]
	FROM {[GROUP] role_name | PUBLIC} [, ...] 
	[CASCADE | RESTRICT]
````

### SCHEMA

````sql
REVOKE [GRANT OPTION FOR]
	{{CREATE | USAGE} [, ...] | ALL [PRIVILEGES]}
	ON SCHEMA schema_name [, ...]
	FROM {[GROUP] role_name | PUBLIC} [, ...] 
	[CASCADE | RESTRICT]
````

### TABLE

````sql
REVOKE [GRANT OPTION FOR]
	{{SELECT | INSERT | UPDATE | DELETE | TRUNCATE | REFERENCES | TRIGGER} [, ...] | ALL [PRIVILEGES]}
	ON {[TABLE] table_name [, ...] | ALL TABLES IN SCHEMA schema_name [, ...]}
	FROM {[GROUP] role_name | PUBLIC} [, ...] 
	[CASCADE | RESTRICT]
````

#### Revogando todas as permissões (simplificado)

````sql
REVOKE ALL ON ALL TABLES IN SCHEMA [schema] FROM [role];
REVOKE ALL ON SCHEMA [schema] FROM [role];
REVOKE ALL ON DATABASE [database] FROM [role];
````

## Database, Schemas e Objetos

### DATABASE

​	É o banco de dados.

​	Grupo de Schemas e seus objetos.

​	Seus schemas e objetos não podem ser compartilhados entre si.

​	Cada database é separado é separado um do outro compartilhando apenas usuários/roles e configurações do cluster postgresql.

### SCHEMAS

​	É um grupo de objetos.

​	É possível relacionar objetos entre diversos Schemas.

​	Por exemplo: schema public e schema curso podem ter tabelas com o mesmo nome (teste, por exemplo) relacionando-se entre si.

### OBJETOS

​	São tabelas, views, funções, types, sequences, entre outros, pertencentes aos schemas.

***

# CONTINUA...

***

