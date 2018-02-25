-- Hemos añadido las restricciones (foreign keys) y algunos datos más para pruebas

CREATE TABLE users (
                    user_id bigint(20) unsigned NOT NULL auto_increment,
                    first_name varchar(100) NOT NULL,
                    last_name varchar(100) NOT NULL,
                    age int(11) NOT NULL,
                    username varchar(50) NOT NULL,
                    password varchar(50) NOT NULL,
                    PRIMARY KEY (user_id)
                  );

-- Categorías de productos
CREATE TABLE categories (
                    category_id bigint(20) unsigned NOT NULL auto_increment,
                    name varchar(150) NOT NULL,
                    PRIMARY KEY (category_id)
                );


CREATE TABLE cursos(
                    curso_id bigint(20) unsigned NOT NULL auto_increment,
                    name varchar(150) NOT NULL,
                    description text NOT NULL,
                    img varchar(256) NOT NULL,
                    price float NOT NULL,
                    PRIMARY KEY (curso_id)
);

CREATE TABLE products (
                    product_id bigint(20) unsigned NOT NULL auto_increment,
                    category_id bigint(20) unsigned NOT NULL,
                    -- brand_id bigint(20) unsigned NOT NULL,
                    name varchar(150) NOT NULL,
                    description text NOT NULL,
                    img varchar(256) NOT NULL,
                    price float NOT NULL,
                    posted timestamp,
                    vegano BOOLEAN,
                    celiaco BOOLEAN,
                    diabetico BOOLEAN,
                    PRIMARY KEY (product_id),
                    FOREIGN KEY (category_id) REFERENCES categories (category_id)
                   );
-- Carrito
CREATE TABLE shoppingcarts (
                    item_id bigint(20) unsigned NOT NULL auto_increment,
                    user_id bigint(20) unsigned NOT NULL,
                    product_id bigint(20) unsigned NOT NULL,
                    item_number int unsigned NOT NULL,
                    posted timestamp,
                    PRIMARY KEY (item_id),
                    FOREIGN KEY (user_id) REFERENCES users (user_id),
                    FOREIGN KEY (product_id) REFERENCES products (product_id)
                   );


-- Tiendas
CREATE TABLE stores (
                        store_id bigint(20) unsigned NOT NULL auto_increment,
                        name varchar(150) NOT NULL,
                        address text NOT NULL,
                        lat float NOT NULL,
                        lng float NOT NULL,
                        PRIMARY KEY (store_id)
                      );

-- Inicializamos algunos valores de los registros.
INSERT INTO users VALUES (1,'Juan','Sánchez',20,'jsanchez',md5('secret'));
INSERT INTO users VALUES (2,'Antonia','González', 15,'agonzalez',md5('password'));
INSERT INTO users VALUES (3,'Luisa','García', 18 ,'lgarcia',md5('topsecret'));

INSERT INTO categories VALUES (1,'Tartas de boda');
INSERT INTO categories VALUES (2,'Tartas de cumpleaños');
INSERT INTO categories VALUES (3,'Tartas tematicas');
INSERT INTO categories VALUES (4,'Tartas caseras');



INSERT INTO `products`(`product_id`, `category_id`,`name`, `description`, `img`,`price`, `posted`, `vegano`,`celiaco`, `diabetico`) VALUES
  (1,4,'Carrot Cake','Tarta de zanahoria', '/img/carrot-cake.jpg', 14.99 ,NULL,'true','false','false'),
  (2,4,'Tarta de trufa','Tarta de trufa', '/img/trufa.jpg', 20, NULL,'false','false','false'),
  (3,2,'Tarta de Shin-chan','Tarta de cumpleaños con fondant de chocolate de Shin-Chan', '/img/shinchan.jpg', 25.99 ,NULL,'false','true','false'),
  (4,1,'Love Rose','Tarta de bodas con rosas de fondant', '/img/botenutella.jpg', 39.99, NULL,'false','false','true'),
  (5,1,'Reef','Tarta de bodas coralina','/img/reef.jpg',69.99,NULL,'false','false','true'),
  (6,3,'Pirata','Tarta de un barco pirata','/img/pirate.jpg',80,NULL,'false','true','false'),
  (7,2,'Dora la Exploradora', 'Tarta de vainilla y nata de Dora la exploradora','/img/dora.jpg',20,NULL,'false','false','false'),
  (8,4,'Tarta Selva negra','Tarta de chocolate y nata','/img/selva-negra.jpg',14.99,NULL,'false','false','false'),
  (9,3,'Hawai','Tarta de vainilla y fruta de la pasion','/img/hawaiana.jpg',30.50,NULL,'true','true','false'),
  (10,1,'Tarta en escalera','Tarta de boda en en forma de pasarela en escalera','/img/stairs.jpg',90,NULL,'false','false','false');


INSERT INTO 'cursos'('curso_id','name','description','img','price') VALUES
    (1,'Curso Fondant I', 'Curso introductorio sobre el tratamiento de fondant','/img/fondant1.jpg', 30.99),
    (2,'Curso Fondant II', 'Curso intermedio sobre el tratamiento de fondant', '/img/fondant2.jpg', 35.00),
    (3,'Curso Fondant III', 'Curso avanzado sobre el tratamiento del fondant', '/img/fondan3.jpg', 40.00),
    (4,'Curso Cupcakes', 'Curso introductorio a la creacion de cupcakes', '/img/cupcake.jpg', 20.00);

INSERT INTO `shoppingcarts`(`user_id`, `product_id`,`item_number`) VALUES
  (1,1,1),
  (1,4,1),
  (2,3,10),
  (3,2,1),
  (3,2,1);

INSERT INTO `stores`(`store_id`,`name`,`address`,`lat`,`lng`) VALUES
  (1,'Juan de Garay','c/Juan de Garay, 25, 46017 Valencia', 39.4548243, -0.3957476),
  (2,'Malvarrosa','Playa de la Malvarrosa',39.47726,-0.3233746);
