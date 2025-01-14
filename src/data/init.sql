DROP SCHEMA "arquivosSql";
DROP SCHEMA "arquivosUteis";
DROP SCHEMA "autenticacao";
DROP SCHEMA "downloadsDrivers";
DROP SCHEMA "linkUteis";
DROP SCHEMA "usuario";
DROP SCHEMA "videosYoutube";
DROP SCHEMA "notas_versao";


CREATE SCHEMA "arquivosSql";
CREATE SCHEMA "arquivosUteis";
CREATE SCHEMA "autenticacao";
CREATE SCHEMA "downloadsDrivers";
CREATE SCHEMA "linkUteis";
CREATE SCHEMA "usuario";
CREATE SCHEMA "videosYoutube";
CREATE SCHEMA "notas_versao";


INSERT INTO "arquivosSql".arquivossql (nome,nome_arquivo,versao,link) VALUES
	 ('Banco de Dados Cliente Novo','Inovafarma_mod_BD_CLIENTE_NOVO.rar','v1.0','https://mega.nz/file/DrBGDCAC#Ujh6j-3uvuqV830LB8TlvVluM2VkOdc6wDFGC8Wrm8Y'),
	 ('Banco de Dados Vazio','novo_backup_vazio.rar','v1.0','https://mega.nz/file/qjYE0Lxa#sKHTOd_duGp4o8kmLtmBOgNIAW76trO1g4jIXzUtvtA');

INSERT INTO "downloadsDrivers".downloadsdrivers (nome,nome_arquivo,versao,link) VALUES
	 ('Impressora Epson Driver','epson_não_fiscalAPD_509_T20_EWM.zip','v5.0','https://mega.nz/file/GGJ1HCLA#fwNFuArlpSZBtdX0QgFhnyFc5k-SoGCV4zS-eHuYYSM'),
	 ('Impressora Elgin I8 Driver','ELGIN I8.exe','v7.17','https://mega.nz/file/HCoBQSbT#-jBRJDKh70DURAWMeS8XUic6HmqaTU4NC1Gm19hWrNk'),
	 ('Impressora Bematech Driver','DriverSpoolerGeralBematech_V5.0.0.4.zip','v5.0.0.4','https://mega.nz/file/zPgRlSTa#tMM1O4uEg6KPJRF3EKTydaM0Czpbz047nDcuJJvE5TU'),
	 ('Impressora Elgin I7 e I9 Driver ','ELGIN I7 e I9.exe','v2.2.24','https://mega.nz/file/TGBREAKa#NgQDUtU5OMU0fGJy4o-an4NvYh24ymMsKvQw3brXDE4'),
	 ('Driver Impressora JP80H-UE','POS Printer Driver V11.2.0.0.zip','v11.2.0.0','https://mega.nz/file/WLpVUJbR#UG68O7tMsAEuEGlyM1J4z09yVlWRDTBLNUtL2HdWmis'),
	 ('Driver Impressora TANCA','Pasta de arquivos','v1.5.0','https://mega.nz/folder/aDxU3aTS#yerd4k34qrsyRpzgm5w1Og');
INSERT INTO "arquivosUteis".utilitarios (nome,nome_arquivo,versao,link) VALUES
	 ('Inovafarma Install','InovaFarma-Install.rar','v1.0','https://mega.nz/file/khJFQRoI#l0ppC2FcCPaeM7qKZK6v_ly_m19OshQFVJirwWvDcJM'),
	 ('Instalação Inovafarma','instalação inova.rar','v1.0','https://mega.nz/file/vjZlAYjL#UWbN4rzYMZRzqEBeiyG2YZvdIxRZ2sKKt4CsmI8cb4g'),
	 ('SQL 2016 Developer','en_sql_server_2016_developer_with... .iso','v13.0.4001','https://mega.nz/file/t1EkWKBL#T0rWIZ6TviiHqG0QhpKzs8f4DdtfDWT_9Q6-GglP0Dk'),
	 ('Corrigir bug windows 7 update(x86)','windows6.1-kb3138612-x86_6e90531d... .rar','v1.0','https://mega.nz/file/bfY1iApL#ps5YLt8Xpq29_kWYw07M3bhMBpocDVnSZHIZXjayguw'),
	 ('API InovaFarma','inovafarma-api-4.0.7.exe','v4.0.7','https://github.com/precisaosistemas/inovafarma-api/releases/download/v4.0.7/inovafarma-api-4.0.7.exe'),
	 ('Corrigir bug windows 7 update(x64)','windows6.1-kb3138612-x64_f7... .rar','v1.0','https://mega.nz/file/ee5UlBba#WrxM6S_1EZdXbbJnDY47grtFl9cPk97z7rezNPYgToE'),
	 ('TeamViewer 64 bits','TeamViewer_Setup_x64.exe','v15.32.3','https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe'),
	 ('AnyDesk','AnyDesk.exe','v7.0.14','https://anydesk.com/pt/downloads/thank-you?dv=win_exe');
