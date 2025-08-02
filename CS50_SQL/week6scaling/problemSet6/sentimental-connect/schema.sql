CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    `year` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business'),
    `location` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `connections` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `school_id` INT UNSIGNED,
    `company_id` INT UNSIGNED,
    `school_start` DATE NOT NULL ,
    `school_end` DATE NOT NULL ,
    `degree` ENUM(
        'AA',
        'AS',
        'BA',
        'BS',
        'BaSC',
        'BENG',
        'MD',
        'JD',
        'MA',
        'MS',
        'PhD'
    ) NOT NULL,
    `company_start` DATE NOT NULL ,
    `company_end` DATE NOT NULL ,
    `title` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);