-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 10-12-2023 a las 16:25:55
-- Versión del servidor: 5.7.40
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_plataforma`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `argumento`
--

DROP TABLE IF EXISTS `argumento`;
CREATE TABLE IF NOT EXISTS `argumento` (
  `idargumento` int(11) NOT NULL AUTO_INCREMENT,
  `espanol` text COLLATE utf8_spanish_ci,
  `aymara` text COLLATE utf8_spanish_ci,
  `idtemas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idargumento`),
  KEY `fk_argumento_categoria1_idx` (`idtemas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `argumento`
--

INSERT INTO `argumento` (`idargumento`, `espanol`, `aymara`, `idtemas`) VALUES
(4, 'El monitor es un dispositivo electrónico de salida de la computadora en el que se muestran las imágenes y textos generados por medio de un adaptador gráfico o de video de ésta. El término monitor se refiere normalmente a la pantalla de vídeo', 'ac', 4),
(5, 'teclado alfanumerico', 'ac', 146);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `aymara` text COLLATE utf8_spanish_ci,
  `espanol` text COLLATE utf8_spanish_ci,
  `id_categoria_leccione` int(11) DEFAULT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcategoria`),
  KEY `fk_categoria_categoria_lecciones1_idx` (`id_categoria_leccione`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `aymara`, `espanol`, `id_categoria_leccione`, `imagen`) VALUES
(1, 'PARTES DE LA COMPUTADORA', NULL, 1, 'cat_1695789699.jpg'),
(3, 'SISTEMAS OPERATIVOS', NULL, 1, 'cat_1701963760.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_lecciones`
--

DROP TABLE IF EXISTS `categoria_lecciones`;
CREATE TABLE IF NOT EXISTS `categoria_lecciones` (
  `id_categoria_lecciones` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_categoria_lecciones`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria_lecciones`
--

INSERT INTO `categoria_lecciones` (`id_categoria_lecciones`, `descripcion`, `estado`) VALUES
(1, 'COMPUTACION', 'activo'),
(2, 'MATEMATICA', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(6, 'admin', 'rol administrador'),
(7, 'estudiante', 'esto es para los que estan pasando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

DROP TABLE IF EXISTS `temas`;
CREATE TABLE IF NOT EXISTS `temas` (
  `idtemas` int(11) NOT NULL AUTO_INCREMENT,
  `espanol` text COLLATE utf8_spanish_ci,
  `aymara` text COLLATE utf8_spanish_ci,
  `id_categoria` int(11) DEFAULT NULL,
  `imagen` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idtemas`),
  KEY `fk_vocabulario_categoria2_idx` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `temas`
--

INSERT INTO `temas` (`idtemas`, `espanol`, `aymara`, `id_categoria`, `imagen`) VALUES
(4, 'el monitor\r\n', NULL, 1, 'hq720.jpg'),
(145, 'CPU', NULL, 1, '754757_1474601611.jpg'),
(146, 'TECLADO', NULL, 1, '1698300067.jpg'),
(147, 'MOUS', NULL, 1, 'cat_1698300323.jpg'),
(148, 'RAM', NULL, 1, 'cat_1698358203.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `ci_usuario` varchar(50) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `perfil` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_email` (`email`),
  UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  UNIQUE KEY `uc_remember_selector` (`remember_selector`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `ci_usuario`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `perfil`) VALUES
(1, '127.0.0.1', 'admin', '$2y$10$VHZZCZYkVZhoTMeNsuBvKeUrVc4UUUIEYHuUvXFxSFao4LwVRGpmG', 'rodrigo@gmail.com', '10028685', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1667882730, 1, 'admin', 'admin', 'ADMIN', '63259224', ''),
(7, '::1', 'Us_9077207', '$2y$10$we3BAmc28vmiAL.X5OYMt.85VnSG05LglD0y7arWWV1bpcf4ELekq', 'ronyaleyd@gmail.com', '9077207', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2023, 1701961919, 1, 'Ronald', 'Alejo', 'REG', NULL, NULL),
(9, '::1', 'Us_9901243', '$2y$10$KIlY8GBFBnqIJQbAfFLVb.BwPaFE2Qf5lkjRmHzJ/RpdULkcozw4y', 'rosy.rony@galejo.palma', '9901243', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2023, 1702225399, 1, 'Marelyn Rose', 'Soto Palma', 'REG', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(6, 1, 6),
(10, 7, 6),
(13, 9, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vocabulario`
--

DROP TABLE IF EXISTS `vocabulario`;
CREATE TABLE IF NOT EXISTS `vocabulario` (
  `idvocabulario` int(11) NOT NULL AUTO_INCREMENT,
  `espanol` text COLLATE utf8_spanish_ci,
  `aymara` text COLLATE utf8_spanish_ci,
  `id_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idvocabulario`),
  KEY `fk_vocabulario_categoria1_idx` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `vocabulario`
--

INSERT INTO `vocabulario` (`idvocabulario`, `espanol`, `aymara`, `id_categoria`) VALUES
(1, 'UNA PANTALLA', '¿QUE ES EL MONITOR?', 1),
(2, 'UN PERIFERICO', '¿QUE ES UN TECLADO?', 1),
(3, 'UNIDAD DE PROCESAMIENTO ', '¿QUE ES CPU?', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vocabulario_respuetas`
--

DROP TABLE IF EXISTS `vocabulario_respuetas`;
CREATE TABLE IF NOT EXISTS `vocabulario_respuetas` (
  `idvocabulario_respuetas` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) DEFAULT NULL,
  `id_vocabulario` int(11) DEFAULT NULL,
  `respuesta` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idvocabulario_respuetas`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `vocabulario_respuetas`
--

INSERT INTO `vocabulario_respuetas` (`idvocabulario_respuetas`, `id_categoria`, `id_vocabulario`, `respuesta`, `id_usuario`) VALUES
(11, 1, 1, 'CORRECTO', 9),
(12, 1, 2, 'INCORRECTO', 9),
(13, 1, 2, 'INCORRECTO', 9),
(14, 1, 2, 'INCORRECTO', 9),
(15, 1, 2, 'INCORRECTO', 9),
(16, 1, 2, 'INCORRECTO', 9),
(17, 1, 2, 'INCORRECTO', 9),
(18, 1, 2, 'INCORRECTO', 9);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `argumento`
--
ALTER TABLE `argumento`
  ADD CONSTRAINT `fk_argumento_categoria1` FOREIGN KEY (`idtemas`) REFERENCES `temas` (`idtemas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_categoria_categoria_lecciones1` FOREIGN KEY (`id_categoria_leccione`) REFERENCES `categoria_lecciones` (`id_categoria_lecciones`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `temas`
--
ALTER TABLE `temas`
  ADD CONSTRAINT `fk_vocabulario_categoria2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vocabulario`
--
ALTER TABLE `vocabulario`
  ADD CONSTRAINT `fk_vocabulario_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