INSERT INTO autenticacao.usuarioauth (nome,email,registrado_em,ultimo_acesso_em,senha_hash) VALUES
	 ('Mateus Araujo','mateus@mail.com','2022-07-14 00:45:03.893535','2022-10-28 19:19:49.821151','55a5e9e78207b4df8699d60886fa070079463547b095d1a05bc719bb4e6cd251'),
	 ('Iracytaia','iracytaia@gmail.com','2022-07-14 04:47:53.260138','2022-11-14 18:47:44.926031','54e781342f34d809abfcc45c874427d70db17629a164646ed85911ee2dec87f5'),
	 ('Funcionario','suportetaia@gmail.com','2022-07-14 04:49:14.568486','2022-11-14 20:41:10.490859','7369bc6a6b363a9d48d3ca5d45c7755aeb5b0bf4e00442670adacfce85bc00c1');
INSERT INTO "videosYoutube".videosyoutube (nome,nome_site,link) VALUES
	 ('Configurando Comissão','https://www.youtube.com/watch?v=6IoHiZxrdoM&ab_channel=IracyDias','https://www.youtube.com/watch?v=6IoHiZxrdoM&ab_channel=IracyDias'),
	 ('Precificação Inova','https://www.youtube.com/watch?v=E9Z_UItG3iY&ab_channel=IracyDias','https://www.youtube.com/watch?v=E9Z_UItG3iY&ab_channel=IracyDias'),
	 ('Ponto Fidelidade','https://www.youtube.com/watch?v=XJXoTpGzuB0&ab_channel=IracyDias','https://www.youtube.com/watch?v=XJXoTpGzuB0&ab_channel=IracyDias'),
	 ('Treinamento Caixa Venda Direta','https://www.youtube.com/watch?v=PwNCbl4jwdg&ab_channel=IracyDias','https://www.youtube.com/watch?v=PwNCbl4jwdg&ab_channel=IracyDias'),
	 ('Comissão Vendedor Configuração','https://www.youtube.com/watch?v=c02DFlDyIAM&ab_channel=IracyDias','https://www.youtube.com/watch?v=c02DFlDyIAM&ab_channel=IracyDias'),
	 ('Combo Relatórios Inovafarma Vendas','https://www.youtube.com/watch?v=Vc-omUPQwPk&ab_channel=IracyDias','https://www.youtube.com/watch?v=Vc-omUPQwPk&ab_channel=IracyDias'),
	 ('Como Efetuar Pré-Vendas','https://www.youtube.com/watch?v=AaEzL6HCvZM','https://www.youtube.com/watch?v=AaEzL6HCvZM'),
	 ('Sangria e Suprimento2','https://www.youtube.com/watch?v=hS3Sh3SOifM','https://www.youtube.com/watch?v=hS3Sh3SOifM'),
	 ('Atualização de Preços Abcfarma','https://www.youtube.com/watch?v=VQ-7NAbbDD0&ab_channel=IracyDias','https://www.youtube.com/watch?v=VQ-7NAbbDD0&ab_channel=IracyDias'),
	 ('cadastro promoção','','https://www.youtube.com/watch?v=LQX-fyG50yY');
INSERT INTO "videosYoutube".videosyoutube (nome,nome_site,link) VALUES
	 ('como efetuar oferta','','https://www.youtube.com/watch?v=ZZb2w3iFD8w&ab_channel=IracyDias'),
	 ('Cadastro Promoção','','https://www.youtube.com/watch?v=LQX-fyG50yY&ab_channel=IracyDias'),
	 ('Baixa conta do cliente (CONTAS A RECEBER)','','https://www.youtube.com/watch?v=-ZD61w-vXnc&ab_channel=IracyDias'),
	 ('Posição de estoque','','https://www.youtube.com/watch?v=mSqPwX1JOt0'),
	 ('caixa s/ conferencia e não cego','','https://www.youtube.com/watch?v=_pyuraWwBBY&ab_channel=IracyDias'),
	 ('uso continuo InovaFarma - Whatsaap','','https://www.youtube.com/watch?v=fyoqK7EjCbo&ab_channel=IracyDias'),
	 ('Balanço de estoque','','https://www.youtube.com/watch?v=rGDl6-9FRAI'),
	 ('Venda com forma de pagamento PIX (pre-venda)','','https://www.youtube.com/watch?v=HSem4Km93pg&ab_channel=IracyDias'),
	 ('venda com forma pagamento PIX (venda direta)','','https://www.youtube.com/watch?v=WwcgIsIKnW0&ab_channel=IracyDias'),
	 ('carta correção NF-E','','https://www.youtube.com/watch?v=P7nagOnsxS8&ab_channel=IracyDias');
