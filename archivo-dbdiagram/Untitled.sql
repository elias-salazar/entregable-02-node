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
  "comment" varchar NOT NULL,
  "user" int
);

CREATE TABLE "author" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "rel_comentario_entrada" (
  "id" SERIAL PRIMARY KEY,
  "comment" int,
  "post" int
);

ALTER TABLE "comentarios" ADD FOREIGN KEY ("user") REFERENCES "user" ("id");

ALTER TABLE "rel_comentario_entrada" ADD FOREIGN KEY ("comment") REFERENCES "comentarios" ("id");

ALTER TABLE "rel_comentario_entrada" ADD FOREIGN KEY ("post") REFERENCES "entradas" ("id");

ALTER TABLE "entradas" ADD FOREIGN KEY ("categoria") REFERENCES "categorias" ("id");

ALTER TABLE "entradas" ADD FOREIGN KEY ("author") REFERENCES "author" ("id");
