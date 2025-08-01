-- mysql -u root -P 3307 -p
-- Enter password: 

CREATE USER 'yusuftest' IDENTIFIED BY 'password';
exit;
mysql -u yusuftest -h 127.0.0.1 -P 3307 -p 

GRANT SELECT ON `rideshare`.`analysis` to yusuftest;
