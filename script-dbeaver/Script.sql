CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "age" int
);

CREATE TABLE "entradas" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar,
  "author" int,
  "content" varchar,
  "categoria" int
);

CREATE TABLE "categorias" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar 
);

CREATE TABLE "comentarios" (
  "id" SERIAL PRIMARY KEY,
  "comment" varchar NOT NULL
);

CREATE TABLE "author" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "rel_cmt_cat" (
  "id" SERIAL PRIMARY KEY,
  "comment" int,
  "user" int,
  "post" int
);

ALTER TABLE "entradas" ADD FOREIGN KEY ("author") REFERENCES "author" ("id");

ALTER TABLE "entradas" ADD FOREIGN KEY ("categoria") REFERENCES "categorias" ("id");

ALTER TABLE "rel_cmt_cat" ADD FOREIGN KEY ("post") REFERENCES "entradas" ("id");

ALTER TABLE "rel_cmt_cat" ADD FOREIGN KEY ("user") REFERENCES "user" ("id");

ALTER TABLE  "rel_cmt_cat" ADD FOREIGN KEY ("comment") REFERENCES "comentarios" ("id");


INSERT into author (name) values ('carlos catalan'),('tommy thomson');
INSERT into categorias  (name) values ('personal'),('corporativo');
INSERT into "user"  (name,email,"password",age) values ('Rodrigo Rodriguez','rodri@gmail.com','ro12dri34',16),('Roberto Ramirez','robert@gmail.com','ro21bert43',20);
insert into entradas (title,description,author,"content",categoria) values ('viaje a Roma','en este blog hablare de mi experiencia en roma',2,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa',1),
('empresa','como administrar mejor',2,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa',2);

insert into comentarios ("comment") values ('muy buenas anecdotas! espero poder ir algun dia'),('mmm.. puse en practica tus consejos y no fueron de ayuda');
insert into rel_cmt_cat ("comment","user",post) values (1,1,1),(2,2,2);