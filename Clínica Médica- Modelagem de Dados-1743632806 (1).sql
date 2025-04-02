CREATE TABLE [Paciente] (
	[id_paciente] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nome_Paciente] nvarchar(255) NOT NULL,
	[data_Nascimento] date NOT NULL,
	[CPF] nvarchar(14) NOT NULL UNIQUE,
	[telefone] nvarchar(20) NOT NULL,
	[email] nvarchar(255) NOT NULL,
	[endereço] nvarchar(255) NOT NULL,
	PRIMARY KEY ([id_paciente])
);

CREATE TABLE [Medico] (
	[id_Medico] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nome_Medico] nvarchar(255) NOT NULL,
	[especialidade] nvarchar(255) NOT NULL,
	[CRM] nvarchar(15) NOT NULL UNIQUE,
	[telefone] nvarchar(20) NOT NULL,
	[email] nvarchar(255) NOT NULL,
	PRIMARY KEY ([id_Medico])
);

CREATE TABLE [Exame] (
	[id_Exame] int IDENTITY(1,1) NOT NULL UNIQUE,
	[id_Paciente] int,
	[nome_Exame] nvarchar(255) NOT NULL,
	[data_Solicitacao] date NOT NULL,
	[id_Consulta] int,
	PRIMARY KEY ([id_Exame])
);

CREATE TABLE [Consulta] (
	[id_Consulta] int IDENTITY(1,1) NOT NULL UNIQUE,
	[id_Paciente] int NOT NULL,
	[id_Medico] int NOT NULL,
	[data_Hora] datetime NOT NULL,
	[status] nvarchar(50) NOT NULL,
	[notas] nvarchar(500) NOT NULL,
	PRIMARY KEY ([id_Consulta])
);

CREATE TABLE [ResultadoExame] (
	[id_Resultado] int IDENTITY(1,1) NOT NULL UNIQUE,
	[id_Exame] int,
	[data_Resultado] date NOT NULL,
	[arquivo_Resultado] nvarchar(255) NOT NULL,
	[observações] nvarchar(500) NOT NULL,
	PRIMARY KEY ([id_Resultado])
);

ALTER TABLE [Paciente] ADD CONSTRAINT [Paciente_fk0] FOREIGN KEY ([id_paciente]) REFERENCES [Consulta]([id_Paciente]);
ALTER TABLE [Medico] ADD CONSTRAINT [Medico_fk0] FOREIGN KEY ([id_Medico]) REFERENCES [Consulta]([id_Medico]);
ALTER TABLE [Exame] ADD CONSTRAINT [Exame_fk0] FOREIGN KEY ([id_Exame]) REFERENCES [ResultadoExame]([id_Exame]);

ALTER TABLE [Exame] ADD CONSTRAINT [Exame_fk1] FOREIGN KEY ([id_Paciente]) REFERENCES [Paciente]([id_paciente]);

ALTER TABLE [Exame] ADD CONSTRAINT [Exame_fk4] FOREIGN KEY ([id_Consulta]) REFERENCES [Consulta]([id_Consulta]);
ALTER TABLE [Consulta] ADD CONSTRAINT [Consulta_fk0] FOREIGN KEY ([id_Consulta]) REFERENCES [Exame]([id_Consulta]);

ALTER TABLE [Consulta] ADD CONSTRAINT [Consulta_fk1] FOREIGN KEY ([id_Paciente]) REFERENCES [Paciente]([id_paciente]);

ALTER TABLE [Consulta] ADD CONSTRAINT [Consulta_fk2] FOREIGN KEY ([id_Medico]) REFERENCES [Medico]([id_Medico]);
ALTER TABLE [ResultadoExame] ADD CONSTRAINT [ResultadoExame_fk1] FOREIGN KEY ([id_Exame]) REFERENCES [Exame]([id_Exame]);