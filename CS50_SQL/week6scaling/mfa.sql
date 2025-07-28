-- Drop existing tables if needed (for clean reruns)
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS created;
DROP TABLE IF EXISTS collections;
DROP TABLE IF EXISTS artists;
-- Table: artists
CREATE TABLE artists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
INSERT INTO artists (id, name)
VALUES (1, 'Li Yin'),
    (2, 'Qian Weicheng'),
    (3, 'Unidentified artist'),
    (4, 'Zhou Chen');
-- Table: collections
CREATE TABLE collections (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    accession_number VARCHAR(50) NOT NULL UNIQUE,
    acquired DATE,
    deleted TINYINT DEFAULT 0
);
INSERT INTO collections (id, title, accession_number, acquired, deleted)
VALUES (
        1,
        'Farmers working at dawn',
        '11.6152',
        '1911-08-03',
        1
    ),
    (2, 'Imaginative landscape', '56.496', NULL, 0),
    (4, 'Spring Outing', '14.76', '1914-01-08', 0),
    (
        5,
        'Peonies and Butterfly',
        '06.1899',
        '1906-01-01',
        0
    ),
    (
        6,
        'Profusion of flower',
        '56.247',
        '1956-04-12',
        0
    );
-- Table: created
CREATE TABLE created (
    artist_id INT,
    collection_id INT,
    PRIMARY KEY (artist_id, collection_id),
    FOREIGN KEY (artist_id) REFERENCES artists(id) ON DELETE CASCADE,
    FOREIGN KEY (collection_id) REFERENCES collections(id) ON DELETE CASCADE
);
INSERT INTO created (artist_id, collection_id)
VALUES (1, 2),
    (2, 3),
    -- Be careful: collection_id 3 does not exist above (may cause FK error)
    (1, 1),
    (4, 4);
-- Table: transactions
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    action VARCHAR(20)
);
-- Triggers: requires delimiter for multi-statement
DELIMITER $$

CREATE TRIGGER sell
BEFORE DELETE ON collections
FOR EACH ROW
BEGIN
    INSERT INTO transactions (title, action)
    VALUES (OLD.title, 'sold');
END$$

CREATE TRIGGER buy
AFTER INSERT ON collections
FOR EACH ROW
BEGIN
    INSERT INTO transactions (title, action)
    VALUES (NEW.title, 'bought');
END$$

DELIMITER ;
