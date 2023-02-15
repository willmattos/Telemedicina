-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-02-2023 a las 13:32:09
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
  `foto` text DEFAULT NULL,
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
(1, 'paciente@paciente.es', 'Tyler', 'Durden', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 0, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUWFRgWFRYYGRgYHBgZGBoaGBgYGRoaGBgZGhgaGBgcIS4lHB4rIRgYJjgmKy8xNTU1GiQ7QDs0Py40NTQBDAwMEA8QHhISHjQkJCQ0NDQ0NDQ0NDQ0NDQ0MTQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDE0NDQ0NDQ0NP/AABEIAOAA4QMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAADBAIFBgEAB//EADsQAAEDAgQEAwYEBQMFAAAAAAEAAhEDIQQSMUEFUWFxIoGRBhOhscHwQlLh8RQyYoLRcpKiFSODstL/xAAZAQADAQEBAAAAAAAAAAAAAAAAAQIDBAX/xAAkEQACAgICAgICAwAAAAAAAAAAAQIRITEDEkFRBCJhgRQycf/aAAwDAQACEQMRAD8A+l4Qp8FI0xCaa5YR0WSK9mUXOUS5OwJ+8UXPUFwlIKOueo5lBxXpQM6SuZkCtiWjdU2P42xu6LNIcUpaLqtig3Uqj4hxxrZus1j+OPeYZKBQ4XUqGXTBUN3o61xQ41c2NYjjL3mGSo0OGveZdKveF8BazULQUcK1osE1H2Zz+T4jhGfwHAmjZaDDYVrRojhikqSo5XJvZ2VlvaPibnE0qZho/ncDc9BGysuOcQ92wx/MbDudT5D5hZFtWba891lOVYNIQey89ksW4OdScZBGZsmSCNR0kX8lqm1FgMI/LWpubs9o/m1kwRHYrdJ8TbQuWNMYc9Be5SauPC0Mga9CkGrjkAehcIXAUGtiA3UoKUW9DQch1MS1upVBj+OtYDdZXHe0T3nKy6TlR18fxZNXLCN//wBSZzXl8z/iMQvJdzT+Nx+z621qNK4Vwqjz6OEqBKK0LjggCIcuOch1a7WjVUfEeOMbuk8GsOKUnguKuJa3Uqnx/Gms3WWx3G3vMMBQcJwupUMvlT2vR1rhhxq5MYxnGXvMMlDw3Cn1DLpWjwHAmtFwruhhGtFghK9mUvkuqiqKHA8Aa3ZXuGwrW7JiFNoV0cspN7IhoXQpBq4UE0SlK4vEZYAu46BRxGKDd7qmx2KIa5+r3eBgG1vE70MeaylPwjWMPLKXjeMz1CAZaywOx5m3WUsKjWi9+nPzMLzGZbC2+oM9blRqkne/O/y/VQsmqfgnQrxUYSCAHttEAeISvopavlxaWwc0/wBsfG6+mYCsH02PbcOaD8Lq+PFojl0mGY1ddKlKBXrgalbGKTegsoFSu0alVeO4w1gN1kOJ+0hJhkkqXJI6+L4snl4Rq+IcZYwarH8S9onPJDJKToYStXMumFpOGezQFyFH2kbufFw4jlmaw/D6tUy6Vo+G+zgEEhafC8Ma3ZWbKCpRSOXl+RKe2Z7/AKO3kvLRe7XlVGHYOQhkoNbFBupVHxHj7GDVFmkOGUtF7UxDW6lUnE+OtYDcLI4/2ie8wwHulcNwyrVdLyVLl6OtcMONXN/o0WK4yz3Od0kklrQLFxibHt3WcdXpPMuY8f8AkDo8sn1TXtBgjSp0hFpf6+BVNN43WEm06YottNxdI1HBxhjbOGnk6G+h0WuwuFYACIXy0kREH4H4K04ZxqrRgA5mbtM/C9lcZ1tGM+O8pn0cMCkWKh4f7RMq2aQHDVjoB/tOhVgOJgWcCFp3iY9JDrQvEhVr+KNH0SVXiBdMHrP6KXyxQ1xN7L59Vo3SOI4iNAs3iOIu5k/obR97qFHHh0jW0jn96rGXPeEax4qyN1cUA7M4mNktjcU0sEmCZt0Jn/Hoq5/EIJbEz92S1Z866X8vv6LDs80bdV5FKtZ4dbRcOPeLQT/bO3PaydaPFEDT5ITmNdZw11PfkqjOticRfD13vdDs0HebD0X0D2WqZMM0O1a57T5PKxdLCtDTkjNqTpA6eVlb4LGuNJzWXIkjrO/qt4zSdkOPbDNBj+MMYDcLHcT9ppJDLlK1uFYiqfGTfYfVWvDfZjLEhaXKRt24eJYyyhpYWvXMukBaPhnswBBIWowPDWsAsrFrQFaijm5fkyn+EVmD4Y1g0VgxgCnnClZVRzWdYEYIIKkXIAnK8hyvIA+WcS9pXvJaySl8HwurWMvJ7LScL9l8sEhaLD8ODNAoUW9ndP5TrrBUim4f7PtaBIV/h8ExosApikQu+7PNVRxuTbtlN7W8Pz4clurDnAG4AIPwM+S+ch4G0r7AKR3XzL2p4b/DVbTkfLmHlzb3B+iy5IZTN+GeHEr31BMAEnlb4r1N94IaSdh4o2MnRItJf4W+FlswFi7/AFEXPZNMeAMrd7QI2RWC2wrsQxrvDmHUGG+nJaLAcYBYQ8ERpFyORF9OYWPe/N4WRB1PONb8k9h2FoHi00G6xk6KSs0Ixhe6S6Bttp0StbiGV48XMERcjdVT8TI8AIAcMw0jsD+E2tt2KLTLA9r3XHnuIsddx5iFjTs0VFlXZb+oyWjdcwriAC5oIJAB/wBWk+fxTFQCp4mEFzD5mB+w8+qqTiS0uAktcJ7ONzHLb/d0TcaEnaou8ThGRJGU8x6/UquqZHSBY3Ec4/b4ovEMROHzg7NIj+oi8eanXoh1Fj2DxBsnnMEH0g/BNxvRKdbIU6cddb7a/qPRDbT37n9kDg2KNQNad4nsCSfW3oFc+7l8fhEffVLraCUqdFc2iTc20j6p/hzchB+ITD6DcthJH3A599F7COAtlHkn1pi7WjTYPK4DQn71T/ugs1Rq5TINvuVosHiA8Lr45Xg5px8ki2NEniXuAVoxi7Uw4K1ZkZR2PeDEFONx5jRWdThoOy4OHDkppioSw2MLtk6HOR6GAa1NCkE0mMr/ABLysfdheToDgY0LhaENjivPKqgOPcOSg1w5KLyuSFIUHNQLMe3PDnV8MfdiXsIcG6SLh4B5xf8AtVzVq2skhiHSs5SVUawi07PjtKrLDBgDWxv3QH4q4awSdLTIvpbTmtP7V8NbSxJe0AMqjxDQAn8QHKfqs7hqJZVtYev+bKIy9m0leUOYZhY0Ekkn8zCI7SNF19Um/wA5HoVKo/M7+aOoujUm9HHnDo/4kH75rCbtlxwguEdcE72iJvyOxEWg81HFvb4YsAQY1gzJHmLjn3mCUajCYMtIiHNcCLaHTZIcZwb2+KxB3bYeQ/ZJKyu2S1qk0P8Avsl1N0527g7ET3SWPrDNnZBY8ZuUAiZB6EH1turLguKa6gGuuSAHN1Bj9/uEg/D5RlHjpgGByuTbt4hHnsqccExeWEoYrNRcyZAIHW9/gZ9VecIqf9oBxEgQdpi0jofqszhmBrnsIEHTaImI+UcoTzsUW62BEW0J3+nqhYyKWcEn0vdV2x/I4gD6j0n0V3i8VTpS972gO0nlr6LPcQrww1H6MGa2pIBEDuSFm8ZRe51GpiHBxryWsBBFNpANPMNi4zbkB2VwhabM5z1Zsx7X4d0taZ2/FN9rDouHiL32pB3UxA7AcllMVh2s93UptbmzBsaZgdZjlrO0L6E9oZTa+ACQLfL4pTjatMqMkvBXYLFvaTnBgWBNpO5bzC1fs/xBrnCN7HnKzLsSH5mxAAs48+ijwtzmVAQZEiVMJdXgJK07wfUWvCk16Rw75umC9dpyDC8RCC2sF59VAUefVUDWQnOUCUWAz7xeSudeRYBQeS9PNcBhKYmvsFMppIqMbJV8QBolRVJvslnnmV51RYObkbqCQd9bkpUaOa5Q6UJvD8z5Kor2DdGa9s8KHhotIWAxOEDTJzE6axP6L6Tx5mci/OVjsewE+GIHndZSw8FweKZV0KZjfqD9E5QZa+sW3J9Pn80RzCG6CdrJQ4zLOaOv3BUrZT/Ay/Bg62vvY+c6qTcM0NLLOaZtpHYm5+9FR8R44TDKbfE4w2dOpgXi3Pmq/G4GoGNq1Kpyl7WAB0FzjqWtmYAuTzt22jx2ZSnRpMHhnslky03aeUz6G/wRXPIdBtfTTv6kBZt2JqYWHNe57JhzXmfNp1BiVq6OIZiaOdmoE9RGoKHDFoSlbyBdRmDax6fe6NVw+YTvA+kKeEpEjyj5pvCMBEHUfYss2jSym9saBGBLm7OZPYO/ys1g+K0XMDaliI2nS4P6recTY11F7DdrtuUEaxqLKh4BwXDy5z5dfSTEA/ylswVp2i49WR0lfZCvC6VTFVm+7bFGmSXPdvIItysVouN8TafCwyG2B2kcuYXMfxFpZ7tgys2a2R2toqOu7NYNJO5J27X1WUpL+qNIxrLLDh+Z5icrbefNXuBpjMQTYH17qhw7fdw55l34Wt699FbYLGXA5685PZOCS2RNt6PoeHeMo7BRfVQKTvCOy5ddlnMNNeVMSlmPTTXhAiMFcJUi9RJCQHl5dlcQB7GPEwCqjGViEbGVOWqrq7zBlcs5WzrhGkJ4niBGmvJN4HM8S6wVbSpB7rq6e4BoaFME3llyxhBaVLxQDZO6EBL4XwgydkB+IcSDtK3RixXjDoHS/wB2WLxAdm8+q2XGfFTnrdYzGEtMjRZciyVBivFsYR4W8un0SFDA5/E9xv1gD4WXXtLnh1/OY9N01i2GA5vmIUo0vwK8S4QYbUp6skiDrbluqt+IpOb4jkNpa61wZEc4IVs3iT2WBsen6Lz6tJ5zPosJ5iy0U/ZDgZni2ND4YzxRuPorT2XxT6D8rwQ10h3R209Vc0MTh2mGUGNJ3EDuSTdC4oQ/xNET8wFT5El1Qo8bu2XtLFAef6fT5J6lVEyN+3fudVjqeIe3LysZnfYd1d4PGS0H781kmaOI5xIR4tc1o+x1VdwxruRubiNDvMWP6JjE8QYGEusIMyY00PTRLcDxQcTkcHAGSWkWJOh5GJUuD2NSSQ3icI2c0AajRV1PDEvmJGxP+FpaGILnkZQ+IblAAI6uJIn0TbeGkeKGNJnwgiQBvmNp8k4wbIlOkZ11AgWH9xs2f9Rt5JrheEGdpLsxJH8rYH+43+ChisueSWTp4nPcfLIIV57MYUOfn8JDeQfH/IrbpmjDtg1dJlh+69UCK9wCiHgrejOwbWroXT3QzVSAm4r0oWeVIygYSeq8g3XkAL1ASSVU8Sd4SJurbG1g1UPE6/hJIXJJKjpi2L8NoOzaq2pUyX3mAqbg1SSSFoKJyieaIaKlsdYWgdSqviFdg3j4L2N4lkPh+SpqpfUMnN8gFrZlQ/Qqh9N7Rfcak2WMxxeXRMeQWnwr3NcAIje23UpHjdJrHZmixvP6pSjixxlTM89rmic0lFZRc4AzHyTL6zHN5Jd1ZoEAx1n6Keo7YGvgnn+aI5jX5JR2GOoa628kfDdWNN/9bj2hM0cE15m57p9L0HetlNSpEuEg872t5qzbhc/3MaJuphGsHfzny3Uhh3PDQGPibz4NPzTBjeFLgy1NMSxGEEACDGl/QW81S/xhpktc17R2LjfkRaLfJaT3WVxBfJ6CwGsbmU8xgcLskc3W1/ZOMQc6RgeIvDm5g4uMF7Q4mB1y6TdbLgnDW4fDtBlz3+J8HxTGkcgq3H8Ioio14JLc0uZtzMHqQDHVXJxpkEWGwF+0yVr4oiUraaGWF7TctpAzYQXuP5iSLlFoYqkDd5dHIBzTzmdFU/xF4DRN7kkm+v7J5j35JaGutcNAa4NjkQWuHcHTSFKVGcmcpvc93hYCCdWCm0DuWNIB7mVseH0wxgAF99Cs5wOkwvD4AOxHh9W3HoWjotSQR1WsPZEib6k8vko54UUJxVMkOXkoQZdcY5SQA5QgaqVRw2SedQLyEgHJC8lc7l5AysqPzu1QMXhc48RQ6NYZiVDGcQAC47VZOnzgPgMK1lmjVOYgyQJ0S3DcY14lo03RsZUgtgKo1Qndk30BB581U4kBg/mJ+AT9St4lmeOPdN9PRW2ksCStnMRjzMA2PLU/omsM4VKZa/X8P2Vl/wCKGbZN4bHEOBbJjc6egTi72KSrRHF4TI4jZCZhGkyb91d5m1NNfxJWpRa3SZ6WPr+H5oUaHYBuGAsIB6C46nYeZCawz2g2Jcekgeup8o7lKkGL+FvIDWOQ1PmfNMUQSNIbrB3H5nHXKPKdBuRcWjOSLSm+RLQCdoFifqet0DEOcbvfDToxvPnMSfL47BNabNNueggc4s1oufuUQPAg2k6SNBElx8ttvWKaslOjzH5Ww0ZY/E7foG7/AH5hr4oG5daNTbvAQq+YmSbmPLQmPX5obcACZc422PmVNPRVoWxBc8Q0HL0sSLwiU+HmCczhG3LoCrFrWgDl9j6oGIxLfvXom6QdrF6GGyakm+5lMUq3iDgbhKOeSNbKLHkXWMpFKNmlwGIzPDm2d+IaT1H3v1vrmPsDzWC4K+XhbxpkBacUrtkTVYPOcChPBXQ26K8BakAGMR2MXqdO6bLAkAm6mitpBHLAhvQMjbmvKOUryAMLj8UWSAqdlWrWeGsaIm5Wmx+BBlE4VhGMERcrhSbdHZ2SQ9hKApsASePrWF4uneJPiBuqx7DmErR+jMmCW3uZ3KpeNOzSSVa491plUtZmYmT6ob8BFeTMVGHMYNk1TblEvdA9CenP0RcQMjvDc89h5b+duiTqtc+86auOg++QTTobyWdLHERk8IGkan9fU8ydFYMqiPFAd+X/AOv8LP4eqGmGju46n/T+UfH5Kxw97nQbczy/z07hap2ZSVFiGzBPic7Qbdz05D6awrmQQDN7n8xG/YbIdxJJubecfICPUckNj3jxbzDe/PsAZ7lu0ptCsaZRy2Nz+KbyReD/AEtsTzPYFRdPidz8Inqbz3AdPcpd1dwFuw7c/O/qoU3vLb/mb8nfogTD4p8EmdLDyST8U42H3zRHUnEmTNyfUqVPCpMBZrn3GYwdfh/hdZQJNzdWTKI3CkaKTVjTEajYCVYbpzEA6FJ5IcsZGsTScBYMwW2ZCx3s8wzK0rKh0W3CvqY8j+xYsC45LMqFdY6TdakDjAFKUF4DdFw1EDCe95lT961IxmKm+wQA371q8q73q8gCrqVBmK9w6nLydghtpkST5KOEqlszuuXTOjwHxdSXoFV4Km1hBJOiVw7XOeSRYaXT8gSrPBbA15/qsri6jmuIBN9dytNj6oHL77LM8UJdMaHlv35pMEKPe3cz/SD8yPp8EMGb7DQaAdglWOyyNyue/ixQVQXJLrb6k6Aak9gJKeoVtCJjRg3gbnqT92SlMy3WM3rkBufMj/j1UqNTM7w6D6aBUnRLVlqDJDReLdzv8ZTGUGeTRlH1Pnc+YVXhKmUuPIGO5sPMTP8AamfekAeZP0WikZuIUslFpM1HY/GPqo0XyiMddCYmgzqXiPcqTWDRcL9/v71Ua1eLq8E0TLUOt0QXVjPRQNTeVnJlJAKjvzIbBJtcKdR4cU7wzCy8AbrF5ZrpGl4BhsrL2lWtQNGiDhaR0RK9LLuuqMaVHO3bsjnMrryUNlcIrXTdFARfUKKx0pV8l0QjsEWTYidJxBsuveTZdbUyhKir4kAG92vLucryAK/FGXQEFmHl7Rtug1a5BMandEoPdmBK5m0zoQzjSJgJLEeEAXMqOPxeQk7lJ1M72h0wm2FEeIPtAAVBUrScv6fFWeMnSVUYlgFwoZaWBDEsvZKZZMbkgDubJ/3lrqAYJLtIBjzt9Z8k0OxbFPiYmDAHRoENB6xc9Si4OoAg1hHWdUIMOyA8F2xwyzzdP+0W/wDY+inTMk9IVY3ERAjRo+Mn6phmJj76qrI6lmwphoEQqxmJsUSnUc5CYnEshWsJ6g9/v5oVZwnWyhk5nX6Ib6JNpQ5MFFAqleDH33UGgkwUR9KCCiZgFLyGESLGi260Psxh5f2WdYJK2XsoyCTCIr7Clou3Yci6BVY46q1eyUtUpHZdRiV7qYhQomE2/DuQ/clAHKRvop1XSV33JAlRDTKBHXsslwy6YcDuuVGQLIGdkdPgvIEFeQBSU2Fx7ao426JnBuaA6N15zAGyuWMcHQ2Z3jAc5wjQLwxgAAJ6QmeLGGqhcZ0RpjWUMY95IkWCq83mrCkQQRr1P0SNcgEgIGmLPZPdCc06dfl+6K56kQgBKpN7KdJwCbZTBQ34QSEws5lGY26elvoiU2DfmvNw+7SisYQIKCWyT6Qi265TkfJevCm1qKFYVryQJUm1efkl6h2UmnmgYV75Q2nmoueCLIrW6JMQTDC62/s9DW91jMJSkrW4N+WAqhsmRr2XRHMACr8LXsE4aocF0GVETfZcewHRRbK6x90AcNNe/houjPeECpiDGqdABqkHZAcAitkrj6RCQAoauqOVeQBR0XRIXn1vCei82ntKBXp2LVzKzdlSx/vHEONgksVgo0NkV0McYuoHFF1nW5JF/wCFdUrZfCPMoTXjdM4mjdK1MONkAyD3N2HZeLgB1XKdIzJNgjupyFSRLYoARcbqbXTY7ojqcITHgujknQrC4ZkTfRTz31sgB4ErrPG2ZTAYdUC6wwDKXcwA67D1U6wuOg+aQHA+URwlAw457JoD8SQHmNj6IrXpN7yUzRZKTAsuHgkq4a8yFXYQQJR6NQ5k1olm14X4m3T1NgBVZwV/hVqQBquhaMmdqCbBD9xl3RfeAKLnSmIC4LzGiF4hQY26LGHYLIb6wmEVxhKhuYpASkLy77kryAP/2Q==', 0, 0, 0),
(2, 'medico@comem.es', 'Barry', 'Allen', '$2y$13$8ulX2oxOIUdwtp79KIcwiej2QFvHrfjo5gGi7aXw1cJx9AC7Du4ca', 1, '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', 0, 0, 0),
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
