SELECT *
FROM desi_loja.consumidor
WHERE primeiro_nome REGEXP 'elke|irene';

SELECT *
FROM desi_loja.consumidor
WHERE sobrenome REGEXP 'di$|do$';

SELECT *
FROM desi_loja.consumidor
WHERE sobrenome REGEXP '^r|^ey';

SELECT *
FROM desi_loja.consumidor
WHERE sobrenome REGEXP 'b[oe]';
