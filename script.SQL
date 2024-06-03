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


