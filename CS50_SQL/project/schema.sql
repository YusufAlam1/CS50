CREATE TABLE `users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `profile_picture` VARCHAR(255) DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uniq_users_username` (`username`),
  UNIQUE KEY `uniq_users_email` (`email`)
);

CREATE TABLE `car_makes` (
  `make_id` INT NOT NULL AUTO_INCREMENT,
  `make_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`make_id`),
  UNIQUE KEY `uniq_car_makes_name` (`make_name`)
);

CREATE TABLE `car_models` (
  `model_id` INT NOT NULL AUTO_INCREMENT,
  `make_id` INT NOT NULL,
  `model_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `uniq_car_models_name` (`model_name`),
  CONSTRAINT `fk_car_models_make`
    FOREIGN KEY (`make_id`) REFERENCES `car_makes` (`make_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE `car_fuels` (
  `fuel_id` INT NOT NULL AUTO_INCREMENT,
  `fuel_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`fuel_id`),
  UNIQUE KEY `uniq_car_fuels_name` (`fuel_name`)
);

CREATE TABLE `car_transmissions` (
  `transmission_id` INT NOT NULL AUTO_INCREMENT,
  `transmission_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`transmission_id`),
  UNIQUE KEY `uniq_car_transmissions_name` (`transmission_name`)
);

CREATE TABLE `listings` (
  `listing_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `model_id` INT NOT NULL,
  `fuel_id` INT NOT NULL,
  `transmission_id` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT DEFAULT NULL,
  `year` YEAR NOT NULL,
  `color` VARCHAR(50) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `mileage` INT NOT NULL,
  `province` VARCHAR(10) DEFAULT NULL,
  `city` VARCHAR(100) DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`listing_id`),
  CONSTRAINT `fk_listings_user`
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT `fk_listings_model`
    FOREIGN KEY (`model_id`) REFERENCES `car_models` (`model_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT `fk_listings_fuel`
    FOREIGN KEY (`fuel_id`) REFERENCES `car_fuels` (`fuel_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT `fk_listings_transmission`
    FOREIGN KEY (`transmission_id`) REFERENCES `car_transmissions` (`transmission_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE `listing_images` (
  `image_id` INT NOT NULL AUTO_INCREMENT,
  `listing_id` INT NOT NULL,
  `image_path` VARCHAR(255) NOT NULL,
  `uploaded_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `is_primary` TINYINT(1) DEFAULT 0,
  PRIMARY KEY (`image_id`),
  CONSTRAINT `fk_listing_images_listing`
    FOREIGN KEY (`listing_id`) REFERENCES `listings` (`listing_id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
