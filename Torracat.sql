-- Drop tables 
DROP TABLE clue;
DROP TABLE sql_challenge;
DROP TABLE inventory;
DROP TABLE item;
DROP TABLE door;
DROP TABLE room;

-- Create ROOM table
CREATE TABLE ROOM (
    room_id NUMBER PRIMARY KEY,
    room_name VARCHAR2(50) NOT NULL,
    room_description VARCHAR2(500) NOT NULL
);

-- Create CLUE table
CREATE TABLE CLUE (
    clue_id NUMBER PRIMARY KEY,
    clue_text VARCHAR2(500) NOT NULL,
    clue_location VARCHAR2(50) NOT NULL
);

-- Create SQL_CHALLENGE table
CREATE TABLE SQL_CHALLENGE (
    challenge_id NUMBER PRIMARY KEY,
    challenge_text VARCHAR2(500) NOT NULL,
    challenge_solution VARCHAR2(500) NOT NULL,
    challenge_difficulty NUMBER NOT NULL
);

-- Create ITEM table
CREATE TABLE ITEM (
    item_id NUMBER PRIMARY KEY,
    item_name VARCHAR2(50) NOT NULL,
    item_description VARCHAR2(500) NOT NULL
);

-- Create INVENTORY table
CREATE TABLE INVENTORY (
    inventory_id NUMBER PRIMARY KEY,
    room_id NUMBER NOT NULL,
    item_id NUMBER NOT NULL,
    CONSTRAINT fk_inventory_room FOREIGN KEY (room_id) REFERENCES ROOM(room_id),
    CONSTRAINT fk_inventory_item FOREIGN KEY (item_id) REFERENCES ITEM(item_id)
);

-- Create DOOR table
CREATE TABLE DOOR (
    door_id NUMBER PRIMARY KEY,
    room_id_in NUMBER NOT NULL,
    room_id_out NUMBER NOT NULL,
    is_locked CHAR(1) DEFAULT 'Y' CHECK (is_locked IN ('Y', 'N')),
    CONSTRAINT fk_door_room_in FOREIGN KEY (room_id_in) REFERENCES ROOM(room_id),
    CONSTRAINT fk_door_room_out FOREIGN KEY (room_id_out) REFERENCES ROOM(room_id)
);


-- Populate ROOM table
INSERT INTO ROOM (room_id, room_name, room_description) VALUES (1, 'Foyer', 'A large, dimly lit entryway with a grand staircase leading upstairs. Cobwebs cling to the corners of the room.');
INSERT INTO ROOM (room_id, room_name, room_description) VALUES (2, 'Parlor', 'An old, musty sitting room with overstuffed chairs and a crackling fireplace. The air is thick with the scent of decaying wood.');
INSERT INTO ROOM (room_id, room_name, room_description) VALUES (3, 'Conservatory', 'A glass-enclosed room filled with withered plants and vines. The shadows cast by the moonlight outside give the room an eerie, otherworldly feel.');
INSERT INTO ROOM (room_id, room_name, room_description) VALUES (4, 'Kitchen', 'A large, industrial-style kitchen with rusting appliances and a broken chandelier overhead. The sound of dripping water echoes through the room.');
INSERT INTO ROOM (room_id, room_name, room_description) VALUES (5, 'Ballroom', 'A grand, ornate ballroom with a high, vaulted ceiling. The floor is covered in a thick layer of dust, and the air is stale and musty.');
INSERT INTO ROOM (room_id, room_name, room_description) VALUES (6, 'Attic', 'A cramped, dimly lit attic filled with old trunks, broken furniture, and cobwebs. The sound of scurrying rats can be heard in the shadows.');
INSERT INTO ROOM (room_id, room_name, room_description) VALUES (7, 'Cellar', 'A damp, dark cellar with a flickering light bulb. The walls are lined with dusty wine racks and the air is thick with the smell of mold.');
INSERT INTO ROOM (room_id, room_name, room_description) VALUES (8, 'Library', 'A large, ornate library with towering bookshelves and a rolling ladder. The books are covered in a thick layer of dust, and the room is eerily quiet.');

-- Populate CLUE table
INSERT INTO CLUE (clue_id, clue_text, clue_location) VALUES (1, 'Your escape is closer, but you need to look in the kitchen.  ' || 
               'The kitchen is very dark and filled with creepy things so you will need an item available in this room to help with this.  Your inventory list can help you see what is available in this room.  ' ||
			   'What item (name) should you bring to the kitchen?', 'Conservatory');
INSERT INTO CLUE (clue_id, clue_text, clue_location) VALUES (2, 'An old family portrait holds a secret message.', 'Parlor');
INSERT INTO CLUE (clue_id, clue_text, clue_location) VALUES (3, 'The answer to the SQL challenge lies in the cellar.', 'Cellar');
INSERT INTO CLUE (clue_id, clue_text, clue_location) VALUES (4, 'To escape, you must first solve the mystery of the haunted ballroom.', 'Ballroom');
INSERT INTO CLUE (clue_id, clue_text, clue_location) VALUES (5, 'The restless spirits of Pumpkin Manor hold the key to your freedom.', 'Attic');

-- Populate ITEM table
INSERT INTO ITEM (item_id, item_name, item_description) VALUES (1, 'Rusty Key', 'An old, tarnished key that looks like it might open something.');
INSERT INTO ITEM (item_id, item_name, item_description) VALUES (2, 'Torn Page', 'A partially burned page from an old book, with faded text.');
INSERT INTO ITEM (item_id, item_name, item_description) VALUES (3, 'Broken Lantern', 'A lantern with a cracked glass panel and a flickering flame.');
INSERT INTO ITEM (item_id, item_name, item_description) VALUES (4, 'Moldy Tome', 'A musty, water-damaged book with illegible text.');
INSERT INTO ITEM (item_id, item_name, item_description) VALUES (5, 'Rusted Locket', 'A tarnished locket with a faint engraving on the back.');
INSERT INTO ITEM (item_id, item_name, item_description) VALUES (6, 'Dusty Photograph', 'A faded, sepia-toned photograph of a family in an old-fashioned pose.');
INSERT INTO ITEM (item_id, item_name, item_description) VALUES (7, 'Crumbling Scroll', 'A fragile, yellowed scroll with indecipherable writing.');

-- Populate INVENTORY table
INSERT INTO INVENTORY (inventory_id, room_id, item_id) VALUES (1, 1, 7);
INSERT INTO INVENTORY (inventory_id, room_id, item_id) VALUES (2, 7, 2);
INSERT INTO INVENTORY (inventory_id, room_id, item_id) VALUES (3, 3, 3);
INSERT INTO INVENTORY (inventory_id, room_id, item_id) VALUES (4, 2, 2);
INSERT INTO INVENTORY (inventory_id, room_id, item_id) VALUES (5, 3, 5);
INSERT INTO INVENTORY (inventory_id, room_id, item_id) VALUES (6, 7, 6);
INSERT INTO INVENTORY (inventory_id, room_id, item_id) VALUES (7, 7, 7);


COMMIT;

