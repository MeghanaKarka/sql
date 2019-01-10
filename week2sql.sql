
#1)
CREATE table MySqlVideos (
id integer Primary key,
Title varchar(100),
Length_min float,
Url varchar(100));

INSERT INTO MySqlVideos VALUES (1,'Real-world database tables and sample SQL queries',7.47,'https://www.youtube.com/watch?v=LjkKbThZap8');
INSERT INTO MySqlVideos VALUES (2,'Querying across multiple tables',13.35,'https://www.youtube.com/watch?v=fZexWmw3b4M');
INSERT INTO MySqlVideos VALUES (3,'Identity in databases using primary keys',4.16,'https://www.youtube.com/watch?v=fZexWmw3b4M&t=0s&index=7&list=PL9D228F8057A7BB64');
INSERT INTO MySqlVideos VALUES (4,'Simple database tables design',4.58,'https://www.youtube.com/watch?v=UTH3cfD3-B4&t=0s&index=5&list=PL9D228F8057A7BB64');

select * from MySqlVideos;


#2)
CREATE table Reviewers (
UserName Varchar(50),
Rating ENUM ('0','1','2','3','4','5'),
Review Varchar(100),
VideoId integer references MySqlVideos(id));

INSERT INTO Reviewers VALUES ('Andy',NULL,'Awesome Video',1);
INSERT INTO Reviewers VALUES ('Robin','4','Greate Video',1);
INSERT INTO Reviewers VALUES ('Sam','5','Vary helpful',2);
INSERT INTO Reviewers VALUES ('Ram','3','Introductory',3);
INSERT INTO Reviewers VALUES ('Matt','4','Lovely Video',3);
INSERT INTO Reviewers VALUES ('Cindy','2','Not so helpful',1);

select * from Reviewers;

#3)
SELECT a.*, r.UserName,r.Rating,r.Review 
FROM MySqlVideos a
JOIN Reviewers r ON a.id = r.VideoId;
