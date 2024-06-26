CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
INT) RETURNS INT AS
$$
BEGIN
RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;


-- DO $$
-- DECLARE
-- 	valor INT;
-- BEGIN
-- 	valor := valor_aleatorio_entre(1, 100);
-- 	RAISE NOTICE 'O valor gerado é: %', valor;
-- 	IF valor <= 20 THEN
-- 	RAISE NOTICE 'A metade do valor % é %', valor, valor / 2::FLOAT;
-- 	END IF;
-- END;
-- $$

--1.1 Faça um programa que exibe se um número inteiro é múltiplo de 3.
-- Com IF
DO $$
DECLARE
valor INT;
BEGIN
	valor := valor_aleatorio_entre(1,99);
	RAISE NOTICE 'O valor gerado é: %', valor;
	IF valor % 3 = 0 THEN
		RAISE NOTICE 'O valor gerado é: % é um múltiplo de 3', valor;
	ELSE
		RAISE NOTICE 'O valor gerado é: %, não é multiplo de 3', valor;
	END IF;
END;
$$
-- Com CASE
DO $$
DECLARE
valor INT;
BEGIN
	valor := valor_aleatorio_entre(1,99);
	RAISE NOTICE 'O valor gerado é: %', valor;
	CASE 
		WHEN valor % 3 = 0 THEN 
		RAISE NOTICE 'O valor gerado é: % é um múltiplo de 3', valor;
	ELSE
		RAISE NOTICE 'O valor gerado é: %, não é multiplo de 3', valor;
	END CASE;
END;
$$


--1.2 Faça um programa que exibe se um número inteiro é múltiplo de 3 ou de 5.
-- Com IF
DO $$
DECLARE
valor INT;
BEGIN
	valor := valor_aleatorio_entre(1,99);
	RAISE NOTICE 'O valor gerado é: %', valor;
	IF valor % 3 = 0 OR valor % 5 = 0 THEN
		IF valor % 5 = 0 THEN
		RAISE NOTICE 'O valor gerado é: %, é multiplo de 5', valor;
		ELSIF valor % 3 = 0 THEN
			RAISE NOTICE 'O valor gerado é: %, é multiplo de 3', valor;
		ELSIF valor % 3 = 0 AND valor % 5 = 0 THEN
			RAISE NOTICE 'O valor gerado é: %, e é multiplo de 3 e de 5', valor;
		END IF;
	ELSE
		RAISE NOTICE 'O valor gerado é: %, não é multiplo de 3 nem de 5', valor;
	END IF;
END;
$$

-- Com case
DO $$
DECLARE
valor INT;
BEGIN
	valor := valor_aleatorio_entre(1,99);
	RAISE NOTICE 'O valor gerado é: %', valor;
	CASE 
		WHEN valor % 3 = 0 THEN 
			RAISE NOTICE 'O valor gerado é: % é um múltiplo de 3', valor;
		WHEN valor % 5 = 0 THEN
			RAISE NOTICE 'O valor gerado é: %, é multiplo de 5', valor;
		WHEN valor % 5 = 0 and valor % 3 = 0 THEN
			RAISE NOTICE 'O valor gerado é: %, é multiplo de 5 e de 3', valor;
			
	ELSE
		RAISE NOTICE 'O valor gerado é: %, não é multiplo de 3, nem de 5', valor;
	END CASE;
END;
$$

-- 1.3 Faça um programa que opera de acordo com o seguinte menu.
-- Opções:
-- 1 - Soma
-- 2 - Subtração
-- 3 - Multiplicação
-- 4 - Divisão
-- Cada operação envolve dois números inteiros. O resultado deve ser exibido no formato
-- op1 op op2 = res

-- Com if
DO $$
DECLARE
valor1 INT;
valor2 INT;
opcao INT := 0;
BEGIN
	valor1 := valor_aleatorio_entre(1,99);
	valor2 := valor_aleatorio_entre(1,99);
	RAISE NOTICE 'Dentre as opções:';
	RAISE NOTICE '
	1 - Soma
	2 - Subtração
	3 - Multiplicação
	4 - Divisão
';
	opcao = opcao + 1;
	IF opcao = 1 THEN
		RAISE NOTICE '% + % = %', valor1, valor2, valor1 + valor2;
	opcao = opcao + 1;
	END IF;
	IF opcao = 2 THEN
		RAISE NOTICE '% - % = %', valor1, valor2, valor1 - valor2;
	END IF;
	opcao = opcao + 1;
	IF opcao = 3 THEN
		RAISE NOTICE '% * % = %', valor1, valor2, valor1 * valor2;
	opcao = opcao + 1;
	END IF;
	IF opcao = 4 THEN
		RAISE NOTICE '% / % = %', valor1, valor2, valor1 / valor2;
	END IF;
END;
$$
-- Com case
DO $$
DECLARE
    valor1 INT;
    valor2 INT;
    opcao INT := 0;
