

spool c:/dev/sait/db/create_vod_tables_output.txt;
set echo on;

-- Delete every bridge tables first
DROP TABLE VOD_RENTAL_MOVIE PURGE;
DROP TABLE VOD_WISHLIST_MOVIE PURGE;
DROP TABLE VOD_ADVISORY_MOVIE PURGE;
DROP TABLE VOD_CATEGORY_MOVIE PURGE;
DROP TABLE VOD_ACTOR_MOVIE PURGE;
DROP TABLE VOD_DIRECTOR_MOVIE PURGE;

-- delete left tables
DROP TABLE VOD_RENTAL PURGE;
DROP TABLE VOD_WISHLIST PURGE;
DROP TABLE VOD_CUSTOMER PURGE;
DROP TABLE VOD_MOVIE PURGE;
DROP TABLE VOD_RATING PURGE;
DROP TABLE VOD_ADVISORY PURGE;
DROP TABLE VOD_CATEGORY PURGE;
DROP TABLE VOD_ACTOR PURGE;
DROP TABLE VOD_DIRECTOR PURGE;


-- create parents tables first

-- VOD_CUSTOMER
CREATE TABLE VOD_CUSTOMER (
    customer_id NUMBER NOT NULL,
    first_name VARCHAR2(50) NOT NULL ,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL CONSTRAINT sys_customer_email_UK UNIQUE,
    credit_card_num NUMBER,
    credit_card_type CHAR(2) CHECK (credit_card_type IN ('AX', 'MC', 'VS')),
    address_province CHAR(2),
    address_city VARCHAR2(50),
    address_street VARCHAR2(150),
    address_extra VARCHAR2(150),
    postal_code CHAR(6) CHECK (REGEXP_LIKE(postal_code, '[A-Z][0-9][A-Z][0-9][A-Z][0-9]')),
    is_email_valid NUMBER NOT NULL CHECK (is_email_valid IN (0, 1)),
    phone CHAR(12) NOT NULL CHECK (REGEXP_LIKE(phone, '^([0-9]{3})\.([0-9]{3})\.([0-9]{4})$')),
    CONSTRAINT sys_customer_PK PRIMARY KEY (customer_id)
);

-- VOD_RENTAL
CREATE TABLE VOD_RENTAL (
    rental_id NUMBER NOT NULL,
    customer_id NUMBER NOT NULL ,
    customer_rating NUMBER(1) CHECK (customer_rating BETWEEN 1 and 5),
    rented_date DATE NOT NULL,
    viewing_date DATE,
    expiry_date DATE,
    credit_card_num NUMBER NOT NULL,
    credit_card_type CHAR(2) NOT NULL CHECK (credit_card_type in ('AX', 'MC', 'VS')),
    paid_price NUMBER NOT NULL,
    CONSTRAINT sys_rental_viewing_date_CK CHECK (viewing_date > rented_date),
    CONSTRAINT sys_rental_expiry_date_CK CHECK (expiry_date > viewing_date),
    CONSTRAINT sys_cust_rent_FK FOREIGN KEY (customer_id) REFERENCES VOD_CUSTOMER (customer_id),
    CONSTRAINT sys_rental_PK PRIMARY KEY (rental_id)
);

-- VOD_WISHLIST
CREATE TABLE VOD_WISHLIST (
    wishlist_id NUMBER NOT NULL,
    customer_id NUMBER NOT NULL,
    CONSTRAINT sys_cust_wish_FK FOREIGN KEY (customer_id) REFERENCES VOD_CUSTOMER (customer_id),
    CONSTRAINT sys_wishlist_PK PRIMARY KEY (wishlist_id)
);

-- VOD_RATING
CREATE TABLE VOD_RATING (
    rating_id NUMBER NOT NULL,
    rating_name CHAR(5) NOT NULL,
    CONSTRAINT sys_rating_PK PRIMARY KEY (rating_id)
);

-- VOD_ADVISORY
CREATE TABLE VOD_ADVISORY (
    advisory_id NUMBER NOT NULL,
    short_desc VARCHAR2(30) NOT NULL,
    full_desc VARCHAR2(300) NOT NULL,
    CONSTRAINT sys_advisory_PK PRIMARY KEY (advisory_id)
);

-- VOD_CATEGORY
CREATE TABLE VOD_CATEGORY (
    category_id NUMBER NOT NULL,
    parent_category_id NUMBER NOT NULL,
    category_name VARCHAR2(100) NOT NULL,
    CONSTRAINT sys_cate_cate_FK FOREIGN KEY (parent_category_id)
        REFERENCES VOD_CATEGORY (category_id)
            ON DELETE CASCADE,
    CONSTRAINT sys_category_PK PRIMARY KEY (category_id)
);