INSERT INTO "videosYoutube".videosyoutube (nome,nome_site,link) VALUES
	 ('Emitir Nota Fiscal venda ja efetuada','','https://www.youtube.com/watch?v=C18T51Ke7bw&ab_channel=IracyDias'),
	 ('Estoque Regulador','','https://www.youtube.com/watch?v=4JnJlgeXsYQ&ab_channel=IracyDias'),
	 ('lançar receita tela venda SNGPC','','https://www.youtube.com/watch?v=qhunfCWjnMs&ab_channel=IracyDias'),
	 ('laçamento receita manual sngpc','','https://www.youtube.com/watch?v=SGxHts0rQt0&ab_channel=IracyDias'),
	 ('anydesk versão antiga','','https://mega.nz/file/olwgzZqA#DBqn3tvEU2RbXWi-pakhYtk_Taj7OEY_S-m5zLT_JDk'),
	 ('Lançamento Caixa - Prevenda com Conferencia de Produtos','https://www.youtube.com/watch?v=BIqs8SBtVmA&ab_channel=IracyDias','https://www.youtube.com/watch?v=BIqs8SBtVmA&ab_channel=IracyDias'),
	 ('Atualização Preço Manual','https://www.youtube.com/watch?v=b7EDcR_piDw&ab_channel=IracyDias','https://www.youtube.com/watch?v=b7EDcR_piDw&ab_channel=IracyDias'),
	 ('Baixa Vencimento Cartão','https://www.youtube.com/watch?v=UYcuWMokoJY&ab_channel=IracyDias','https://www.youtube.com/watch?v=UYcuWMokoJY&ab_channel=IracyDias'),
	 ('Como Cadastrar Conta Bancaria','https://www.youtube.com/watch?v=-mcXAvoaVx8','https://www.youtube.com/watch?v=-mcXAvoaVx8'),
	 ('Definição Acesso','https://www.youtube.com/watch?v=96g3cLoUnxk&ab_channel=IracyDias','https://www.youtube.com/watch?v=96g3cLoUnxk&ab_channel=IracyDias');
INSERT INTO "videosYoutube".videosyoutube (nome,nome_site,link) VALUES
	 ('Curva ABC','https://www.youtube.com/watch?v=WjrqITOTwow&ab_channel=IracyDias','https://www.youtube.com/watch?v=WjrqITOTwow&ab_channel=IracyDias'),
	 ('Relatorio do Curva ABC','https://www.youtube.com/watch?v=eSPyXVsmy3U&ab_channel=IracyDias','https://www.youtube.com/watch?v=eSPyXVsmy3U&ab_channel=IracyDias'),
	 ('Devolução compra','https://www.youtube.com/watch?v=ZgEz_OR-NIw','https://www.youtube.com/watch?v=ZgEz_OR-NIw'),
	 ('Devolução compra com transportadora','https://www.youtube.com/watch?v=1euddufK0SE','https://www.youtube.com/watch?v=1euddufK0SE'),
	 ('Como gerar xml INOVAFARMA','https://www.youtube.com/watch?v=G1D_zsYfung&ab_channel=IracyDias','https://www.youtube.com/watch?v=G1D_zsYfung&ab_channel=IracyDias'),
	 ('laçar contas a pagar','https://www.youtube.com/watch?v=BEDN4Z3RdsQ&ab_channel=IracyDias','https://www.youtube.com/watch?v=BEDN4Z3RdsQ&ab_channel=IracyDias'),
	 ('baixa contas a pagar','https://www.youtube.com/watch?v=G9Hc5N85FQU&ab_channel=IracyDias','https://www.youtube.com/watch?v=G9Hc5N85FQU&ab_channel=IracyDias'),
	 ('cadastrando kit','https://www.youtube.com/watch?v=NZBqT09PR54&ab_channel=IracyDias','https://www.youtube.com/watch?v=NZBqT09PR54&ab_channel=IracyDias'),
	 ('precificação seção produto','https://www.youtube.com/watch?v=Te2iH3OtWJU&ab_channel=IracyDias','https://www.youtube.com/watch?v=Te2iH3OtWJU&ab_channel=IracyDias'),
	 ('Nota fiscal de perda','https://www.youtube.com/watch?v=qyTjBm4e2rk','https://www.youtube.com/watch?v=qyTjBm4e2rk');
INSERT INTO "videosYoutube".videosyoutube (nome,nome_site,link) VALUES
	 ('lançamento caixa - prevenda','https://www.youtube.com/watch?v=BIqs8SBtVmA&ab_channel=IracyDias','https://www.youtube.com/watch?v=BIqs8SBtVmA&ab_channel=IracyDias');
INSERT INTO "linkUteis".linkuteis (nome,nome_site,link) VALUES
	 ('Universidade InovaFarma','https://universidade.inovafarma.com.br/','https://universidade.inovafarma.com.br/'),
	 ('FSist','https://www.fsist.com.br/','https://www.fsist.com.br/'),
	 ('Portal da Nota Fiscal Eletrônica','https://dfe-portal.svrs.rs.gov.br/','https://dfe-portal.svrs.rs.gov.br/'),
	 ('Consulta NFe','http://www.nfe.fazenda.gov.br','http://www.nfe.fazenda.gov.br'),
	 ('Base de Conhecimento','conhecimento.inovafarma.com.br','https://conhecimento.atlassian.net/wiki/spaces/BDC/overview'),
	 ('Contagem Estoque','https://play.google.com/store','https://play.google.com/store/apps/details?id=com.solut.contagemestoque'),
	 ('anydesk versão antiga','','https://mega.nz/file/olwgzZqA#DBqn3tvEU2RbXWi-pakhYtk_Taj7OEY_S-m5zLT_JDk');
