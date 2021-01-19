-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2021 a las 22:49:11
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
-- Base de datos: `librosbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `correo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nombre`, `apellidos`, `direccion`, `ciudad`, `estado`, `correo`) VALUES
(1, 'Missael', 'Peralta', 'Col Emiliano Zapata', 'Villa de Alvarez', 'Colima', 'rperalta0@ucol.mx'),
(2, 'Gabriela', 'Hernandez', 'Sevilla del Rio #334', 'Colima', 'Colima', 'gaby0032@gmail.com'),
(3, 'Rafael', 'Rios', 'Venustiano Carranza #114', 'Colima', 'Colima', 'rrios0220@gmail.com'),
(4, 'jose', 'Lozano', 'Benito Juarez #113', 'Zapopan', 'Guadalajara', 'joselo0990@gmail.com'),
(5, 'Antonio', 'Lopez', 'Ignacio Zaragoza #113', 'Puebla', 'Puebla', 'antonylo87@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idcompra` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fechadecompra` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idcompra`, `id_libro`, `id_cliente`, `fechadecompra`) VALUES
(1, 2, 1, '19 de enero del 2021'),
(2, 1, 2, '18 de enero del 2021'),
(3, 4, 3, '17 de enero del 2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `idlibro` int(11) NOT NULL,
  `titulo` varchar(35) DEFAULT NULL,
  `autor` varchar(35) DEFAULT NULL,
  `editorial` varchar(25) DEFAULT NULL,
  `precio` float(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`idlibro`, `titulo`, `autor`, `editorial`, `precio`) VALUES
(1, 'El señor de los anillos 1', 'J. R. R. Tolkien', ' George Allen & Unwin', 500.00),
(2, 'Harry Potter y la piedra filosofal', 'J. K. Rowling', ' Bloomsbury', 349.00),
(3, 'Cien años de soledad', 'Gabriel García Márquez', ' Sudamericana', 250.00),
(4, 'El diario de Ana Frank', 'Ana Frank', ' 1a', 200.00),
(5, 'Un mundo feliz', 'Aldous Huxley', ' Sudamericana', 260.00),
(6, 'Percy Jackson y el ladron del rayo', ' Rick Riordan', 'Miramax Books', 320.00),
(7, 'Los juegos del Hambre', 'Suzanne Collins', ' Scholastic Press', 230.00),
(8, 'Harry Potter y la cámara de los sec', ' J. K. Rowling', 'Bloomsbury', 300.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `id_libro` (`id_libro`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`idlibro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`idlibro`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`idcliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
