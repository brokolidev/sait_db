DROP TABLE mm_return;

CREATE TABLE mm_return
	(movie_title VARCHAR(40),
	 member_ID NUMBER(4));

-- hardcoding some movie returns, in a real application - these may come from a UI
INSERT INTO mm_return
	VALUES ('Star Wars', 13);
INSERT INTO mm_return
	VALUES ('Deep Blue Sea', 13);
INSERT INTO mm_return
	VALUES ('Jaws', 13);
INSERT INTO mm_return
	VALUES ('The Princess Bride', 13);
INSERT INTO mm_return
	VALUES ('Jaws', 10);

COMMIT;