-- VOD_ACTOR
CREATE TABLE VOD_ACTOR (
    actor_id NUMBER NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR2(100) NOT NULL CONSTRAINT sys_actor_email_UK UNIQUE,
    CONSTRAINT sys_actor_PK PRIMARY KEY (actor_id)
);

-- VOD_DIRECTOR
CREATE TABLE VOD_DIRECTOR (
    director_id NUMBER NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR2(100) NOT NULL CONSTRAINT sys_director_email_UK UNIQUE,
    CONSTRAINT sys_director_PK PRIMARY KEY (director_id)
);

-- VOD_MOVIE
CREATE TABLE VOD_MOVIE (
    movie_id NUMBER NOT NULL,
    rating_id NUMBER NOT NULL,
    title VARCHAR2(250) NOT NULL,
    duration NUMBER NOT NULL CHECK (duration > 0),
    is_new_released NUMBER(1) CHECK (is_new_released in (0, 1)),
    is_most_popular NUMBER(1) CHECK (is_most_popular in (0, 1)),
    is_coming_soon NUMBER(1) CHECK (is_coming_soon in (0, 1)),
    hd_price NUMBER NOT NULL,
    sd_price NUMBER NOT NULL,
    CONSTRAINT sys_rating_movie_FK FOREIGN KEY (rating_id) REFERENCES VOD_RATING (rating_id),
    CONSTRAINT sys_movie_PK PRIMARY KEY (movie_id)
);

-- VOD_RENTAL_MOVIE
CREATE TABLE VOD_RENTAL_MOVIE (
    rental_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL,
    CONSTRAINT sys_rent_re_mv_FK FOREIGN KEY (rental_id) REFERENCES VOD_RENTAL (rental_id),
    CONSTRAINT sys_movie_re_mv_FK FOREIGN KEY (movie_id) REFERENCES VOD_MOVIE (movie_id),
    CONSTRAINT sys_rental_movie_PK PRIMARY KEY (rental_id, movie_id)
);

-- VOD_WISHLIST_MOVIE
CREATE TABLE VOD_WISHLIST_MOVIE (
    wishlist_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL,
    added_date DATE NOT NULL,
    CONSTRAINT sys_wish_ws_mv_FK FOREIGN KEY (wishlist_id) REFERENCES VOD_WISHLIST (wishlist_id),
    CONSTRAINT sys_movie_ws_mv_FK FOREIGN KEY (movie_id) REFERENCES VOD_MOVIE (movie_id),
    CONSTRAINT sys_wishlist_movie_PK PRIMARY KEY (wishlist_id, movie_id)
);

-- VOD_ADVISORY_MOVIE
CREATE TABLE VOD_ADVISORY_MOVIE (
    advisory_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL,
    CONSTRAINT sys_advisory_ad_mv_FK FOREIGN KEY (advisory_id) REFERENCES VOD_ADVISORY (advisory_id),
    CONSTRAINT sys_movie_ad_mv_FK FOREIGN KEY (movie_id) REFERENCES VOD_MOVIE (movie_id),
    CONSTRAINT sys_advisory_movie_PK PRIMARY KEY (advisory_id, movie_id)
);

-- VOD_CATEGORY_MOVIE
CREATE TABLE VOD_CATEGORY_MOVIE (
    category_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL,
    CONSTRAINT sys_cate_ct_mv_FK FOREIGN KEY (category_id) REFERENCES VOD_CATEGORY (category_id),
    CONSTRAINT sys_movie_ct_mv_FK FOREIGN KEY (movie_id) REFERENCES VOD_MOVIE (movie_id),
    CONSTRAINT sys_category_movie_PK PRIMARY KEY (category_id, movie_id)
);

-- VOD_ACTOR_MOVIE
CREATE TABLE VOD_ACTOR_MOVIE (
    actor_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL,
    role_name VARCHAR2(50) NOT NULL,
    CONSTRAINT sys_actor_at_mv_FK FOREIGN KEY (actor_id) REFERENCES VOD_ACTOR (actor_id),
    CONSTRAINT sys_movie_at_mv_FK FOREIGN KEY (movie_id) REFERENCES VOD_MOVIE (movie_id),
    CONSTRAINT sys_actor_movie PRIMARY KEY (actor_id, movie_id, role_name)
);

-- VOD_DIRECTOR_MOVIE
CREATE TABLE VOD_DIRECTOR_MOVIE (
    director_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL,
    CONSTRAINT sys_director_dr_mv_FK FOREIGN KEY (director_id) REFERENCES VOD_DIRECTOR (director_id),
    CONSTRAINT sys_movie_dr_mv_FK FOREIGN KEY (movie_id) REFERENCES VOD_MOVIE (movie_id),
    CONSTRAINT sys_director_movie_PK PRIMARY KEY (director_id, movie_id)
);

spool off;