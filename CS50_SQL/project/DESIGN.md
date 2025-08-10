# Design Document

By Yusuf Alam

Video overview: <URL HERE>

## Scope

**Purpose**
The purpose of this database is to serve as the backend for a car listing platform called FastFahr focused strictly on German vehicles. The platform enables users to browse, search, and post car listings, bookmark listings, and communicate with other users.

**Elements That Will be Included (In-Scope)**
* Registered users
* Car listings
    * Car metadata (make, model, fueltype, etc.)
* Car listing image(s)
* User-to-user messages
* Bookmarks

**Elements That Will NOT be Included (Out-of-Scope)**
* Payment transactions
* Vehice Identification Number (VIN)
* For simplicity: Non-German makes will not be included

## Functional Requirements

**Functionalities That Will be Included (In-Scope)**
* CRUD operations for user accountso90
* Creation and retrieval of car listings with normalized metadata
* Adding and removing images to listings
* Filtering/searching listings by make, model, fuel, price, etc.
* Bookmarking listings
* Sending and receiving messages

**Functionalities That Will NOT be Included (Out-of-Scope)**
* Real-time messaging
* Advanced recommendation or personalization features
* Admin moderation of content
* Push/email notifications

## Representation

Entities are captured in MySQL tables with the following schema.

### Entities

The database includes the following entities:

#### Users

Table to keep track of basic user data `users` includes:

* `user_id`, which specifies the unique ID for the user as an `INT`. This column has the `PRIMARY KEY` and `AUTO_INCREMENT` constraints applied.
* `username`, which specifies the user's unique name as a `VARCHAR(50)`. This column has the `UNIQUE` and `NOT NULL` constraints.
* `email`, which specifies the user’s email address as a `VARCHAR(100)`, also marked `UNIQUE` and `NOT NULL` to ensure no duplicates.
* `password`, which stores the securely hashed password of the user as a `VARCHAR(255)`, using `NOT NULL`.
* `profile_picture`, which is a `VARCHAR(255)` representing the file path or URL of the user’s profile picture. This column is optional and a default pfp will be used if not chosen.
* `created_at`, which records when the user registered, stored as a `DATETIME` with the default value `CURRENT_TIMESTAMP`.

---

#### Car Makes

Putting an id for each valid German make, `car_makes` includes:

* `make_id`, which serves as the primary key for each car brand, represented as an `INT` with `AUTO_INCREMENT`.
* `make_name`, which stores the car manufacturer’s name as a `VARCHAR(50)` and is constrained to be `UNIQUE` and `NOT NULL`.

---

#### Car Models

Associated a given model with a make, `car_models` includes:

* `model_id`, which uniquely identifies each model as an `INT` with `AUTO_INCREMENT`.
* `make_id`, which links the model to a car brand using a foreign key to `car_makes(make_id)`.
* `model_name`, which specifies the model name as a `VARCHAR(50)`, constrained to be `UNIQUE` and `NOT NULL`.

---

#### Car Fuels

Putting specific fuel types in its own table to reduce name duplication, `car_fuels` includes:

* `fuel_id`, which is the primary key (`INT AUTO_INCREMENT`).
* `fuel_name`, which specifies the fuel type as a `VARCHAR(50)`, constrained to be `UNIQUE` and `NOT NULL`.

---

#### Car Transmissions

Similar to `car_fuels`, this table also aims to reduce name duplication, `car_transmission` includes:

* `transmission_id`, an `INT` used as the primary key.
* `transmission_name`, a `VARCHAR(50)` representing the type of transmission, marked `UNIQUE` and `NOT NULL`.

---

#### Listings

Where all the info about a certain car listing is stored, `listings` includes:

* `listing_id`, which uniquely identifies each listing as an `INT` with `AUTO_INCREMENT`.
* `user_id`, which is a foreign key to the `users` table identifying the seller.
* `model_id`, `fuel_id`, and `transmission_id`, which are foreign keys referencing `car_models`, `car_fuels`, and `car_transmissions`, respectively.
* `title`, a short `VARCHAR(100)` headline for the listing, marked `NOT NULL`.
* `description`, which allows long-form car details, stored as `TEXT`.
* `year`, stored as a `YEAR` to represent the car’s production year.
* `color`, a `VARCHAR(50)` indicating the car’s exterior color.
* `price`, a `DECIMAL(10,2)` representing the car's listed price.
* `mileage`, an `INT` to represent distance driven (in kilometers).
* `province`, a `VARCHAR(10)` and `city`, a `VARCHAR(100)`, representing location.
* `created_at`, a `DATETIME` set to default to `CURRENT_TIMESTAMP`.

---

#### Listing Images

The `listing_images` table includes:

* `image_id`, which serves as the primary key, using `INT AUTO_INCREMENT`.
* `listing_id`, a foreign key to the associated `listings` record.
* `image_path`, stored as a `VARCHAR(255)`, referencing the file path or URL to the image.
* `uploaded_at`, a `DATETIME` field defaulted to `CURRENT_TIMESTAMP`.
* `is_primary`, a `TINYINT(1)` field used as a boolean flag (`0` or `1`) to denote the main display image for a listing.

---

### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
* What might your database not be able to represent very well?
