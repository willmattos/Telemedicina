-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-02-2023 a las 12:33:27
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `telemedicina`
--
CREATE DATABASE IF NOT EXISTS `telemedicina` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `telemedicina`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

DROP TABLE IF EXISTS `consultas`;
CREATE TABLE `consultas` (
  `codigo` int(11) NOT NULL,
  `asunto` varchar(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `leido` int(1) NOT NULL DEFAULT 0,
  `completado` int(1) NOT NULL DEFAULT 0,
  `id_paciente` int(11) NOT NULL,
  `num_medico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `consultas`
--

TRUNCATE TABLE `consultas`;
--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`codigo`, `asunto`, `fecha`, `leido`, `completado`, `id_paciente`, `num_medico`) VALUES
(1, 'Prueba 1', '2023-02-14 12:11:41', 0, 0, 1, 123456789),
(2, 'Prueba 1', '2023-02-14 12:15:54', 0, 0, 1, 123456789),
(3, 'Prueba 1', '2023-02-14 12:17:07', 0, 0, 1, 123456789);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
CREATE TABLE `especialidades` (
  `codigo` int(2) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `especialidades`
--

TRUNCATE TABLE `especialidades`;
--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`codigo`, `nombre`) VALUES
(1, 'Alergología'),
(2, 'Anestesiología y reanimación'),
(3, 'Aparato digestivo'),
(4, 'Cardiología'),
(5, 'Endocrinología y nutrición'),
(6, 'Geriatría'),
(7, 'Hematología'),
(8, 'Nefrología'),
(9, 'Neumología'),
(10, 'Neurología'),
(11, 'Oncología médica'),
(12, 'Pediatría'),
(13, 'Psiquiatría'),
(14, 'Rehabilitación'),
(15, 'Reumatología'),
(16, 'Medicina familiar'),
(17, 'Obstetricia y ginecología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

DROP TABLE IF EXISTS `medicos`;
CREATE TABLE `medicos` (
  `num_col` int(11) NOT NULL,
  `especialidad` int(2) DEFAULT NULL,
  `hospital` varchar(20) DEFAULT NULL,
  `cv` varchar(255) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `medicos`
--

TRUNCATE TABLE `medicos`;
--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`num_col`, `especialidad`, `hospital`, `cv`, `id_usuario`) VALUES
(123456789, 1, 'La Paz', '', 2),
(987654321, 1, '', '', 3),
(1003537980, 6, '', '', 93),
(1019288387, 10, '', '', 80),
(1037446932, 7, '', '', 9),
(1050567286, 16, '', '', 35),
(1060097903, 11, '', '', 64),
(1066174831, 16, '', '', 69),
(1081834582, 17, '', '', 36),
(1091213824, 13, '', '', 49),
(1112536872, 14, '', '', 67),
(1116536544, 12, '', '', 99),
(1124594945, 16, '', '', 86),
(1143339026, 9, '', '', 28),
(1156018597, 17, '', '', 70),
(1188795887, 3, '', '', 22),
(1201010740, 1, '', '', 20),
(1203391109, 11, '', '', 13),
(1208535635, 4, '', '', 40),
(1221908217, 15, '', '', 102),
(1251631496, 8, '', '', 95),
(1265545811, 7, '', '', 60),
(1274133745, 4, '', '', 91),
(1274514501, 3, '', '', 56),
(1279072610, 2, '', '', 21),
(1293500362, 16, '', '', 52),
(1298112719, 11, '', '', 81),
(1318909785, 6, '', '', 59),
(1320183890, 2, '', '', 4),
(1326644087, 5, '', '', 92),
(1342453126, 6, '', '', 42),
(1345450412, 13, '', '', 32),
(1347854648, 13, '', '', 15),
(1351665204, 5, '', '', 24),
(1355816853, 3, '', '', 73),
(1363244916, 17, '', '', 87),
(1385683655, 17, '', '', 19),
(1396379976, 6, '', '', 25),
(1410140526, 5, '', '', 75),
(1420314783, 11, '', '', 98),
(1427996190, 6, '', '', 76),
(1430945791, 1, '', '', 105),
(1447968102, 7, '', '', 94),
(1450349408, 1, '', '', 88),
(1476825828, 15, '', '', 17),
(1488137798, 5, '', '', 7),
(1529275967, 15, '', '', 34),
(1530291571, 17, '', '', 104),
(1575688244, 16, '', '', 103),
(1628825345, 8, '', '', 10),
(1633329105, 2, '', '', 72),
(1636343536, 10, '', '', 46),
(1638948608, 8, '', '', 61),
(1645105111, 16, '', '', 18),
(1664290084, 10, '', '', 29),
(1671053715, 10, '', '', 63),
(1671290662, 10, '', '', 97),
(1685233526, 6, '', '', 8),
(1686642164, 13, '', '', 100),
(1704248619, 13, '', '', 66),
(1721107567, 14, '', '', 101),
(1734397803, 12, '', '', 48),
(1750853612, 2, '', '', 38),
(1753684029, 1, '', '', 71),
(1758445945, 4, '', '', 6),
(1761469033, 11, '', '', 47),
(1770871477, 8, '', '', 44),
(1773747156, 7, '', '', 26),
(1788572055, 9, '', '', 79),
(1805319000, 15, '', '', 85),
(1809188908, 5, '', '', 58),
(1812871613, 7, '', '', 43),
(1819503112, 9, '', '', 96),
(1825188383, 14, '', '', 16),
(1830185269, 4, '', '', 23),
(1830292361, 14, '', '', 50),
(1851681540, 12, '', '', 14),
(1884217566, 1, '', '', 54),
(1893274460, 4, '', '', 74),
(1900646247, 11, '', '', 30),
(1902594884, 17, '', '', 53),
(1922181427, 1, '', '', 37),
(1931235261, 9, '', '', 11),
(1937636810, 5, '', '', 41),
(1943184868, 12, '', '', 82),
(1948784518, 12, '', '', 31),
(1966161592, 3, '', '', 39),
(1970347384, 9, '', '', 62),
(1977414668, 8, '', '', 78),
(1982380292, 8, '', '', 27),
(1989933736, 9, '', '', 45),
(2003946106, 10, '', '', 12),
(2011654205, 4, '', '', 57),
(2014072940, 14, '', '', 84),
(2019319829, 15, '', '', 51),
(2020808488, 13, '', '', 83),
(2027826288, 3, '', '', 5),
(2030612732, 12, '', '', 65),
(2034206154, 2, '', '', 55),
(2071322049, 3, '', '', 90),
(2098993696, 7, '', '', 77),
(2115710046, 14, '', '', 33),
(2125507650, 15, '', '', 68),
(2127008166, 2, '', '', 89);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
CREATE TABLE `mensajes` (
  `codigo` int(11) NOT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `adjunto` varchar(255) DEFAULT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_consulta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `mensajes`
--

TRUNCATE TABLE `mensajes`;
--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`codigo`, `mensaje`, `adjunto`, `fecha_hora`, `codigo_consulta`, `id_usuario`) VALUES
(1, 'prueba', '', '2023-02-14 12:17:07', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `clave` varchar(60) NOT NULL,
  `rol` int(1) NOT NULL DEFAULT 0,
  `foto` longblob DEFAULT NULL,
  `bloquear` int(1) DEFAULT 0,
  `recuperacion` int(10) NOT NULL DEFAULT 0,
  `activado` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `usuarios`
--

TRUNCATE TABLE `usuarios`;
--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `nombre`, `apellido`, `clave`, `rol`, `foto`, `bloquear`, `recuperacion`, `activado`) VALUES
(1, 'paciente@paciente.es', 'Tyler', 'Durden', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(2, 'medico@comem.es', 'Barry', 'Allen', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 1, NULL, 0, 0, 0),
(3, 'psyco@comem.es', 'Patrick', 'Bateman', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(4, 'AbdónAlonso@comem.es', 'Abdón', 'Abdón', '1234', 0, NULL, 0, 0, 0),
(5, 'AbelÁlvarez@comem.es', 'Abel', 'Álvarez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(6, 'AbelardoArias@comem.es', 'Abelardo', 'Arias', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(7, 'AbrahánBenítez@comem.es', 'Abrahán', 'Benítez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(8, 'AbsalónBlanco@comem.es', 'Absalón', 'Blanco', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(9, 'AcacioBlesa@comem.es', 'Acacio', 'Blesa', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(10, 'AdalbertoBravo@comem.es', 'Adalberto', 'Bravo', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(11, 'AdánCaballero@comem.es', 'Adán', 'Caballero', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(12, 'AdelaCabrera@comem.es', 'Adela', 'Cabrera', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(13, 'AdelaidaCalvo@comem.es', 'Adelaida', 'Calvo', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(14, 'AdolfoCambil@comem.es', 'Adolfo', 'Cambil', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(15, 'AdónCampos@comem.es', 'Adón', 'Campos', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(16, 'AdriánCano@comem.es', 'Adrián', 'Cano', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(17, 'AgustínCarmona@comem.es', 'Agustín', 'Carmona', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(18, 'AitorCarrasco@comem.es', 'Aitor', 'Carrasco', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(19, 'AlbaCastillo@comem.es', 'Alba', 'Castillo', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(20, 'AlbertCastro@comem.es', 'Albert', 'Castro', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(21, 'AlbertoCortés@comem.es', 'Alberto', 'Cortés', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(22, 'AlbinaCrespo@comem.es', 'Albina', 'Crespo', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(23, 'AlejandraCruz@comem.es', 'Alejandra', 'Cruz', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(24, 'AlejandroDelgado@comem.es', 'Alejandro', 'Delgado', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(25, 'AlejoDíaz@comem.es', 'Alejo', 'Díaz', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(26, 'AlfonsoDíez@comem.es', 'Alfonso', 'Díez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(27, 'AlfredoDomínguez@comem.es', 'Alfredo', 'Domínguez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(28, 'AliciaDurán@comem.es', 'Alicia', 'Durán', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(29, 'AlipioEsteban@comem.es', 'Alipio', 'Esteban', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(30, 'AlmudenaFernández@comem.es', 'Almudena', 'Fernández', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(31, 'AlonsoFerrer@comem.es', 'Alonso', 'Ferrer', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(32, 'ÁlvaroFlores@comem.es', 'Álvaro', 'Flores', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(33, 'AmadeoFuentes@comem.es', 'Amadeo', 'Fuentes', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(34, 'AmaroGallardo@comem.es', 'Amaro', 'Gallardo', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(35, 'AmbrosioGallego@comem.es', 'Ambrosio', 'Gallego', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(36, 'AmeliaGarcía@comem.es', 'Amelia', 'García', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(37, 'AmparoGarrido@comem.es', 'Amparo', 'Garrido', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(38, 'AnaGil@comem.es', 'Ana', 'Gil', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(39, 'AnaníasGiménez@comem.es', 'Ananías', 'Giménez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(40, 'AnastasiaGómez@comem.es', 'Anastasia', 'Gómez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(41, 'AnatolioGonzález@comem.es', 'Anatolio', 'González', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(42, 'AndreaGuerrero@comem.es', 'Andrea', 'Guerrero', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(43, 'AndrésGutiérrez@comem.es', 'Andrés', 'Gutiérrez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(44, 'ÁngelHernández@comem.es', 'Ángel', 'Hernández', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(45, 'ÁngelaHerrera@comem.es', 'Ángela', 'Herrera', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(46, 'ÁngelesHerrero@comem.es', 'Ángeles', 'Herrero', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(47, 'AnianoHidalgo@comem.es', 'Aniano', 'Hidalgo', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(48, 'AnnaIbáñez@comem.es', 'Anna', 'Ibáñez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(49, 'AnselmoIglesias@comem.es', 'Anselmo', 'Iglesias', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(50, 'AnteroJiménez@comem.es', 'Antero', 'Jiménez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(51, 'AntoniaLeón@comem.es', 'Antonia', 'León', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(52, 'AntonioLópez@comem.es', 'Antonio', 'López', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(53, 'AquilesLorenzo@comem.es', 'Aquiles', 'Lorenzo', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(54, 'AraceliLozano@comem.es', 'Araceli', 'Lozano', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(55, 'AránzazuMarín@comem.es', 'Aránzazu', 'Marín', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(56, 'ArcadioMárquez@comem.es', 'Arcadio', 'Márquez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(57, 'AresioMartín@comem.es', 'Aresio', 'Martín', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(58, 'AriadnaMartínez@comem.es', 'Ariadna', 'Martínez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(59, 'AristidesMedina@comem.es', 'Aristides', 'Medina', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(60, 'ArnaldoMéndez@comem.es', 'Arnaldo', 'Méndez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(61, 'ArtemioMolina@comem.es', 'Artemio', 'Molina', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(62, 'ArturoMontero@comem.es', 'Arturo', 'Montero', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(63, 'AscensiónMontoro@comem.es', 'Ascensión', 'Montoro', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(64, 'AsunciónMora@comem.es', 'Asunción', 'Mora', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(65, 'AtanasioMorales@comem.es', 'Atanasio', 'Morales', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(66, 'AugustoMoreno@comem.es', 'Augusto', 'Moreno', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(67, 'ÁureaMoya@comem.es', 'Áurea', 'Moya', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(68, 'AureliaMuñoz@comem.es', 'Aurelia', 'Muñoz', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(69, 'AurelianoNavarro@comem.es', 'Aureliano', 'Navarro', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(70, 'AurelioNieto@comem.es', 'Aurelio', 'Nieto', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(71, 'AuroraNúñez@comem.es', 'Aurora', 'Núñez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(72, 'BaldomeroOrtega@comem.es', 'Baldomero', 'Ortega', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(73, 'BalduinoOrtiz@comem.es', 'Balduino', 'Ortiz', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(74, 'BaltasarParra@comem.es', 'Baltasar', 'Parra', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(75, 'BárbaraPascual@comem.es', 'Bárbara', 'Pascual', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(76, 'BartoloméPastor@comem.es', 'Bartolomé', 'Pastor', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(77, 'BasileoPeña@comem.es', 'Basileo', 'Peña', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(78, 'BeatrizPérez@comem.es', 'Beatriz', 'Pérez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(79, 'BegoñaPrieto@comem.es', 'Begoña', 'Prieto', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(80, 'BelénRamírez@comem.es', 'Belén', 'Ramírez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(81, 'BeltránRamos@comem.es', 'Beltrán', 'Ramos', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(82, 'BenedictoRey@comem.es', 'Benedicto', 'Rey', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(83, 'BenignoReyes@comem.es', 'Benigno', 'Reyes', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(84, 'BenitoRodríguez@comem.es', 'Benito', 'Rodríguez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(85, 'BenjamínRomán@comem.es', 'Benjamín', 'Román', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(86, 'BernabéRomero@comem.es', 'Bernabé', 'Romero', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(87, 'BernardaRubio@comem.es', 'Bernarda', 'Rubio', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(88, 'BernardoRuiz@comem.es', 'Bernardo', 'Ruiz', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(89, 'BlancaSáez@comem.es', 'Blanca', 'Sáez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(90, 'BlasSánchez@comem.es', 'Blas', 'Sánchez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(91, 'BonifacioSantana@comem.es', 'Bonifacio', 'Santana', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(92, 'BorjaSantiago@comem.es', 'Borja', 'Santiago', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(93, 'BrunoSantos@comem.es', 'Bruno', 'Santos', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(94, 'CalixtoSanz@comem.es', 'Calixto', 'Sanz', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(95, 'CamiloSerrano@comem.es', 'Camilo', 'Serrano', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(96, 'CándidaSoler@comem.es', 'Cándida', 'Soler', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(97, 'CarinaSoto@comem.es', 'Carina', 'Soto', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(98, 'CarlosSuárez@comem.es', 'Carlos', 'Suárez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(99, 'CarmeloTorres@comem.es', 'Carmelo', 'Torres', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(100, 'CarmenVargas@comem.es', 'Carmen', 'Vargas', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(101, 'CarolinaVázquez@comem.es', 'Carolina', 'Vázquez', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(102, 'CasianoVega@comem.es', 'Casiano', 'Vega', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(103, 'CasimiroVelasco@comem.es', 'Casimiro', 'Velasco', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(104, 'CasioVicente@comem.es', 'Casio', 'Vicente', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0),
(105, 'CatalinaVidal@comem.es', 'Catalina', 'Vidal', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoran`
--

DROP TABLE IF EXISTS `valoran`;
CREATE TABLE `valoran` (
  `valoracion` int(1) NOT NULL,
  `codigo_consulta` int(11) NOT NULL,
  `num_medico` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Truncar tablas antes de insertar `valoran`
--

TRUNCATE TABLE `valoran`;
--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `num_medico` (`num_medico`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`num_col`),
  ADD KEY `medicos_ibfk_1` (`id_usuario`),
  ADD KEY `especialidad` (`especialidad`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_consulta` (`codigo_consulta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `valoran`
--
ALTER TABLE `valoran`
  ADD PRIMARY KEY (`codigo_consulta`,`num_medico`),
  ADD KEY `num_medico` (`num_medico`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `codigo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`num_medico`) REFERENCES `medicos` (`num_col`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicos_ibfk_2` FOREIGN KEY (`especialidad`) REFERENCES `especialidades` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`codigo_consulta`) REFERENCES `consultas` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valoran`
--
ALTER TABLE `valoran`
  ADD CONSTRAINT `valoran_ibfk_1` FOREIGN KEY (`codigo_consulta`) REFERENCES `consultas` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `valoran_ibfk_2` FOREIGN KEY (`num_medico`) REFERENCES `medicos` (`num_col`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `valoran_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
