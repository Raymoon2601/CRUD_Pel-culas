-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-09-2020 a las 19:02:19
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `movierental`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `status_id` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `status_id`) VALUES
(1, 'terror', 1),
(2, 'amor', 2),
(3, 'accion', 1),
(4, 'deportes', 1),
(5, 'intriga', 2),
(6, 'ciencia ficcion', 1),
(7, 'western', 2),
(8, 'animacion', 1),
(9, 'aventura', 2),
(11, 'bélica', 1),
(13, 'Piratas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_movie`
--

DROP TABLE IF EXISTS `category_movie`;
CREATE TABLE IF NOT EXISTS `category_movie` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `category_movie`
--

INSERT INTO `category_movie` (`id`, `movie_id`, `category_id`) VALUES
(1, 11, 5),
(2, 11, 7),
(3, 11, 8),
(4, 12, 2),
(5, 12, 6),
(6, 13, 3),
(7, 13, 7),
(8, 15, 4),
(9, 15, 6),
(10, 16, 3),
(11, 16, 7),
(12, 17, 1),
(13, 17, 5),
(14, 18, 3),
(15, 18, 2),
(16, 18, 8),
(17, 19, 3),
(18, 19, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_spanish_ci NOT NULL,
  `user_id` int(6) NOT NULL,
  `status_id` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`status_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`id`, `name`, `description`, `user_id`, `status_id`) VALUES
(1, 'saw2', '‘Saw’ es una película que relata un ejercicio violento, sangriento, psicológicamente agotador y un tanto terrorífico.Adam y Gordon, se despiertan separados por un cadáver y encadenados en una guarida. Están siendo los protagonistas de un juego que proviene de un asesino en serie. Para sobrevivir, los dos hombres deberán seguir una serie de reglas y objetivos diferentes si quieren ganar la batalla mortal a la que están siendo sometidos.', 1, 2),
(2, 'las cronicas de narnia', '\"Las crónicas de Narnia: El león, la bruja y el armario\" es una espectacular película basada en el clásico literario del popular escritor C.S. Lewis. La historia narra las aventuras de cua-tro hermanos: Lucy (Georgie Henley), Edmund (Skandar Keynes), Susan (Anna Popplewell) y Peter (William Mo-seley), que durante la Segunda Guerra Mundial descubren el mun-do de Narnia, al que acceden a través de un armario mágico mien-tras juegan al escondite en la casa de campo de un viejo profesor. En Narnia descubrirán un mundo increíble habitado por animales que hablan, duendes, faunos, centauros y gigantes al que la Bruja Blanca –Jadis– (Tilda Swinton) ha condenado al invierno eterno. Con la ayuda del león Aslan, el noble soberano, los niños lucharán para vencer el poder que la Bruja Blanca ejerce sobre Narnia en una espectacular batalla y conseguir así liberarle de la maldición del frío.', 2, 1),
(3, 'Coco', 'Pelicula que trata sobre un niño llamado Miguel de doce años que vive con su familia en una zona rural y se acerca una de las celebración mexicana donde el mundo real y el de los muertos se unen por una noche para ver familiares que ya están muertos.', 3, 2),
(4, 'Piratas del Caribe: La venganza de Salazar', 'Empujado hacia una nueva aventura, un sumamente desafortunado Jack Sparrow descubre que los vientos de los malos augurios soplan incluso más fuerte cuando los mortales piratas fantasma liderados por su viejo enemigo, el capitán Salazar, escapan del Triángulo del Diablo. Decididos a matar a todo pirata que encuentren en el mar, incluso al propio Sparrow. La única esperanza de supervivencia del Capitán Jack Sparrow se encuentra en la búsqueda del legendario tridente de Poseidón, un poderoso artefacto que otorga a su poseedor el control total sobre los mares.', 4, 1),
(5, 'One Piece: El barón Omatsuri y la Isla Secreta', 'Sinopsis\r\nLos sombrero de paja han encotrado un mapa que lleba a una isla llamada omatsuri que promete fiesta ,salones de belleza ,lindas chica de todo el mundo y grandes banquetes. Pero para disfrutar sus vacaciones tienen que realizar el test infernal hecho por el Baron Omatsuri.Pero la isla tiene un secreto. El test infernal sirve para separar y hacer que los piratas rivalizen entre si rompiento su espiritu de compañerismo.Monkey D Luffy y sus nakama tendran que sufrir el test infernal y poco a poco ver como se separan entre si.', 5, 2),
(6, 'xXx 2: Estado de emergencia', 'El viento del cambio político corre por los pasillos del Capitolio cuando el popular presidente se convierte en el objetivo de asesinato de un grupo radical de disidentes integrado en el gobierno de los Estados Unidos. Sólo dos personas se mantienen entre la anarquía y la libertad: Una de ellas, Augustus Gibbons, ha conseguido sobrevivir a un golpe en el cuartel general secreto de la Agencia de Seguridad Nacional y se ha dado a la fuga. El otro, un soldado condecorado de las fuerzas de Operaciones Especiales, Darius Stone, se encuentra bajo estrecha vigilancia en una prisión militar. Gibbons necesita una vez más a alguien de fuera y Stone es su hombre.', 6, 2),
(7, 'Bohemian Rhapsody', 'Bohemian Rhapsody es una rotunda y sonora celebración de Queen, de su música y de su extraordinario cantante Freddie Mercury, que desafió estereotipos e hizo añicos tradiciones para convertirse en uno de los showmans más queridos del mundo. La película plasma el meteórico ascenso al olimpo de la música de la banda a través de sus icónicas canciones y su revolucionario sonido, su crisis cuando el estilo de vida de Mercury estuvo fuera de control, y su triunfal reunión en la víspera del Live Aid, en la que Mercury, mientras sufría una enfermedad que amenazaba su vida, lidera a la banda en uno de los conciertos de rock más grandes de la historia. Veremos cómo se cimentó el legado de una banda que siempre se pareció más a una familia, y que continúa inspirando a propios y extraños, soñadores y amantes de la música hasta nuestros días.', 7, 1),
(8, 'Carros de fuego', 'En Gran Bretaña, en el año 1920, Harold Abrahams y Eric Lidell estaban hechos para correr. No sólo una razón les llebaba a correr más rápido que ningún otro hombre. Sus motivos eran tan diferentes como sus pasados; cada uno tenía su propio Dios, sus propias creencias y su propio empuje hacia el triunfo. Dos jóvenes corredores de diferentes clases sociales que se entrenan con un mismo objetivo: competir en las Olimpiadas de París de 1924.', 8, 2),
(11, 'The Black Death', 'f', 2, 1),
(12, 'Cajero', 'rvwe', 2, 1),
(13, 'Cajero', 'f', 3, 1),
(14, 'Winie Pooh', 'El origen data de 1565, durante el reinado de Maha Chakkrapha, cuando se produjo una epidemia en la antigua capital real. La enfermedad tropical fue atribuida a los mercaderes portugueses y persas, que navegaron con la enfermedad río arriba hasta la antigua capital. En cuanto a la crisis de salud pública, ello fue mucho peor y más extraño de lo que se presenta en los libros de historia.', 3, 1),
(15, 'Winie Pooh', 'El origen data de 1565, durante el reinado de Maha Chakkrapha, cuando se produjo una epidemia en la antigua capital real. La enfermedad tropical fue atribuida a los mercaderes portugueses y persas, que navegaron con la enfermedad río arriba hasta la antigua capital. En cuanto a la crisis de salud pública, ello fue mucho peor y más extraño de lo que se presenta en los libros de historia.', 3, 1),
(16, 'Naruto', 'Ninjas', 3, 1),
(17, 'El aro', 'Da miedo', 2, 1),
(18, 'Mulan', 'El origen data de 1565, durante el reinado de Maha Chakkrapha, cuando se produjo una epidemia en la antigua capital real. La enfermedad tropical fue atribuida a los mercaderes portugueses y persas, que navegaron con la enfermedad río arriba hasta la antigua capital. En cuanto a la crisis de salud pública, ello fue mucho peor y más extraño de lo que se presenta en los libros de historia.', 4, 2),
(19, 'Duro de matar', 'El origen data de 1565, durante el reinado de Maha Chakkrapha, cuando se produjo una epidemia en la antigua capital real. La enfermedad tropical fue atribuida a los mercaderes portugueses y persas, que navegaron con la enfermedad río arriba hasta la antigua capital. En cuanto a la crisis de salud pública, ello fue mucho peor y más extraño de lo que se presenta en los libros de historia.', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie_rental`
--

DROP TABLE IF EXISTS `movie_rental`;
CREATE TABLE IF NOT EXISTS `movie_rental` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `movie_id` int(6) NOT NULL,
  `rental_id` int(6) NOT NULL,
  `price` decimal(15,3) NOT NULL,
  PRIMARY KEY (`id`,`movie_id`,`rental_id`),
  KEY `movie_id` (`movie_id`,`rental_id`),
  KEY `rental_id` (`rental_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `movie_rental`
--

INSERT INTO `movie_rental` (`id`, `movie_id`, `rental_id`, `price`) VALUES
(1, 1, 10, '0.000'),
(2, 7, 10, '0.000'),
(3, 1, 11, '0.000'),
(4, 4, 11, '0.000'),
(5, 3, 12, '0.000'),
(6, 11, 12, '0.000'),
(7, 6, 12, '0.000'),
(8, 2, 12, '0.000'),
(9, 5, 13, '0.000'),
(10, 6, 14, '0.000'),
(11, 16, 14, '0.000'),
(12, 7, 14, '0.000'),
(13, 6, 15, '0.000'),
(14, 16, 15, '0.000'),
(15, 7, 15, '0.000'),
(16, 8, 16, '0.000'),
(17, 18, 17, '5.000'),
(18, 16, 17, '5.000'),
(19, 17, 17, '5.000'),
(20, 8, 18, '5.000'),
(21, 19, 18, '5.000'),
(22, 15, 18, '5.000'),
(23, 6, 19, '5.000'),
(24, 5, 20, '5.000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rentals`
--

DROP TABLE IF EXISTS `rentals`;
CREATE TABLE IF NOT EXISTS `rentals` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total` int(12) NOT NULL,
  `user_id` int(6) NOT NULL,
  `status_id` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`status_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `rentals`
--

INSERT INTO `rentals` (`id`, `start_date`, `end_date`, `total`, `user_id`, `status_id`) VALUES
(1, '2020-06-08', '2020-07-06', 200, 2, 1),
(3, '2020-09-15', '2020-10-02', 5000000, 10, 1),
(10, '2020-09-01', '2020-09-17', 20000, 1, 1),
(11, '2020-09-01', '2020-08-31', 20000, 1, 2),
(12, '2020-09-07', '2020-09-23', 200000, 10, 1),
(13, '2020-09-29', '2020-09-24', 20000, 3, 2),
(14, '2020-09-08', '2020-09-14', 2000000, 5, 1),
(15, '2020-09-08', '2020-09-14', 2000000, 5, 1),
(16, '2013-01-20', '2020-09-26', 20, 8, 1),
(17, '2020-09-02', '2020-09-29', 15000, 3, 1),
(18, '2020-09-29', '2020-09-10', 150000, 12, 1),
(19, '2020-09-03', '2020-09-16', 5000, 10, 1),
(20, '2012-01-24', '2020-09-30', 5000, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `status_id` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `status_id`) VALUES
(1, 'Gerente', 1),
(2, 'Cajero', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `statuses`
--

DROP TABLE IF EXISTS `statuses`;
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `type_status_id` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_status_id` (`type_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `type_status_id`) VALUES
(1, 'Activo', 4),
(2, 'Inactivo', 1),
(4, 'Reposo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_statuses`
--

DROP TABLE IF EXISTS `type_statuses`;
CREATE TABLE IF NOT EXISTS `type_statuses` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `type_statuses`
--

INSERT INTO `type_statuses` (`id`, `name`) VALUES
(1, 'General'),
(4, 'Específico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(16) COLLATE utf8mb4_spanish_ci NOT NULL,
  `status_id` int(6) NOT NULL,
  `role_id` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `status_id` (`status_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `status_id`, `role_id`) VALUES
(1, 'jeison', 'jearipadouaw@ijshd.com', '123456789', 1, 2),
(2, 'cristian', 'cristian@gmail.com', '123456789', 2, 2),
(3, 'veronica', 'veronica@gmail.com', '123456789', 1, 2),
(4, 'orlando', 'orlando@gmail.com', '123456789', 2, 2),
(5, 'pedro', 'pedro@gmail.com', '123456789', 1, 2),
(6, 'francisco', 'francisco@gmail.com', '123456789', 2, 2),
(7, 'ofelia', 'ofelia@gmail.com', '123456789', 1, 2),
(8, 'iris', 'iris@gmail.com', '123456789', 2, 2),
(9, 'hary', 'hary@gmail.com', '123456789', 1, 2),
(10, 'admin', 'admin@gmail.com', '123456789', 1, 1),
(12, 'lunezeli', 'lunelly3@gmail.com', '12345678', 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Filtros para la tabla `category_movie`
--
ALTER TABLE `category_movie`
  ADD CONSTRAINT `category_movie_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Filtros para la tabla `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `movie_rental`
--
ALTER TABLE `movie_rental`
  ADD CONSTRAINT `movie_rental_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `rentals` (`id`),
  ADD CONSTRAINT `movie_rental_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Filtros para la tabla `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Filtros para la tabla `statuses`
--
ALTER TABLE `statuses`
  ADD CONSTRAINT `statuses_ibfk_1` FOREIGN KEY (`type_status_id`) REFERENCES `type_statuses` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
