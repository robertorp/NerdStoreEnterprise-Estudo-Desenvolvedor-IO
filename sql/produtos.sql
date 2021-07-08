CREATE DATABASE "NerdStoreEnterprise";

CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE TABLE "AspNetRoles" (
        "Id" text NOT NULL,
        "Name" character varying(256) NULL,
        "NormalizedName" character varying(256) NULL,
        "ConcurrencyStamp" text NULL,
        CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE TABLE "AspNetUsers" (
        "Id" text NOT NULL,
        "UserName" character varying(256) NULL,
        "NormalizedUserName" character varying(256) NULL,
        "Email" character varying(256) NULL,
        "NormalizedEmail" character varying(256) NULL,
        "EmailConfirmed" boolean NOT NULL,
        "PasswordHash" text NULL,
        "SecurityStamp" text NULL,
        "ConcurrencyStamp" text NULL,
        "PhoneNumber" text NULL,
        "PhoneNumberConfirmed" boolean NOT NULL,
        "TwoFactorEnabled" boolean NOT NULL,
        "LockoutEnd" timestamp with time zone NULL,
        "LockoutEnabled" boolean NOT NULL,
        "AccessFailedCount" integer NOT NULL,
        CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE TABLE "AspNetRoleClaims" (
        "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
        "RoleId" text NOT NULL,
        "ClaimType" text NULL,
        "ClaimValue" text NULL,
        CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE TABLE "AspNetUserClaims" (
        "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
        "UserId" text NOT NULL,
        "ClaimType" text NULL,
        "ClaimValue" text NULL,
        CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE TABLE "AspNetUserLogins" (
        "LoginProvider" character varying(128) NOT NULL,
        "ProviderKey" character varying(128) NOT NULL,
        "ProviderDisplayName" text NULL,
        "UserId" text NOT NULL,
        CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey"),
        CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE TABLE "AspNetUserRoles" (
        "UserId" text NOT NULL,
        "RoleId" text NOT NULL,
        CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId"),
        CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id") ON DELETE CASCADE,
        CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE TABLE "AspNetUserTokens" (
        "UserId" text NOT NULL,
        "LoginProvider" character varying(128) NOT NULL,
        "Name" character varying(128) NOT NULL,
        "Value" text NULL,
        CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name"),
        CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" ("RoleId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE UNIQUE INDEX "RoleNameIndex" ON "AspNetRoles" ("NormalizedName");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE INDEX "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" ("UserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE INDEX "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" ("UserId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE INDEX "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" ("RoleId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE INDEX "EmailIndex" ON "AspNetUsers" ("NormalizedEmail");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    CREATE UNIQUE INDEX "UserNameIndex" ON "AspNetUsers" ("NormalizedUserName");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210605145852_Initial') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210605145852_Initial', '5.0.6');
    END IF;
END $$;
COMMIT;

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210706133247_PacoteEduardoPires') THEN
    CREATE TABLE "SecurityKeys" (
        "Id" uuid NOT NULL,
        "Parameters" text NULL,
        "KeyId" text NULL,
        "Type" text NULL,
        "JwsAlgorithm" text NULL,
        "JweAlgorithm" text NULL,
        "JweEncryption" text NULL,
        "CreationDate" timestamp without time zone NOT NULL,
        "JwkType" integer NOT NULL,
        "IsRevoked" boolean NOT NULL,
        CONSTRAINT "PK_SecurityKeys" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210706133247_PacoteEduardoPires') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210706133247_PacoteEduardoPires', '5.0.6');
    END IF;
END $$;
COMMIT;

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210706202034_RefreshToken') THEN
    CREATE TABLE "RefreshTokens" (
        "Id" uuid NOT NULL,
        "Username" text NULL,
        "Token" uuid NOT NULL,
        "ExpirationDate" timestamp without time zone NOT NULL,
        CONSTRAINT "PK_RefreshTokens" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210706202034_RefreshToken') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210706202034_RefreshToken', '5.0.6');
    END IF;
END $$;
COMMIT;

CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210606165006_Initial') THEN
    CREATE TABLE "Produtos" (
        "Id" uuid NOT NULL,
        "Nome" varchar(250) NOT NULL,
        "Descricao" varchar(500) NOT NULL,
        "Ativo" boolean NOT NULL,
        "Valor" numeric NOT NULL,
        "DataCadastro" timestamp without time zone NOT NULL,
        "Imagem" varchar(250) NOT NULL,
        "QuantidadeEstoque" integer NOT NULL,
        CONSTRAINT "PK_Produtos" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210606165006_Initial') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210606165006_Initial', '5.0.6');
    END IF;
END $$;
COMMIT;

DO $$
BEGIN
INSERT INTO public."Produtos" ("Id","Nome","Descricao","Ativo","Valor","DataCadastro","Imagem","QuantidadeEstoque") VALUES
	 ('7d67df76-2d4e-4a47-a19c-08eb80a9060b'::uuid,'Camiseta Code Life Preta','Camiseta 100% algodão, resistente a lavagens e altas temperaturas.',true,90.00,'2019-07-19 00:00:00','camiseta2.jpg',100),
	 ('78162be3-61c4-4959-89d7-5ebfb476427e'::uuid,'Caneca No Coffee No Code','Caneca de porcelana com impressão térmica de alta resistência.',true,50.00,'2019-07-19 00:00:00','caneca4.jpg',100),
	 ('6ecaaa6b-ad9f-422c-b3bb-6013ec27b4bb'::uuid,'Camiseta Debugar Preta','Camiseta 100% algodão, resistente a lavagens e altas temperaturas.',true,75,'2019-07-19 00:00:00','camiseta4.jpg',150),
	 ('52dd696b-0882-4a73-9525-6af55dd416a4'::uuid,'Caneca Star Bugs Coffee','Caneca de porcelana com impressão térmica de alta resistência.',true,20,'2019-07-19 00:00:00','caneca1.jpg',0),
	 ('191ddd3e-acd4-4c3b-ae74-8e473993c5da'::uuid,'Caneca Programmer Code','Caneca de porcelana com impressão térmica de alta resistência.',true,15,'2019-07-19 00:00:00','caneca2.jpg',1),
	 ('20e08cd4-2402-4e76-a3c9-a026185b193d'::uuid,'Caneca Turn Coffee in Code','Caneca de porcelana com impressão térmica de alta resistência.',true,20,'2019-07-19 00:00:00','caneca3.jpg',0),
	 ('6ecaaa6b-ad9f-422c-b3bb-6013ec27c4bb'::uuid,'Camiseta Code Life Cinza','Camiseta 100% algodão, resistente a lavagens e altas temperaturas.',true,80,'2019-07-19 00:00:00','camiseta3.jpg',4),
	 ('fc184e11-014c-4978-aa10-9eb5e1af369b'::uuid,'Camiseta Software Developer','Camiseta 100% algodão, resistente a lavagens e altas temperaturas.',true,100,'2019-07-19 00:00:00','camiseta1.jpg',8);
END $$;
COMMIT;

CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210609145337_Carrinho') THEN
    CREATE TABLE "CarrinhoCliente" (
        "Id" uuid NOT NULL,
        "ClienteId" uuid NOT NULL,
        "ValorTotal" numeric NOT NULL,
        CONSTRAINT "PK_CarrinhoCliente" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210609145337_Carrinho') THEN
    CREATE TABLE "CarrinhoItens" (
        "Id" uuid NOT NULL,
        "ProdutoId" uuid NOT NULL,
        "Nome" varchar(100) NULL,
        "Quantidade" integer NOT NULL,
        "Valor" numeric NOT NULL,
        "Imagem" varchar(100) NULL,
        "CarrinhoId" uuid NOT NULL,
        CONSTRAINT "PK_CarrinhoItens" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_CarrinhoItens_CarrinhoCliente_CarrinhoId" FOREIGN KEY ("CarrinhoId") REFERENCES "CarrinhoCliente" ("Id") ON DELETE RESTRICT
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210609145337_Carrinho') THEN
    CREATE INDEX "IDX_Cliente" ON "CarrinhoCliente" ("ClienteId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210609145337_Carrinho') THEN
    CREATE INDEX "IX_CarrinhoItens_CarrinhoId" ON "CarrinhoItens" ("CarrinhoId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210609145337_Carrinho') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210609145337_Carrinho', '5.0.6');
    END IF;
END $$;
COMMIT;

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210625030929_VoucherAtributosCarrinho') THEN
    ALTER TABLE "CarrinhoCliente" ADD "Desconto" numeric NOT NULL DEFAULT 0.0;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210625030929_VoucherAtributosCarrinho') THEN
    ALTER TABLE "CarrinhoCliente" ADD "Percentual" numeric NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210625030929_VoucherAtributosCarrinho') THEN
    ALTER TABLE "CarrinhoCliente" ADD "TipoDesconto" integer NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210625030929_VoucherAtributosCarrinho') THEN
    ALTER TABLE "CarrinhoCliente" ADD "ValorDesconto" numeric NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210625030929_VoucherAtributosCarrinho') THEN
    ALTER TABLE "CarrinhoCliente" ADD "VoucherCodigo" varchar(50) NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210625030929_VoucherAtributosCarrinho') THEN
    ALTER TABLE "CarrinhoCliente" ADD "VoucherUtilizado" boolean NOT NULL DEFAULT FALSE;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210625030929_VoucherAtributosCarrinho') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210625030929_VoucherAtributosCarrinho', '5.0.6');
    END IF;
END $$;
COMMIT;

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210626231248_AtivadoCascadeCarrinho') THEN
    ALTER TABLE "CarrinhoItens" DROP CONSTRAINT "FK_CarrinhoItens_CarrinhoCliente_CarrinhoId";
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210626231248_AtivadoCascadeCarrinho') THEN
    ALTER TABLE "CarrinhoItens" ADD CONSTRAINT "FK_CarrinhoItens_CarrinhoCliente_CarrinhoId" FOREIGN KEY ("CarrinhoId") REFERENCES "CarrinhoCliente" ("Id") ON DELETE CASCADE;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210626231248_AtivadoCascadeCarrinho') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210626231248_AtivadoCascadeCarrinho', '5.0.6');
    END IF;
END $$;
COMMIT;

CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210607115804_Clientes') THEN
    CREATE TABLE "Clientes" (
        "Id" uuid NOT NULL,
        "Nome" varchar(200) NOT NULL,
        "Email" varchar(254) NULL,
        "Cpf" varchar(11) NULL,
        "Excluido" boolean NOT NULL,
        CONSTRAINT "PK_Clientes" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210607115804_Clientes') THEN
    CREATE TABLE "Enderecos" (
        "Id" uuid NOT NULL,
        "Logradouro" varchar(200) NOT NULL,
        "Numero" varchar(50) NOT NULL,
        "Complemento" varchar(250) NULL,
        "Bairro" varchar(100) NOT NULL,
        "Cep" varchar(20) NOT NULL,
        "Cidade" varchar(100) NOT NULL,
        "Estado" varchar(50) NOT NULL,
        "ClienteId" uuid NOT NULL,
        CONSTRAINT "PK_Enderecos" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_Enderecos_Clientes_ClienteId" FOREIGN KEY ("ClienteId") REFERENCES "Clientes" ("Id") ON DELETE RESTRICT
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210607115804_Clientes') THEN
    CREATE UNIQUE INDEX "IX_Enderecos_ClienteId" ON "Enderecos" ("ClienteId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210607115804_Clientes') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210607115804_Clientes', '5.0.6');
    END IF;
END $$;
COMMIT;

CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210703122934_Pagamentos') THEN
    CREATE TABLE "Pagamentos" (
        "Id" uuid NOT NULL,
        "PedidoId" uuid NOT NULL,
        "TipoPagamento" integer NOT NULL,
        "Valor" numeric NOT NULL,
        CONSTRAINT "PK_Pagamentos" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210703122934_Pagamentos') THEN
    CREATE TABLE "Transacoes" (
        "Id" uuid NOT NULL,
        "CodigoAutorizacao" varchar(100) NULL,
        "BandeiraCartao" varchar(100) NULL,
        "DataTransacao" timestamp without time zone NULL,
        "ValorTotal" numeric NOT NULL,
        "CustoTransacao" numeric NOT NULL,
        "Status" integer NOT NULL,
        "TID" varchar(100) NULL,
        "NSU" varchar(100) NULL,
        "PagamentoId" uuid NOT NULL,
        CONSTRAINT "PK_Transacoes" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_Transacoes_Pagamentos_PagamentoId" FOREIGN KEY ("PagamentoId") REFERENCES "Pagamentos" ("Id") ON DELETE RESTRICT
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210703122934_Pagamentos') THEN
    CREATE INDEX "IX_Transacoes_PagamentoId" ON "Transacoes" ("PagamentoId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210703122934_Pagamentos') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210703122934_Pagamentos', '5.0.6');
    END IF;
END $$;
COMMIT;

CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210625000629_Vourcher') THEN
    CREATE TABLE "Vouchers" (
        "Id" uuid NOT NULL,
        "Codigo" varchar(100) NOT NULL,
        "Percentual" numeric NULL,
        "ValorDesconto" numeric NULL,
        "Quantidade" integer NOT NULL,
        "TipoDesconto" integer NOT NULL,
        "DataCriacao" timestamp without time zone NOT NULL,
        "DataUtilizacao" timestamp without time zone NULL,
        "DataValidade" timestamp without time zone NOT NULL,
        "Ativo" boolean NOT NULL,
        "Utilizado" boolean NOT NULL,
        CONSTRAINT "PK_Vouchers" PRIMARY KEY ("Id")
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210625000629_Vourcher') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210625000629_Vourcher', '5.0.6');
    END IF;
END $$;
COMMIT;

START TRANSACTION;


DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210626033229_PedidosCria') THEN
    CREATE SEQUENCE minha_sequencia AS integer START WITH 1000 INCREMENT BY 1 NO MINVALUE NO MAXVALUE NO CYCLE;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210626033229_PedidosCria') THEN
    CREATE TABLE "Pedidos" (
        "Id" uuid NOT NULL,
        "Codigo" integer NOT NULL DEFAULT (nextval('minha_sequencia')),
        "ClienteId" uuid NOT NULL,
        "VoucherId" uuid NULL,
        "VoucherUtilizado" boolean NOT NULL,
        "Desconto" numeric NOT NULL,
        "ValorTotal" numeric NOT NULL,
        "DataCadastro" timestamp without time zone NOT NULL,
        "PedidoStatus" integer NOT NULL,
        "Logradouro" varchar(100) NULL,
        "Numero" varchar(100) NULL,
        "Complemento" varchar(100) NULL,
        "Bairro" varchar(100) NULL,
        "Cep" varchar(100) NULL,
        "Cidade" varchar(100) NULL,
        "Estado" varchar(100) NULL,
        CONSTRAINT "PK_Pedidos" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_Pedidos_Vouchers_VoucherId" FOREIGN KEY ("VoucherId") REFERENCES "Vouchers" ("Id") ON DELETE RESTRICT
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210626033229_PedidosCria') THEN
    CREATE TABLE "PedidoItems" (
        "Id" uuid NOT NULL,
        "PedidoId" uuid NOT NULL,
        "ProdutoId" uuid NOT NULL,
        "ProdutoNome" varchar(250) NOT NULL,
        "Quantidade" integer NOT NULL,
        "ValorUnitario" numeric NOT NULL,
        "ProdutoImagem" varchar(100) NULL,
        CONSTRAINT "PK_PedidoItems" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_PedidoItems_Pedidos_PedidoId" FOREIGN KEY ("PedidoId") REFERENCES "Pedidos" ("Id") ON DELETE RESTRICT
    );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210626033229_PedidosCria') THEN
    CREATE INDEX "IX_PedidoItems_PedidoId" ON "PedidoItems" ("PedidoId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210626033229_PedidosCria') THEN
    CREATE INDEX "IX_Pedidos_VoucherId" ON "Pedidos" ("VoucherId");
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20210626033229_PedidosCria') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20210626033229_PedidosCria', '5.0.6');
    END IF;
END $$;
COMMIT;

