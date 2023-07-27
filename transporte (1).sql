-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-07-2023 a las 05:26:00
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `transporte`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL,
  `descripcion_categoria` varchar(500) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `imagen`) VALUES
(1, 'City', 'Este plan te daremos un tour por las zonas más conocidas y bonitas de la ciudad, recomendado para la primera visita.', 'city.png'),
(2, 'Arqueologia', 'Con este plan puedes viajar a todas las zonas arqueológicas antiguas de la zona. Ideal para vacaciones en familia.', 'arqueologia.png'),
(3, 'Playa', 'En este plan te ofrecemos llevarte a las playas más hermosas y famosas de Cancún. Ideal para los días soliados.', 'playa.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `detalles` varchar(300) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario_id`, `fecha`, `detalles`, `total`) VALUES
(29, 14, '2023-07-25 12:40:33', 'Transporte masivo x 1, Transporte de gran capacidad x 1', 1175);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion_producto` varchar(250) NOT NULL,
  `precio` decimal(7,3) NOT NULL,
  `imagen` varchar(300) NOT NULL,
  `id_categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `descripcion_producto`, `precio`, `imagen`, `id_categoria_id`) VALUES
(3, 'Transporte de gran capacidad', 'Tiene nueve pies de altura y 22 pies de largo', 1000.000, 'imagen3.png', 2),
(5, 'Ferry de pequeña capacidad', 'Tiene una capacidad de 500 pasajeros', 2500.000, 'barcopequeño.png', 3),
(6, 'Ferry de mediana capacidad', 'Tiene una capacidad de 1500 pasajeros', 3250.000, 'barcomediano.png', 3),
(24, 'Transporte Masivo', 'Tiene catorce pies de altura y treinta pies de largo', 200.000, 'descarga (3).jpg', 2),
(25, 'Transporte de pequeña capacidad', 'Este automovil cuenta con la capacidad de transportar a 4 personas', 100.000, 'carro-mitchell.jpg', 1),
(28, 'Transporte Pesado', 'Este transporte es eficiente para transportar turistas con equipaje pesado', 600.000, 'descarga (1).jpg', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `contrasenia` varchar(100) NOT NULL,
  `nivel` tinyint(4) NOT NULL DEFAULT 1,
  `estatus` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `correo_electronico`, `contrasenia`, `nivel`, `estatus`) VALUES
(1, 'juan', 'juan@gmail.com', '123', 1, 1),
(3, 'pepe', 'pepe@gmail.com', '123', 1, 1),
(4, 'angel', 'angel@gmail.com', '123', 2, 1),
(5, 'ismael', 'ismael@gmail.com', '123', 1, 1),
(6, 'jonathan', 'jonathan@gmail.com', '123', 1, 1),
(7, 'mateo', 'mateo@gmail.com', '123', 1, 1),
(8, 'jack', 'jack@gmail.com', '123', 1, 1),
(9, 'manuel', 'manuel@gmail.com', '123', 1, 1),
(10, 'david', 'david@gmail.com', '123', 1, 1),
(11, 'gerardo', 'gerardo@gmail.com', '123', 1, 1),
(12, 'anthony', 'anthony@gmail.com', '123', 1, 1),
(13, 'milton', 'milton@gmail.com', '123', 1, 1),
(14, 'andres', 'andres@gmail.com', '123', 1, 1),
(16, 'Jaime', 'jaime@gmail.com', '123', 1, 1),
(17, 'pedri', 'pedro@gmail.com', '123', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `FK_pedido_usuario` (`id_usuario_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `FK_Productos_Categorias` (`id_categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK_pedido_usuario` FOREIGN KEY (`id_usuario_id`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_Productos_Categorias` FOREIGN KEY (`id_categoria_id`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
