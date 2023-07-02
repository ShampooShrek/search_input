--SEPARADO--
create database search_database;
-- --
create table if not exists authors (
  id int not null auto_increment primary key,
  name varchar(200) not null unique
);

create table if not exists books (
  id int not null auto_increment primary key,
  title varchar(250) not null,
  image varchar(250) unique,
  author int not null,
  foreign key(author) references authors(id) 
); 


insert into authors(name) values
("José"),
("Maria"),
("Carlos"),
("Ednaldo Pereira");

INSERT INTO books (title, image, author) VALUES
  ('Como Usar Filtro de Anão', 'https://pbs.twimg.com/profile_images/1358437162056826882/eYEP9Ip__400x400.jpg', 1),
  ('Como Jogar LOL sem Perder Contato com a Família', 'https://img.ifunny.co/images/7a2f0c67cdf3b0b009be132498218ece51b8128b129afc147b9fc9abcc747361_3.jpg', 3),
  ('Como Alimentar seu Gatinho Direito Muito Fofo', 'https://i.pinimg.com/564x/2f/4a/50/2f4a5036a5d582e3d611d5fb4db322b3.jpg', 2),
  ('Por Que Homens Vivem Menos?', 'https://wl-incrivel.cf.tsp.li/resize/728x/jpg/c7c/c3a/247b5458afb990b01024fbc3d4.jpg', 3),
  ('Cem Anos de Solidão', 'https://i.zst.com.br/thumbs/12/2d/14/1458301768.jpg', 3),
  ('O Iluminado', 'https://livrariaflorence.fbitsstatic.net/img/p/livro-iluminado-o-king-167338/353746-1.jpg?w=660&h=660&v=no-change&qs=ignore', 4),
  ('Harry Potter e a Pedra Filosofal', 'https://i.zst.com.br/thumbs/12/31/31/1458320652.jpg', 4),
  ('Harry Potter e o Prisioneiro de Azkaban', 'https://m.media-amazon.com/images/I/51NgaS7V0WL._AC_UF1000,1000_QL80_.jpg', 1),
  ('1984', 'https://cf.shopee.com.br/file/ea3cc4bb265a86e40defaae7f99f6a91', 1),
  ('Dom Quixote', 'https://m.media-amazon.com/images/I/51XULadddlL.jpg', 2),
  ('O Senhor dos Anéis', 'https://cdn.shopify.com/s/files/1/0529/5125/3158/products/9788595086364_5bdbdeb1-c996-4436-981d-709d5ed9e39d.jpg?v=1686060035', 2);


-- PEGAR TODOS OS LIVROS DO AUTOR --
select b.title, b.image, a.name
from books b
join authors a on b.author = a.id
where a.id = 3