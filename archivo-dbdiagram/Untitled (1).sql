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
  "comment" int,
  "user" int,
  "post" int
);

ALTER TABLE "entradas" ADD FOREIGN KEY ("author") REFERENCES "author" ("id");

ALTER TABLE "entradas" ADD FOREIGN KEY ("categoria") REFERENCES "categorias" ("id");

ALTER TABLE "rel_cmt_cat" ADD FOREIGN KEY ("post") REFERENCES "entradas" ("id");

ALTER TABLE "rel_cmt_cat" ADD FOREIGN KEY ("user") REFERENCES "user" ("id");

ALTER TABLE "rel_cmt_cat" ADD FOREIGN KEY ("comment") REFERENCES "comentarios" ("id");
