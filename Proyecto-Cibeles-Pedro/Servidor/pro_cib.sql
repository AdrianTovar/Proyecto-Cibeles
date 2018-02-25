-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-02-2018 a las 18:26:09
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pro_cib`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Tartas de boda'),
(2, 'Tartas de cumpleaños'),
(3, 'Tartas tematicas'),
(4, 'Tartas caseras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `curso_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `description` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `img` varchar(256) COLLATE utf8_general_mysql500_ci NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`curso_id`, `name`, `description`, `img`, `price`) VALUES
(1, 'Curso Fondant I', 'Curso introductorio sobre el tratamiento de fondant.', './img/fondant1.png', 30.99),
(2, 'Curso Fondant II', 'Curso intermedio sobre el tratamiento de fondant.', './img/fondant2.png', 35),
(3, 'Curso Fondant III', 'Curso avanzado sobre el tratamiento del fondant.', './img/fondant3.png', 40),
(4, 'Curso Cupcakes', 'Curso introductorio a la creacion de cupcakes.', './img/cupcake.png', 20),
(5, 'Horror Pastry', 'Curso de repostería y modelajo de Fondant ambientado en el género terror.', './img/saw.png', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `description` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `img` varchar(256) COLLATE utf8_general_mysql500_ci NOT NULL,
  `price` float NOT NULL,
  `posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vegano` tinyint(1) DEFAULT NULL,
  `celiaco` tinyint(1) DEFAULT NULL,
  `diabetico` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `description`, `img`, `price`, `posted`, `vegano`, `celiaco`, `diabetico`) VALUES
(1, 4, 'Carrot Cake', 'Tarta de zanahoria', '/img/carrot-cake.jpg', 14.99, '2018-02-22 11:53:46', 0, 0, 0),
(2, 4, 'Tarta de trufa', 'Tarta de trufa', '/img/trufa.jpg', 20, '2018-02-22 11:53:46', 0, 0, 0),
(3, 2, 'Tarta de Shin-chan', 'Tarta de cumpleaños con fondant de chocolate de Shin-Chan', '/img/shinchan.jpg', 25.99, '2018-02-22 11:53:46', 0, 0, 0),
(4, 1, 'Love Rose', 'Tarta de bodas con rosas de fondant', '/img/botenutella.jpg', 39.99, '2018-02-22 11:53:46', 0, 0, 0),
(5, 1, 'Reef', 'Tarta de bodas coralina', '/img/reef.jpg', 69.99, '2018-02-22 11:53:46', 0, 0, 0),
(6, 3, 'Pirata', 'Tarta de un barco pirata', '/img/pirate.jpg', 80, '2018-02-22 11:53:46', 0, 0, 0),
(7, 2, 'Dora la Exploradora', 'Tarta de vainilla y nata de Dora la exploradora', '/img/dora.jpg', 20, '2018-02-22 11:53:46', 0, 0, 0),
(8, 4, 'Tarta Selva negra', 'Tarta de chocolate y nata', '/img/selva-negra.jpg', 14.99, '2018-02-22 11:53:46', 0, 0, 0),
(9, 3, 'Hawai', 'Tarta de vainilla y fruta de la pasion', '/img/hawaiana.jpg', 30.5, '2018-02-22 11:53:46', 0, 0, 0),
(10, 1, 'Tarta en escalera', 'Tarta de boda en en forma de pasarela en escalera', '/img/stairs.jpg', 90, '2018-02-22 11:53:46', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shoppingcarts`
--

CREATE TABLE `shoppingcarts` (
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `item_number` int(10) UNSIGNED NOT NULL,
  `posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stores`
--

CREATE TABLE `stores` (
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `address` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `stores`
--

INSERT INTO `stores` (`store_id`, `name`, `address`, `lat`, `lng`) VALUES
(1, 'Juan de Garay', 'Calle Juan de Garay, 25, 46017 Valencia', 39.4548, -0.395748),
(2, 'Malvarrosa', 'Playa de la Malvarrosa', 39.4773, -0.323375);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8_general_mysql500_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_general_mysql500_ci NOT NULL,
  `age` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `age`, `username`, `password`) VALUES
(1, 'Juan', 'Sánchez', 20, 'jsanchez', '5ebe2294ecd0e0f08eab7690d2a6ee69'),
(2, 'Antonia', 'González', 15, 'agonzalez', '5f4dcc3b5aa765d61d8327deb882cf99'),
(3, 'Luisa', 'García', 18, 'lgarcia', 'ea847988ba59727dbf4e34ee75726dc3'),
(4, 'Pedro', 'Garcia', 28, 'pgarciam', '098f6bcd4621d373cade4e832627b4f6');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`curso_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `shoppingcarts`
--
ALTER TABLE `shoppingcarts`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `curso_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `shoppingcarts`
--
ALTER TABLE `shoppingcarts`
  MODIFY `item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Filtros para la tabla `shoppingcarts`
--
ALTER TABLE `shoppingcarts`
  ADD CONSTRAINT `shoppingcarts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `shoppingcarts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
