select CLUE_TEXT, CLUE_LOCATION from CLUE WHERE CLUE_ID = 1;
SELECT * FROM ROOM;
select * from ITEM;
SELECT * FROM INVENTORY;

DELETE FROM INVENTORY WHERE ITEM_ID = (
SELECT ITEM_ID FROM ITEM WHERE ITEM_name LIKE '%Scroll%');

select ITEM_ID, ITEM.ITEM_NAME, substr2(ITEM_DESCRIPTION, 37, 4) from item;