BEGIN
    valor1 := valor_aleatorio_entre(1,99);
    valor2 := valor_aleatorio_entre(1,99);
    RAISE NOTICE 'Dentre as opções:';
    RAISE NOTICE '
    1 - Soma
    2 - Subtração
    3 - Multiplicação
    4 - Divisão
    ';
	
    opcao := opcao + 1;
	CASE opcao
        WHEN 1 THEN
            RAISE NOTICE '% + % = %', valor1, valor2, valor1 + valor2;
		END CASE;
    opcao := opcao + 1;
	CASE opcao
        WHEN 2 THEN
            RAISE NOTICE '% - % = %', valor1, valor2, valor1 - valor2;
		END CASE;
    opcao := opcao + 1;
	CASE opcao
        WHEN 3 THEN
            RAISE NOTICE '% * % = %', valor1, valor2, valor1 * valor2;
		END CASE;
    opcao := opcao + 1;
	CASE opcao
        WHEN 4 THEN
            RAISE NOTICE '% / % = %', valor1, valor2, valor1 / valor2;
    ELSE
            RAISE NOTICE 'Opção inválida';
    END CASE;
END;
$$;

-- 1.4 Um comerciante comprou um produto e quer vendê-lo com um lucro de 45% se o valor
--da compra for menor que R$20. Caso contrário, ele deseja lucro de 30%. Faça um
--programa que, dado o valor do produto, calcula o valor de venda.

-- COM IF
DO $$
DECLARE
valor INT;
lucro INT;
BEGIN
	valor := valor_aleatorio_entre(10, 30);
	IF valor >= 20 THEN 
		lucro := valor * 0.3;
		RAISE NOTICE 'como o valor da venda foi % o lucro do vendedor foi %', valor, valor + lucro;
	ELSE
		lucro := valor * 0.45;
		RAISE NOTICE 'como o valor da venda foi % o lucro do vendedor foi %', valor, valor + lucro;
	END IF;
END;
$$

-- COM CASE
DO $$
DECLARE
valor INT;
lucro INT;
BEGIN
	valor := valor_aleatorio_entre(10, 30);
	CASE 
		WHEN valor BETWEEN 20 AND 30 THEN 
			lucro := valor * 0.3;
			RAISE NOTICE 'como o valor da venda foi % o lucro do vendedor foi %', valor, valor + lucro;
	ELSE
		lucro := valor * 0.45;
		RAISE NOTICE 'como o valor da venda foi % o lucro do vendedor foi %', valor, valor + lucro;
	END CASE;
END;
$$
-- 1.5 Resolva o problema disponível no link a seguir.
-- COM IF
DO $$
DECLARE
salario NUMERIC(10, 2);
BEGIN
	salario := valor_aleatorio_entre(0, 4000);
	IF salario <= 400 THEN
		RAISE NOTICE 'o salario que era % recebeu um aumento de 15/100 e ficou %', salario, salario + (salario * 0.15);
	ELSIF salario > 400 AND salario <= 800 THEN
		RAISE NOTICE 'o salario que era % recebeu um aumento de 12/100 e ficou %', salario, salario + (salario * 0.12);
	ELSIF salario > 800 AND salario <= 1200 THEN
		RAISE NOTICE 'o salario que era % recebeu um aumento de 10/100 e ficou %', salario, salario + (salario * 0.10);
	ELSIF salario > 1200 AND salario <= 2000 THEN
		RAISE NOTICE 'o salario que era % recebeu um aumento de 7/100 e ficou %', salario, salario + (salario * 0.07);
	ELSE
		RAISE NOTICE 'o salario que era % recebeu um aumento de 4/100 e ficou %', salario, salario + (salario * 0.04);
	END IF;
END;
$$
-- COM CASE
DO $$
DECLARE
salario NUMERIC(10, 2);
BEGIN
	salario := valor_aleatorio_entre(0, 4000);
	CASE 
		WHEN salario BETWEEN 0 AND 400 THEN
			RAISE NOTICE 'o salario que era % recebeu um aumento de 15/100 e ficou %', salario, salario + (salario * 0.15);
		WHEN salario BETWEEN 400.01 AND 800 THEN
			RAISE NOTICE 'o salario que era % recebeu um aumento de 12/100 e ficou %', salario, salario + (salario * 0.12);
		WHEN salario BETWEEN 800.01 AND 1200 THEN
			RAISE NOTICE 'o salario que era % recebeu um aumento de 10/100 e ficou %', salario, salario + (salario * 0.10);
		WHEN salario BETWEEN 1200.01 AND 2000 THEN
			RAISE NOTICE 'o salario que era % recebeu um aumento de 7/100 e ficou %', salario, salario + (salario * 0.07);
		ELSE
			RAISE NOTICE 'o salario que era % recebeu um aumento de 4/100 e ficou %', salario, salario + (salario * 0.04);
	END CASE;
END;
$$
