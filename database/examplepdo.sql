-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2020 a las 00:39:13
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examplepdo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `Id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf32_spanish2_ci NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`Id`, `name`, `status_id`) VALUES
(1, 'terror', 1),
(2, 'amor', 2),
(3, 'accion', 1),
(4, 'deportes', 1),
(5, 'intriga', 2),
(6, 'ciencia ficcion', 1),
(7, 'wester', 2),
(8, 'animacion', 1),
(9, 'aventura', 2),
(10, 'belica', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_movie`
--

CREATE TABLE `category_movie` (
  `Id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `category_movie`
--

INSERT INTO `category_movie` (`Id`, `movie_id`, `category_id`, `status_id`) VALUES
(1, 1, 1, 1),
(2, 2, 3, 1),
(3, 3, 8, 1),
(4, 4, 3, 1),
(5, 5, 6, 1),
(6, 6, 3, 2),
(7, 7, 2, 1),
(8, 8, 7, 2),
(9, 9, 10, 1),
(10, 10, 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
--

CREATE TABLE `movies` (
  `Id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf32_spanish2_ci NOT NULL,
  `description` text COLLATE utf32_spanish2_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`Id`, `name`, `description`, `user_id`, `status_id`) VALUES
(1, 'saw', '‘Saw’ es una película que relata un ejercicio violento, sangriento, psicológicamente agotador y un tanto terrorífico.\r\n\r\nAdam y Gordon, se despiertan separados por un cadáver y encadenados en una guarida. Están siendo los protagonistas de un juego que proviene de un asesino en serie. Para sobrevivir, los dos hombres deberán seguir una serie de reglas y objetivos diferentes si quieren ganar la batalla mortal a la que están siendo sometidos.', 1, 1),
(2, 'las cronicas de narnia', '\"Las crónicas de Narnia: El león, la bruja y el armario\" es una espectacular película basada en el clásico literario del popular escritor C.S. Lewis. La historia narra las aventuras de cua-tro hermanos: Lucy (Georgie Henley), Edmund (Skandar Keynes), Susan (Anna Popplewell) y Peter (William Mo-seley), que durante la Segunda Guerra Mundial descubren el mun-do de Narnia, al que acceden a través de un armario mágico mien-tras juegan al escondite en la casa de campo de un viejo profesor. En Narnia descubrirán un mundo increíble habitado por animales que hablan, duendes, faunos, centauros y gigantes al que la Bruja Blanca –Jadis– (Tilda Swinton) ha condenado al invierno eterno. Con la ayuda del león Aslan, el noble soberano, los niños lucharán para vencer el poder que la Bruja Blanca ejerce sobre Narnia en una espectacular batalla y conseguir así liberarle de la maldición del frío.', 2, 1),
(3, 'Coco', 'Pelicula que trata sobre un niño llamado Miguel de doce años que vive con su familia en una zona rural y se acerca una de las celebración mexicana donde el mundo real y el de los muertos se unen por una noche para ver familiares que ya están muertos.', 3, 2),
(4, 'Piratas del Caribe: La venganza de Salazar', 'Empujado hacia una nueva aventura, un sumamente desafortunado Jack Sparrow descubre que los vientos de los malos augurios soplan incluso más fuerte cuando los mortales piratas fantasma liderados por su viejo enemigo, el capitán Salazar, escapan del Triángulo del Diablo. Decididos a matar a todo pirata que encuentren en el mar, incluso al propio Sparrow. La única esperanza de supervivencia del Capitán Jack Sparrow se encuentra en la búsqueda del legendario tridente de Poseidón, un poderoso artefacto que otorga a su poseedor el control total sobre los mares.', 4, 1),
(5, 'One Piece: El barón Omatsuri y la Isla Secreta', 'Sinopsis\r\nLos sombrero de paja han encotrado un mapa que lleba a una isla llamada omatsuri que promete fiesta ,salones de belleza ,lindas chica de todo el mundo y grandes banquetes. Pero para disfrutar sus vacaciones tienen que realizar el test infernal hecho por el Baron Omatsuri.Pero la isla tiene un secreto. El test infernal sirve para separar y hacer que los piratas rivalizen entre si rompiento su espiritu de compañerismo.Monkey D Luffy y sus nakama tendran que sufrir el test infernal y poco a poco ver como se separan entre si.', 5, 2),
(6, 'xXx 2: Estado de emergencia', 'El viento del cambio político corre por los pasillos del Capitolio cuando el popular presidente se convierte en el objetivo de asesinato de un grupo radical de disidentes integrado en el gobierno de los Estados Unidos. Sólo dos personas se mantienen entre la anarquía y la libertad: Una de ellas, Augustus Gibbons, ha conseguido sobrevivir a un golpe en el cuartel general secreto de la Agencia de Seguridad Nacional y se ha dado a la fuga. El otro, un soldado condecorado de las fuerzas de Operaciones Especiales, Darius Stone, se encuentra bajo estrecha vigilancia en una prisión militar. Gibbons necesita una vez más a alguien de fuera y Stone es su hombre.', 6, 2),
(7, 'Bohemian Rhapsody', 'Bohemian Rhapsody es una rotunda y sonora celebración de Queen, de su música y de su extraordinario cantante Freddie Mercury, que desafió estereotipos e hizo añicos tradiciones para convertirse en uno de los showmans más queridos del mundo. La película plasma el meteórico ascenso al olimpo de la música de la banda a través de sus icónicas canciones y su revolucionario sonido, su crisis cuando el estilo de vida de Mercury estuvo fuera de control, y su triunfal reunión en la víspera del Live Aid, en la que Mercury, mientras sufría una enfermedad que amenazaba su vida, lidera a la banda en uno de los conciertos de rock más grandes de la historia. Veremos cómo se cimentó el legado de una banda que siempre se pareció más a una familia, y que continúa inspirando a propios y extraños, soñadores y amantes de la música hasta nuestros días.', 7, 1),
(8, 'Carros de fuego', 'En Gran Bretaña, en el año 1920, Harold Abrahams y Eric Lidell estaban hechos para correr. No sólo una razón les llebaba a correr más rápido que ningún otro hombre. Sus motivos eran tan diferentes como sus pasados; cada uno tenía su propio Dios, sus propias creencias y su propio empuje hacia el triunfo. Dos jóvenes corredores de diferentes clases sociales que se entrenan con un mismo objetivo: competir en las Olimpiadas de París de 1924.', 8, 2),
(9, 'The First Purge', 'Precuela de la franquicia «The Purge», que se centrará en los eventos que llevaron a la primera de todas las purgas anuales.', 9, 2),
(10, 'The Black Death', 'El origen data de 1565, durante el reinado de Maha Chakkrapha, cuando se produjo una epidemia en la antigua capital real. La enfermedad tropical fue atribuida a los mercaderes portugueses y persas, que navegaron con la enfermedad río arriba hasta la antigua capital. En cuanto a la crisis de salud pública, ello fue mucho peor y más extraño de lo que se presenta en los libros de historia.', 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `statuses`
--

CREATE TABLE `statuses` (
  `Id` int(11) NOT NULL,
  `status` varchar(50) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `statuses`
--

INSERT INTO `statuses` (`Id`, `status`) VALUES
(1, 'activo'),
(2, 'inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf32_spanish2_ci NOT NULL,
  `email` varchar(150) COLLATE utf32_spanish2_ci NOT NULL,
  `password` varchar(100) COLLATE utf32_spanish2_ci NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `status_id`) VALUES
(1, 'jeison', 'jearipadouaw@ijshd.com', '123456789', 1),
(2, 'cristian', 'cristian@gmail.com', '123456789', 2),
(3, 'veronica', 'veronica@gmail.com', '123456789', 1),
(4, 'orlando', 'orlando@gmail.com', '123456789', 2),
(5, 'pedro', 'pedro@gmail.com', '123456789', 1),
(6, 'francisco', 'francisco@gmail.com', '123456789', 2),
(7, 'ofelia', 'ofelia@gmail.com', '123456789', 1),
(8, 'iris', 'iris@gmail.com', '123456789', 2),
(9, 'hary', 'hary@gmail.com', '123456789', 1),
(10, 'admin', 'admin@gmail.com', '123456789', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indices de la tabla `category_movie`
--
ALTER TABLE `category_movie`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indices de la tabla `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indices de la tabla `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `status_id` (`status_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `category_movie`
--
ALTER TABLE `category_movie`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `statuses`
--
ALTER TABLE `statuses`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`Id`);

--
-- Filtros para la tabla `category_movie`
--
ALTER TABLE `category_movie`
  ADD CONSTRAINT `category_movie_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`Id`),
  ADD CONSTRAINT `category_movie_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`Id`),
  ADD CONSTRAINT `category_movie_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`Id`);

--
-- Filtros para la tabla `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`Id`),
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`Id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
