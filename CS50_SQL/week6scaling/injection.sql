-- INJECTIONS
SELECT `id`
FROM `users`
WHERE `username` = 'Carter'
    AND `password` = 'password'
    OR '1' = '1';
-- Always true
SELECT `balance`
FROM `accounts`
WHERE `id` = 123456789
UNION
SELECT `id`
FROM `accounts`;
-- PREPARED STATEMENTS

PREPARE `balance_check`
FROM
'SELECT *
FROM `accounts`
WHERE `id` = ?';

SET @id = 1;

EXECUTE `balance_check` USING @id;