-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Jun-2022 às 20:29
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `restaurante`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Administrador'),
(2, 'Anfitrião'),
(6, 'Cliente'),
(3, 'Cozinha'),
(4, 'Garcon'),
(5, 'Limpeza');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 4, 9),
(10, 4, 10),
(11, 4, 11),
(12, 4, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 3, 17),
(18, 3, 18),
(19, 3, 19),
(20, 3, 20),
(21, 3, 21),
(22, 3, 22),
(23, 3, 23),
(24, 3, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 4, 33),
(34, 4, 34),
(35, 4, 35),
(36, 4, 36),
(37, 3, 37),
(38, 3, 38),
(39, 3, 39),
(40, 3, 40),
(41, 6, 41),
(42, 6, 42),
(43, 6, 43),
(44, 6, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56),
(57, 3, 57),
(58, 3, 58),
(59, 3, 59),
(60, 3, 60),
(61, 3, 61),
(62, 3, 62),
(64, 3, 64),
(65, 3, 65),
(66, 3, 66),
(67, 3, 67),
(68, 3, 68),
(69, 4, 69),
(70, 4, 70),
(71, 4, 71),
(72, 4, 72),
(73, 6, 73),
(74, 6, 74),
(75, 6, 75),
(76, 2, 76),
(77, 1, 77),
(78, 1, 78),
(79, 1, 79),
(80, 1, 80),
(81, 1, 81),
(82, 1, 82),
(83, 1, 83),
(84, 1, 84),
(85, 1, 85),
(86, 1, 86),
(87, 1, 87),
(88, 1, 88),
(89, 1, 89),
(90, 1, 90),
(91, 1, 91),
(92, 1, 92),
(93, 3, 93),
(94, 3, 94),
(95, 3, 95),
(96, 3, 96),
(97, 4, 97),
(98, 4, 98),
(99, 4, 99),
(100, 4, 100),
(101, 6, 48);

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add cadeira', 1, 'add_cadeira'),
(2, 'Can change cadeira', 1, 'change_cadeira'),
(3, 'Can delete cadeira', 1, 'delete_cadeira'),
(4, 'Can view cadeira', 1, 'view_cadeira'),
(5, 'Can add estadosmenu', 2, 'add_estadosmenu'),
(6, 'Can change estadosmenu', 2, 'change_estadosmenu'),
(7, 'Can delete estadosmenu', 2, 'delete_estadosmenu'),
(8, 'Can view estadosmenu', 2, 'view_estadosmenu'),
(9, 'Can add fatura', 3, 'add_fatura'),
(10, 'Can change fatura', 3, 'change_fatura'),
(11, 'Can delete fatura', 3, 'delete_fatura'),
(12, 'Can view fatura', 3, 'view_fatura'),
(13, 'Can add funcionario', 4, 'add_funcionario'),
(14, 'Can change funcionario', 4, 'change_funcionario'),
(15, 'Can delete funcionario', 4, 'delete_funcionario'),
(16, 'Can view funcionario', 4, 'view_funcionario'),
(17, 'Can add ingredientes', 5, 'add_ingredientes'),
(18, 'Can change ingredientes', 5, 'change_ingredientes'),
(19, 'Can delete ingredientes', 5, 'delete_ingredientes'),
(20, 'Can view ingredientes', 5, 'view_ingredientes'),
(21, 'Can add menurestaurante', 6, 'add_menurestaurante'),
(22, 'Can change menurestaurante', 6, 'change_menurestaurante'),
(23, 'Can delete menurestaurante', 6, 'delete_menurestaurante'),
(24, 'Can view menurestaurante', 6, 'view_menurestaurante'),
(25, 'Can add mesa', 7, 'add_mesa'),
(26, 'Can change mesa', 7, 'change_mesa'),
(27, 'Can delete mesa', 7, 'delete_mesa'),
(28, 'Can view mesa', 7, 'view_mesa'),
(29, 'Can add notificacao', 8, 'add_notificacao'),
(30, 'Can change notificacao', 8, 'change_notificacao'),
(31, 'Can delete notificacao', 8, 'delete_notificacao'),
(32, 'Can view notificacao', 8, 'view_notificacao'),
(33, 'Can add pedido', 9, 'add_pedido'),
(34, 'Can change pedido', 9, 'change_pedido'),
(35, 'Can delete pedido', 9, 'delete_pedido'),
(36, 'Can view pedido', 9, 'view_pedido'),
(37, 'Can add produto', 10, 'add_produto'),
(38, 'Can change produto', 10, 'change_produto'),
(39, 'Can delete produto', 10, 'delete_produto'),
(40, 'Can view produto', 10, 'view_produto'),
(41, 'Can add reserva', 11, 'add_reserva'),
(42, 'Can change reserva', 11, 'change_reserva'),
(43, 'Can delete reserva', 11, 'delete_reserva'),
(44, 'Can view reserva', 11, 'view_reserva'),
(45, 'Can add restaurante', 12, 'add_restaurante'),
(46, 'Can change restaurante', 12, 'change_restaurante'),
(47, 'Can delete restaurante', 12, 'delete_restaurante'),
(48, 'Can view restaurante', 12, 'view_restaurante'),
(49, 'Can add sala', 13, 'add_sala'),
(50, 'Can change sala', 13, 'change_sala'),
(51, 'Can delete sala', 13, 'delete_sala'),
(52, 'Can view sala', 13, 'view_sala'),
(53, 'Can add tipofuncionario', 14, 'add_tipofuncionario'),
(54, 'Can change tipofuncionario', 14, 'change_tipofuncionario'),
(55, 'Can delete tipofuncionario', 14, 'delete_tipofuncionario'),
(56, 'Can view tipofuncionario', 14, 'view_tipofuncionario'),
(57, 'Can add tipoproduto', 15, 'add_tipoproduto'),
(58, 'Can change tipoproduto', 15, 'change_tipoproduto'),
(59, 'Can delete tipoproduto', 15, 'delete_tipoproduto'),
(60, 'Can view tipoproduto', 15, 'view_tipoproduto'),
(61, 'Can add produto ingredientes', 16, 'add_produtoingredientes'),
(62, 'Can change produto ingredientes', 16, 'change_produtoingredientes'),
(63, 'Can delete produto ingredientes', 16, 'delete_produtoingredientes'),
(64, 'Can view produto ingredientes', 16, 'view_produtoingredientes'),
(65, 'Can add produto menurestaurante', 17, 'add_produtomenurestaurante'),
(66, 'Can change produto menurestaurante', 17, 'change_produtomenurestaurante'),
(67, 'Can delete produto menurestaurante', 17, 'delete_produtomenurestaurante'),
(68, 'Can view produto menurestaurante', 17, 'view_produtomenurestaurante'),
(69, 'Can add produto pedido', 18, 'add_produtopedido'),
(70, 'Can change produto pedido', 18, 'change_produtopedido'),
(71, 'Can delete produto pedido', 18, 'delete_produtopedido'),
(72, 'Can view produto pedido', 18, 'view_produtopedido'),
(73, 'Can add reserva mesa', 19, 'add_reservamesa'),
(74, 'Can change reserva mesa', 19, 'change_reservamesa'),
(75, 'Can delete reserva mesa', 19, 'delete_reservamesa'),
(76, 'Can view reserva mesa', 19, 'view_reservamesa'),
(77, 'Can add cliente', 20, 'add_cliente'),
(78, 'Can change cliente', 20, 'change_cliente'),
(79, 'Can delete cliente', 20, 'delete_cliente'),
(80, 'Can view cliente', 20, 'view_cliente'),
(81, 'Can add funcionario notificacao', 21, 'add_funcionarionotificacao'),
(82, 'Can change funcionario notificacao', 21, 'change_funcionarionotificacao'),
(83, 'Can delete funcionario notificacao', 21, 'delete_funcionarionotificacao'),
(84, 'Can view funcionario notificacao', 21, 'view_funcionarionotificacao'),
(85, 'Can add notificacao restaurante', 22, 'add_notificacaorestaurante'),
(86, 'Can change notificacao restaurante', 22, 'change_notificacaorestaurante'),
(87, 'Can delete notificacao restaurante', 22, 'delete_notificacaorestaurante'),
(88, 'Can view notificacao restaurante', 22, 'view_notificacaorestaurante'),
(89, 'Can add cadeira', 23, 'add_cadeira'),
(90, 'Can change cadeira', 23, 'change_cadeira'),
(91, 'Can delete cadeira', 23, 'delete_cadeira'),
(92, 'Can view cadeira', 23, 'view_cadeira'),
(93, 'Can add estadosmenu', 24, 'add_estadosmenu'),
(94, 'Can change estadosmenu', 24, 'change_estadosmenu'),
(95, 'Can delete estadosmenu', 24, 'delete_estadosmenu'),
(96, 'Can view estadosmenu', 24, 'view_estadosmenu'),
(97, 'Can add fatura', 25, 'add_fatura'),
(98, 'Can change fatura', 25, 'change_fatura'),
(99, 'Can delete fatura', 25, 'delete_fatura'),
(100, 'Can view fatura', 25, 'view_fatura'),
(101, 'Can add funcionario', 26, 'add_funcionario'),
(102, 'Can change funcionario', 26, 'change_funcionario'),
(103, 'Can delete funcionario', 26, 'delete_funcionario'),
(104, 'Can view funcionario', 26, 'view_funcionario'),
(105, 'Can add ingredientes', 27, 'add_ingredientes'),
(106, 'Can change ingredientes', 27, 'change_ingredientes'),
(107, 'Can delete ingredientes', 27, 'delete_ingredientes'),
(108, 'Can view ingredientes', 27, 'view_ingredientes'),
(109, 'Can add menurestaurante', 28, 'add_menurestaurante'),
(110, 'Can change menurestaurante', 28, 'change_menurestaurante'),
(111, 'Can delete menurestaurante', 28, 'delete_menurestaurante'),
(112, 'Can view menurestaurante', 28, 'view_menurestaurante'),
(113, 'Can add mesa', 29, 'add_mesa'),
(114, 'Can change mesa', 29, 'change_mesa'),
(115, 'Can delete mesa', 29, 'delete_mesa'),
(116, 'Can view mesa', 29, 'view_mesa'),
(117, 'Can add notificacao', 30, 'add_notificacao'),
(118, 'Can change notificacao', 30, 'change_notificacao'),
(119, 'Can delete notificacao', 30, 'delete_notificacao'),
(120, 'Can view notificacao', 30, 'view_notificacao'),
(121, 'Can add pedido', 31, 'add_pedido'),
(122, 'Can change pedido', 31, 'change_pedido'),
(123, 'Can delete pedido', 31, 'delete_pedido'),
(124, 'Can view pedido', 31, 'view_pedido'),
(125, 'Can add produto', 32, 'add_produto'),
(126, 'Can change produto', 32, 'change_produto'),
(127, 'Can delete produto', 32, 'delete_produto'),
(128, 'Can view produto', 32, 'view_produto'),
(129, 'Can add reserva', 33, 'add_reserva'),
(130, 'Can change reserva', 33, 'change_reserva'),
(131, 'Can delete reserva', 33, 'delete_reserva'),
(132, 'Can view reserva', 33, 'view_reserva'),
(133, 'Can add restaurante', 34, 'add_restaurante'),
(134, 'Can change restaurante', 34, 'change_restaurante'),
(135, 'Can delete restaurante', 34, 'delete_restaurante'),
(136, 'Can view restaurante', 34, 'view_restaurante'),
(137, 'Can add sala', 35, 'add_sala'),
(138, 'Can change sala', 35, 'change_sala'),
(139, 'Can delete sala', 35, 'delete_sala'),
(140, 'Can view sala', 35, 'view_sala'),
(141, 'Can add tipofuncionario', 36, 'add_tipofuncionario'),
(142, 'Can change tipofuncionario', 36, 'change_tipofuncionario'),
(143, 'Can delete tipofuncionario', 36, 'delete_tipofuncionario'),
(144, 'Can view tipofuncionario', 36, 'view_tipofuncionario'),
(145, 'Can add tipoproduto', 37, 'add_tipoproduto'),
(146, 'Can change tipoproduto', 37, 'change_tipoproduto'),
(147, 'Can delete tipoproduto', 37, 'delete_tipoproduto'),
(148, 'Can view tipoproduto', 37, 'view_tipoproduto'),
(149, 'Can add produto ingredientes', 38, 'add_produtoingredientes'),
(150, 'Can change produto ingredientes', 38, 'change_produtoingredientes'),
(151, 'Can delete produto ingredientes', 38, 'delete_produtoingredientes'),
(152, 'Can view produto ingredientes', 38, 'view_produtoingredientes'),
(153, 'Can add produto menurestaurante', 39, 'add_produtomenurestaurante'),
(154, 'Can change produto menurestaurante', 39, 'change_produtomenurestaurante'),
(155, 'Can delete produto menurestaurante', 39, 'delete_produtomenurestaurante'),
(156, 'Can view produto menurestaurante', 39, 'view_produtomenurestaurante'),
(157, 'Can add produto pedido', 40, 'add_produtopedido'),
(158, 'Can change produto pedido', 40, 'change_produtopedido'),
(159, 'Can delete produto pedido', 40, 'delete_produtopedido'),
(160, 'Can view produto pedido', 40, 'view_produtopedido'),
(161, 'Can add reserva mesa', 41, 'add_reservamesa'),
(162, 'Can change reserva mesa', 41, 'change_reservamesa'),
(163, 'Can delete reserva mesa', 41, 'delete_reservamesa'),
(164, 'Can view reserva mesa', 41, 'view_reservamesa'),
(165, 'Can add cliente', 42, 'add_cliente'),
(166, 'Can change cliente', 42, 'change_cliente'),
(167, 'Can delete cliente', 42, 'delete_cliente'),
(168, 'Can view cliente', 42, 'view_cliente'),
(169, 'Can add funcionario notificacao', 43, 'add_funcionarionotificacao'),
(170, 'Can change funcionario notificacao', 43, 'change_funcionarionotificacao'),
(171, 'Can delete funcionario notificacao', 43, 'delete_funcionarionotificacao'),
(172, 'Can view funcionario notificacao', 43, 'view_funcionarionotificacao'),
(173, 'Can add notificacao restaurante', 44, 'add_notificacaorestaurante'),
(174, 'Can change notificacao restaurante', 44, 'change_notificacaorestaurante'),
(175, 'Can delete notificacao restaurante', 44, 'delete_notificacaorestaurante'),
(176, 'Can view notificacao restaurante', 44, 'view_notificacaorestaurante'),
(177, 'Can add cadeira', 45, 'add_cadeira'),
(178, 'Can change cadeira', 45, 'change_cadeira'),
(179, 'Can delete cadeira', 45, 'delete_cadeira'),
(180, 'Can view cadeira', 45, 'view_cadeira'),
(181, 'Can add estadosmenu', 46, 'add_estadosmenu'),
(182, 'Can change estadosmenu', 46, 'change_estadosmenu'),
(183, 'Can delete estadosmenu', 46, 'delete_estadosmenu'),
(184, 'Can view estadosmenu', 46, 'view_estadosmenu'),
(185, 'Can add fatura', 47, 'add_fatura'),
(186, 'Can change fatura', 47, 'change_fatura'),
(187, 'Can delete fatura', 47, 'delete_fatura'),
(188, 'Can view fatura', 47, 'view_fatura'),
(189, 'Can add funcionario', 48, 'add_funcionario'),
(190, 'Can change funcionario', 48, 'change_funcionario'),
(191, 'Can delete funcionario', 48, 'delete_funcionario'),
(192, 'Can view funcionario', 48, 'view_funcionario'),
(193, 'Can add ingredientes', 49, 'add_ingredientes'),
(194, 'Can change ingredientes', 49, 'change_ingredientes'),
(195, 'Can delete ingredientes', 49, 'delete_ingredientes'),
(196, 'Can view ingredientes', 49, 'view_ingredientes'),
(197, 'Can add menurestaurante', 50, 'add_menurestaurante'),
(198, 'Can change menurestaurante', 50, 'change_menurestaurante'),
(199, 'Can delete menurestaurante', 50, 'delete_menurestaurante'),
(200, 'Can view menurestaurante', 50, 'view_menurestaurante'),
(201, 'Can add mesa', 51, 'add_mesa'),
(202, 'Can change mesa', 51, 'change_mesa'),
(203, 'Can delete mesa', 51, 'delete_mesa'),
(204, 'Can view mesa', 51, 'view_mesa'),
(205, 'Can add notificacao', 52, 'add_notificacao'),
(206, 'Can change notificacao', 52, 'change_notificacao'),
(207, 'Can delete notificacao', 52, 'delete_notificacao'),
(208, 'Can view notificacao', 52, 'view_notificacao'),
(209, 'Can add pedido', 53, 'add_pedido'),
(210, 'Can change pedido', 53, 'change_pedido'),
(211, 'Can delete pedido', 53, 'delete_pedido'),
(212, 'Can view pedido', 53, 'view_pedido'),
(213, 'Can add produto', 54, 'add_produto'),
(214, 'Can change produto', 54, 'change_produto'),
(215, 'Can delete produto', 54, 'delete_produto'),
(216, 'Can view produto', 54, 'view_produto'),
(217, 'Can add reserva', 55, 'add_reserva'),
(218, 'Can change reserva', 55, 'change_reserva'),
(219, 'Can delete reserva', 55, 'delete_reserva'),
(220, 'Can view reserva', 55, 'view_reserva'),
(221, 'Can add restaurante', 56, 'add_restaurante'),
(222, 'Can change restaurante', 56, 'change_restaurante'),
(223, 'Can delete restaurante', 56, 'delete_restaurante'),
(224, 'Can view restaurante', 56, 'view_restaurante'),
(225, 'Can add sala', 57, 'add_sala'),
(226, 'Can change sala', 57, 'change_sala'),
(227, 'Can delete sala', 57, 'delete_sala'),
(228, 'Can view sala', 57, 'view_sala'),
(229, 'Can add tipofuncionario', 58, 'add_tipofuncionario'),
(230, 'Can change tipofuncionario', 58, 'change_tipofuncionario'),
(231, 'Can delete tipofuncionario', 58, 'delete_tipofuncionario'),
(232, 'Can view tipofuncionario', 58, 'view_tipofuncionario'),
(233, 'Can add tipoproduto', 59, 'add_tipoproduto'),
(234, 'Can change tipoproduto', 59, 'change_tipoproduto'),
(235, 'Can delete tipoproduto', 59, 'delete_tipoproduto'),
(236, 'Can view tipoproduto', 59, 'view_tipoproduto'),
(237, 'Can add produto ingredientes', 60, 'add_produtoingredientes'),
(238, 'Can change produto ingredientes', 60, 'change_produtoingredientes'),
(239, 'Can delete produto ingredientes', 60, 'delete_produtoingredientes'),
(240, 'Can view produto ingredientes', 60, 'view_produtoingredientes'),
(241, 'Can add produto menurestaurante', 61, 'add_produtomenurestaurante'),
(242, 'Can change produto menurestaurante', 61, 'change_produtomenurestaurante'),
(243, 'Can delete produto menurestaurante', 61, 'delete_produtomenurestaurante'),
(244, 'Can view produto menurestaurante', 61, 'view_produtomenurestaurante'),
(245, 'Can add produto pedido', 62, 'add_produtopedido'),
(246, 'Can change produto pedido', 62, 'change_produtopedido'),
(247, 'Can delete produto pedido', 62, 'delete_produtopedido'),
(248, 'Can view produto pedido', 62, 'view_produtopedido'),
(249, 'Can add reserva mesa', 63, 'add_reservamesa'),
(250, 'Can change reserva mesa', 63, 'change_reservamesa'),
(251, 'Can delete reserva mesa', 63, 'delete_reservamesa'),
(252, 'Can view reserva mesa', 63, 'view_reservamesa'),
(253, 'Can add cliente', 64, 'add_cliente'),
(254, 'Can change cliente', 64, 'change_cliente'),
(255, 'Can delete cliente', 64, 'delete_cliente'),
(256, 'Can view cliente', 64, 'view_cliente'),
(257, 'Can add funcionario notificacao', 65, 'add_funcionarionotificacao'),
(258, 'Can change funcionario notificacao', 65, 'change_funcionarionotificacao'),
(259, 'Can delete funcionario notificacao', 65, 'delete_funcionarionotificacao'),
(260, 'Can view funcionario notificacao', 65, 'view_funcionarionotificacao'),
(261, 'Can add notificacao restaurante', 66, 'add_notificacaorestaurante'),
(262, 'Can change notificacao restaurante', 66, 'change_notificacaorestaurante'),
(263, 'Can delete notificacao restaurante', 66, 'delete_notificacaorestaurante'),
(264, 'Can view notificacao restaurante', 66, 'view_notificacaorestaurante'),
(265, 'Can add cadeira', 67, 'add_cadeira'),
(266, 'Can change cadeira', 67, 'change_cadeira'),
(267, 'Can delete cadeira', 67, 'delete_cadeira'),
(268, 'Can view cadeira', 67, 'view_cadeira'),
(269, 'Can add estadosmenu', 68, 'add_estadosmenu'),
(270, 'Can change estadosmenu', 68, 'change_estadosmenu'),
(271, 'Can delete estadosmenu', 68, 'delete_estadosmenu'),
(272, 'Can view estadosmenu', 68, 'view_estadosmenu'),
(273, 'Can add fatura', 69, 'add_fatura'),
(274, 'Can change fatura', 69, 'change_fatura'),
(275, 'Can delete fatura', 69, 'delete_fatura'),
(276, 'Can view fatura', 69, 'view_fatura'),
(277, 'Can add funcionario', 70, 'add_funcionario'),
(278, 'Can change funcionario', 70, 'change_funcionario'),
(279, 'Can delete funcionario', 70, 'delete_funcionario'),
(280, 'Can view funcionario', 70, 'view_funcionario'),
(281, 'Can add ingredientes', 71, 'add_ingredientes'),
(282, 'Can change ingredientes', 71, 'change_ingredientes'),
(283, 'Can delete ingredientes', 71, 'delete_ingredientes'),
(284, 'Can view ingredientes', 71, 'view_ingredientes'),
(285, 'Can add menurestaurante', 72, 'add_menurestaurante'),
(286, 'Can change menurestaurante', 72, 'change_menurestaurante'),
(287, 'Can delete menurestaurante', 72, 'delete_menurestaurante'),
(288, 'Can view menurestaurante', 72, 'view_menurestaurante'),
(289, 'Can add mesa', 73, 'add_mesa'),
(290, 'Can change mesa', 73, 'change_mesa'),
(291, 'Can delete mesa', 73, 'delete_mesa'),
(292, 'Can view mesa', 73, 'view_mesa'),
(293, 'Can add notificacao', 74, 'add_notificacao'),
(294, 'Can change notificacao', 74, 'change_notificacao'),
(295, 'Can delete notificacao', 74, 'delete_notificacao'),
(296, 'Can view notificacao', 74, 'view_notificacao'),
(297, 'Can add pedido', 75, 'add_pedido'),
(298, 'Can change pedido', 75, 'change_pedido'),
(299, 'Can delete pedido', 75, 'delete_pedido'),
(300, 'Can view pedido', 75, 'view_pedido'),
(301, 'Can add produto', 76, 'add_produto'),
(302, 'Can change produto', 76, 'change_produto'),
(303, 'Can delete produto', 76, 'delete_produto'),
(304, 'Can view produto', 76, 'view_produto'),
(305, 'Can add reserva', 77, 'add_reserva'),
(306, 'Can change reserva', 77, 'change_reserva'),
(307, 'Can delete reserva', 77, 'delete_reserva'),
(308, 'Can view reserva', 77, 'view_reserva'),
(309, 'Can add restaurante', 78, 'add_restaurante'),
(310, 'Can change restaurante', 78, 'change_restaurante'),
(311, 'Can delete restaurante', 78, 'delete_restaurante'),
(312, 'Can view restaurante', 78, 'view_restaurante'),
(313, 'Can add sala', 79, 'add_sala'),
(314, 'Can change sala', 79, 'change_sala'),
(315, 'Can delete sala', 79, 'delete_sala'),
(316, 'Can view sala', 79, 'view_sala'),
(317, 'Can add tipofuncionario', 80, 'add_tipofuncionario'),
(318, 'Can change tipofuncionario', 80, 'change_tipofuncionario'),
(319, 'Can delete tipofuncionario', 80, 'delete_tipofuncionario'),
(320, 'Can view tipofuncionario', 80, 'view_tipofuncionario'),
(321, 'Can add tipoproduto', 81, 'add_tipoproduto'),
(322, 'Can change tipoproduto', 81, 'change_tipoproduto'),
(323, 'Can delete tipoproduto', 81, 'delete_tipoproduto'),
(324, 'Can view tipoproduto', 81, 'view_tipoproduto'),
(325, 'Can add produto ingredientes', 82, 'add_produtoingredientes'),
(326, 'Can change produto ingredientes', 82, 'change_produtoingredientes'),
(327, 'Can delete produto ingredientes', 82, 'delete_produtoingredientes'),
(328, 'Can view produto ingredientes', 82, 'view_produtoingredientes'),
(329, 'Can add produto menurestaurante', 83, 'add_produtomenurestaurante'),
(330, 'Can change produto menurestaurante', 83, 'change_produtomenurestaurante'),
(331, 'Can delete produto menurestaurante', 83, 'delete_produtomenurestaurante'),
(332, 'Can view produto menurestaurante', 83, 'view_produtomenurestaurante'),
(333, 'Can add produto pedido', 84, 'add_produtopedido'),
(334, 'Can change produto pedido', 84, 'change_produtopedido'),
(335, 'Can delete produto pedido', 84, 'delete_produtopedido'),
(336, 'Can view produto pedido', 84, 'view_produtopedido'),
(337, 'Can add reserva mesa', 85, 'add_reservamesa'),
(338, 'Can change reserva mesa', 85, 'change_reservamesa'),
(339, 'Can delete reserva mesa', 85, 'delete_reservamesa'),
(340, 'Can view reserva mesa', 85, 'view_reservamesa'),
(341, 'Can add cliente', 86, 'add_cliente'),
(342, 'Can change cliente', 86, 'change_cliente'),
(343, 'Can delete cliente', 86, 'delete_cliente'),
(344, 'Can view cliente', 86, 'view_cliente'),
(345, 'Can add funcionario notificacao', 87, 'add_funcionarionotificacao'),
(346, 'Can change funcionario notificacao', 87, 'change_funcionarionotificacao'),
(347, 'Can delete funcionario notificacao', 87, 'delete_funcionarionotificacao'),
(348, 'Can view funcionario notificacao', 87, 'view_funcionarionotificacao'),
(349, 'Can add notificacao restaurante', 88, 'add_notificacaorestaurante'),
(350, 'Can change notificacao restaurante', 88, 'change_notificacaorestaurante'),
(351, 'Can delete notificacao restaurante', 88, 'delete_notificacaorestaurante'),
(352, 'Can view notificacao restaurante', 88, 'view_notificacaorestaurante'),
(353, 'Can add cadeira', 89, 'add_cadeira'),
(354, 'Can change cadeira', 89, 'change_cadeira'),
(355, 'Can delete cadeira', 89, 'delete_cadeira'),
(356, 'Can view cadeira', 89, 'view_cadeira'),
(357, 'Can add cliente', 90, 'add_cliente'),
(358, 'Can change cliente', 90, 'change_cliente'),
(359, 'Can delete cliente', 90, 'delete_cliente'),
(360, 'Can view cliente', 90, 'view_cliente'),
(361, 'Can add estadosmenu', 91, 'add_estadosmenu'),
(362, 'Can change estadosmenu', 91, 'change_estadosmenu'),
(363, 'Can delete estadosmenu', 91, 'delete_estadosmenu'),
(364, 'Can view estadosmenu', 91, 'view_estadosmenu'),
(365, 'Can add fatura', 92, 'add_fatura'),
(366, 'Can change fatura', 92, 'change_fatura'),
(367, 'Can delete fatura', 92, 'delete_fatura'),
(368, 'Can view fatura', 92, 'view_fatura'),
(369, 'Can add funcionario', 93, 'add_funcionario'),
(370, 'Can change funcionario', 93, 'change_funcionario'),
(371, 'Can delete funcionario', 93, 'delete_funcionario'),
(372, 'Can view funcionario', 93, 'view_funcionario'),
(373, 'Can add funcionario notificacao', 94, 'add_funcionarionotificacao'),
(374, 'Can change funcionario notificacao', 94, 'change_funcionarionotificacao'),
(375, 'Can delete funcionario notificacao', 94, 'delete_funcionarionotificacao'),
(376, 'Can view funcionario notificacao', 94, 'view_funcionarionotificacao'),
(377, 'Can add ingredientes', 95, 'add_ingredientes'),
(378, 'Can change ingredientes', 95, 'change_ingredientes'),
(379, 'Can delete ingredientes', 95, 'delete_ingredientes'),
(380, 'Can view ingredientes', 95, 'view_ingredientes'),
(381, 'Can add menurestaurante', 96, 'add_menurestaurante'),
(382, 'Can change menurestaurante', 96, 'change_menurestaurante'),
(383, 'Can delete menurestaurante', 96, 'delete_menurestaurante'),
(384, 'Can view menurestaurante', 96, 'view_menurestaurante'),
(385, 'Can add mesa', 97, 'add_mesa'),
(386, 'Can change mesa', 97, 'change_mesa'),
(387, 'Can delete mesa', 97, 'delete_mesa'),
(388, 'Can view mesa', 97, 'view_mesa'),
(389, 'Can add notificacao', 98, 'add_notificacao'),
(390, 'Can change notificacao', 98, 'change_notificacao'),
(391, 'Can delete notificacao', 98, 'delete_notificacao'),
(392, 'Can view notificacao', 98, 'view_notificacao'),
(393, 'Can add pedido', 99, 'add_pedido'),
(394, 'Can change pedido', 99, 'change_pedido'),
(395, 'Can delete pedido', 99, 'delete_pedido'),
(396, 'Can view pedido', 99, 'view_pedido'),
(397, 'Can add produto', 100, 'add_produto'),
(398, 'Can change produto', 100, 'change_produto'),
(399, 'Can delete produto', 100, 'delete_produto'),
(400, 'Can view produto', 100, 'view_produto'),
(401, 'Can add reserva', 101, 'add_reserva'),
(402, 'Can change reserva', 101, 'change_reserva'),
(403, 'Can delete reserva', 101, 'delete_reserva'),
(404, 'Can view reserva', 101, 'view_reserva'),
(405, 'Can add restaurante', 102, 'add_restaurante'),
(406, 'Can change restaurante', 102, 'change_restaurante'),
(407, 'Can delete restaurante', 102, 'delete_restaurante'),
(408, 'Can view restaurante', 102, 'view_restaurante'),
(409, 'Can add sala', 103, 'add_sala'),
(410, 'Can change sala', 103, 'change_sala'),
(411, 'Can delete sala', 103, 'delete_sala'),
(412, 'Can view sala', 103, 'view_sala'),
(413, 'Can add tipofuncionario', 104, 'add_tipofuncionario'),
(414, 'Can change tipofuncionario', 104, 'change_tipofuncionario'),
(415, 'Can delete tipofuncionario', 104, 'delete_tipofuncionario'),
(416, 'Can view tipofuncionario', 104, 'view_tipofuncionario'),
(417, 'Can add tipoproduto', 105, 'add_tipoproduto'),
(418, 'Can change tipoproduto', 105, 'change_tipoproduto'),
(419, 'Can delete tipoproduto', 105, 'delete_tipoproduto'),
(420, 'Can view tipoproduto', 105, 'view_tipoproduto'),
(421, 'Can add notificacao restaurante', 106, 'add_notificacaorestaurante'),
(422, 'Can change notificacao restaurante', 106, 'change_notificacaorestaurante'),
(423, 'Can delete notificacao restaurante', 106, 'delete_notificacaorestaurante'),
(424, 'Can view notificacao restaurante', 106, 'view_notificacaorestaurante'),
(425, 'Can add produto ingredientes', 107, 'add_produtoingredientes'),
(426, 'Can change produto ingredientes', 107, 'change_produtoingredientes'),
(427, 'Can delete produto ingredientes', 107, 'delete_produtoingredientes'),
(428, 'Can view produto ingredientes', 107, 'view_produtoingredientes'),
(429, 'Can add produto menurestaurante', 108, 'add_produtomenurestaurante'),
(430, 'Can change produto menurestaurante', 108, 'change_produtomenurestaurante'),
(431, 'Can delete produto menurestaurante', 108, 'delete_produtomenurestaurante'),
(432, 'Can view produto menurestaurante', 108, 'view_produtomenurestaurante'),
(433, 'Can add produto pedido', 109, 'add_produtopedido'),
(434, 'Can change produto pedido', 109, 'change_produtopedido'),
(435, 'Can delete produto pedido', 109, 'delete_produtopedido'),
(436, 'Can view produto pedido', 109, 'view_produtopedido'),
(437, 'Can add reserva mesa', 110, 'add_reservamesa'),
(438, 'Can change reserva mesa', 110, 'change_reservamesa'),
(439, 'Can delete reserva mesa', 110, 'delete_reservamesa'),
(440, 'Can view reserva mesa', 110, 'view_reservamesa'),
(441, 'Can add log entry', 111, 'add_logentry'),
(442, 'Can change log entry', 111, 'change_logentry'),
(443, 'Can delete log entry', 111, 'delete_logentry'),
(444, 'Can view log entry', 111, 'view_logentry'),
(445, 'Can add permission', 112, 'add_permission'),
(446, 'Can change permission', 112, 'change_permission'),
(447, 'Can delete permission', 112, 'delete_permission'),
(448, 'Can view permission', 112, 'view_permission'),
(449, 'Can add group', 113, 'add_group'),
(450, 'Can change group', 113, 'change_group'),
(451, 'Can delete group', 113, 'delete_group'),
(452, 'Can view group', 113, 'view_group'),
(453, 'Can add user', 114, 'add_user'),
(454, 'Can change user', 114, 'change_user'),
(455, 'Can delete user', 114, 'delete_user'),
(456, 'Can view user', 114, 'view_user'),
(457, 'Can add content type', 115, 'add_contenttype'),
(458, 'Can change content type', 115, 'change_contenttype'),
(459, 'Can delete content type', 115, 'delete_contenttype'),
(460, 'Can view content type', 115, 'view_contenttype'),
(461, 'Can add session', 116, 'add_session'),
(462, 'Can change session', 116, 'change_session'),
(463, 'Can delete session', 116, 'delete_session'),
(464, 'Can view session', 116, 'view_session'),
(465, 'Can add codigos_postais_parcial', 117, 'add_codigos_postais_parcial'),
(466, 'Can change codigos_postais_parcial', 117, 'change_codigos_postais_parcial'),
(467, 'Can delete codigos_postais_parcial', 117, 'delete_codigos_postais_parcial'),
(468, 'Can view codigos_postais_parcial', 117, 'view_codigos_postais_parcial'),
(469, 'Can add concelhos', 118, 'add_concelhos'),
(470, 'Can change concelhos', 118, 'change_concelhos'),
(471, 'Can delete concelhos', 118, 'delete_concelhos'),
(472, 'Can view concelhos', 118, 'view_concelhos'),
(473, 'Can add distritos', 119, 'add_distritos'),
(474, 'Can change distritos', 119, 'change_distritos'),
(475, 'Can delete distritos', 119, 'delete_distritos'),
(476, 'Can view distritos', 119, 'view_distritos'),
(477, 'Can add cadeira', 120, 'add_cadeira'),
(478, 'Can change cadeira', 120, 'change_cadeira'),
(479, 'Can delete cadeira', 120, 'delete_cadeira'),
(480, 'Can view cadeira', 120, 'view_cadeira'),
(481, 'Can add estadosmenu', 121, 'add_estadosmenu'),
(482, 'Can change estadosmenu', 121, 'change_estadosmenu'),
(483, 'Can delete estadosmenu', 121, 'delete_estadosmenu'),
(484, 'Can view estadosmenu', 121, 'view_estadosmenu'),
(485, 'Can add fatura', 122, 'add_fatura'),
(486, 'Can change fatura', 122, 'change_fatura'),
(487, 'Can delete fatura', 122, 'delete_fatura'),
(488, 'Can view fatura', 122, 'view_fatura'),
(489, 'Can add funcionario', 123, 'add_funcionario'),
(490, 'Can change funcionario', 123, 'change_funcionario'),
(491, 'Can delete funcionario', 123, 'delete_funcionario'),
(492, 'Can view funcionario', 123, 'view_funcionario'),
(493, 'Can add funcionario notificacao', 124, 'add_funcionarionotificacao'),
(494, 'Can change funcionario notificacao', 124, 'change_funcionarionotificacao'),
(495, 'Can delete funcionario notificacao', 124, 'delete_funcionarionotificacao'),
(496, 'Can view funcionario notificacao', 124, 'view_funcionarionotificacao'),
(497, 'Can add ingredientes', 125, 'add_ingredientes'),
(498, 'Can change ingredientes', 125, 'change_ingredientes'),
(499, 'Can delete ingredientes', 125, 'delete_ingredientes'),
(500, 'Can view ingredientes', 125, 'view_ingredientes'),
(501, 'Can add menurestaurante', 126, 'add_menurestaurante'),
(502, 'Can change menurestaurante', 126, 'change_menurestaurante'),
(503, 'Can delete menurestaurante', 126, 'delete_menurestaurante'),
(504, 'Can view menurestaurante', 126, 'view_menurestaurante'),
(505, 'Can add mesa', 127, 'add_mesa'),
(506, 'Can change mesa', 127, 'change_mesa'),
(507, 'Can delete mesa', 127, 'delete_mesa'),
(508, 'Can view mesa', 127, 'view_mesa'),
(509, 'Can add pedido', 128, 'add_pedido'),
(510, 'Can change pedido', 128, 'change_pedido'),
(511, 'Can delete pedido', 128, 'delete_pedido'),
(512, 'Can view pedido', 128, 'view_pedido'),
(513, 'Can add restaurante', 129, 'add_restaurante'),
(514, 'Can change restaurante', 129, 'change_restaurante'),
(515, 'Can delete restaurante', 129, 'delete_restaurante'),
(516, 'Can view restaurante', 129, 'view_restaurante'),
(517, 'Can add sala', 130, 'add_sala'),
(518, 'Can change sala', 130, 'change_sala'),
(519, 'Can delete sala', 130, 'delete_sala'),
(520, 'Can view sala', 130, 'view_sala'),
(521, 'Can add tipofuncionario', 131, 'add_tipofuncionario'),
(522, 'Can change tipofuncionario', 131, 'change_tipofuncionario'),
(523, 'Can delete tipofuncionario', 131, 'delete_tipofuncionario'),
(524, 'Can view tipofuncionario', 131, 'view_tipofuncionario'),
(525, 'Can add tipoproduto', 132, 'add_tipoproduto'),
(526, 'Can change tipoproduto', 132, 'change_tipoproduto'),
(527, 'Can delete tipoproduto', 132, 'delete_tipoproduto'),
(528, 'Can view tipoproduto', 132, 'view_tipoproduto'),
(529, 'Can add notificacao', 133, 'add_notificacao'),
(530, 'Can change notificacao', 133, 'change_notificacao'),
(531, 'Can delete notificacao', 133, 'delete_notificacao'),
(532, 'Can view notificacao', 133, 'view_notificacao'),
(533, 'Can add notificacao restaurante', 134, 'add_notificacaorestaurante'),
(534, 'Can change notificacao restaurante', 134, 'change_notificacaorestaurante'),
(535, 'Can delete notificacao restaurante', 134, 'delete_notificacaorestaurante'),
(536, 'Can view notificacao restaurante', 134, 'view_notificacaorestaurante'),
(537, 'Can add produto', 135, 'add_produto'),
(538, 'Can change produto', 135, 'change_produto'),
(539, 'Can delete produto', 135, 'delete_produto'),
(540, 'Can view produto', 135, 'view_produto'),
(541, 'Can add produto ingredientes', 136, 'add_produtoingredientes'),
(542, 'Can change produto ingredientes', 136, 'change_produtoingredientes'),
(543, 'Can delete produto ingredientes', 136, 'delete_produtoingredientes'),
(544, 'Can view produto ingredientes', 136, 'view_produtoingredientes'),
(545, 'Can add produto pedido', 137, 'add_produtopedido'),
(546, 'Can change produto pedido', 137, 'change_produtopedido'),
(547, 'Can delete produto pedido', 137, 'delete_produtopedido'),
(548, 'Can view produto pedido', 137, 'view_produtopedido'),
(549, 'Can add produto menurestaurante', 138, 'add_produtomenurestaurante'),
(550, 'Can change produto menurestaurante', 138, 'change_produtomenurestaurante'),
(551, 'Can delete produto menurestaurante', 138, 'delete_produtomenurestaurante'),
(552, 'Can view produto menurestaurante', 138, 'view_produtomenurestaurante'),
(553, 'Can add reserva mesa', 139, 'add_reservamesa'),
(554, 'Can change reserva mesa', 139, 'change_reservamesa'),
(555, 'Can delete reserva mesa', 139, 'delete_reservamesa'),
(556, 'Can view reserva mesa', 139, 'view_reservamesa'),
(557, 'Can add reserva', 140, 'add_reserva'),
(558, 'Can change reserva', 140, 'change_reserva'),
(559, 'Can delete reserva', 140, 'delete_reserva'),
(560, 'Can view reserva', 140, 'view_reserva');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadeira`
--

CREATE TABLE `cadeira` (
  `ID` int(10) NOT NULL,
  `MesaID` int(10) NOT NULL,
  `Ocupado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cadeira`
--

INSERT INTO `cadeira` (`ID`, `MesaID`, `Ocupado`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 0),
(4, 1, 0),
(5, 2, 0),
(6, 2, 0),
(7, 2, 0),
(8, 2, 0),
(9, 2, 0),
(10, 2, 0),
(11, 2, 0),
(12, 2, 0),
(13, 3, 0),
(14, 3, 0),
(15, 3, 0),
(16, 3, 0),
(17, 4, 0),
(18, 4, 0),
(19, 4, 0),
(20, 4, 0),
(21, 5, 0),
(22, 5, 0),
(23, 5, 0),
(24, 5, 0),
(25, 6, 0),
(26, 6, 0),
(27, 6, 0),
(28, 6, 0),
(39, 8, 0),
(40, 8, 0),
(41, 8, 0),
(42, 8, 0),
(43, 8, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `codigos_postais_parcial`
--

CREATE TABLE `codigos_postais_parcial` (
  `cod_distrito` int(1) DEFAULT NULL,
  `cod_concelho` int(2) DEFAULT NULL,
  `nome_localidade` varchar(27) DEFAULT NULL,
  `num_cod_postal` int(4) DEFAULT NULL,
  `ext_cod_postal` int(3) DEFAULT NULL,
  `desig_postal` varchar(12) DEFAULT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `codigos_postais_parcial`
--

INSERT INTO `codigos_postais_parcial` (`cod_distrito`, `cod_concelho`, `nome_localidade`, `num_cod_postal`, `ext_cod_postal`, `desig_postal`, `ID`) VALUES
(8, 10, 'Olhão', 8700, 480, 'OLHÃO', 1),
(8, 10, 'Olhão', 8700, 535, 'OLHÃO', 2),
(8, 10, 'Olhão', 8700, 566, 'OLHÃO', 3),
(8, 10, 'Olhão', 8700, 301, 'OLHÃO', 4),
(8, 10, 'Olhão', 8700, 300, 'OLHÃO', 5),
(8, 10, 'Olhão', 8700, 484, 'OLHÃO', 6),
(8, 10, 'Olhão', 8700, 502, 'OLHÃO', 7),
(8, 10, 'Olhão', 8700, 468, 'OLHÃO', 8),
(8, 10, 'Olhão', 8700, 450, 'OLHÃO', 9),
(8, 10, 'Olhão', 8700, 340, 'OLHÃO', 10),
(8, 10, 'Olhão', 8700, 545, 'OLHÃO', 11),
(8, 10, 'Olhão', 8700, 556, 'OLHÃO', 12),
(8, 10, 'Olhão', 8700, 367, 'OLHÃO', 13),
(8, 10, 'Olhão', 8700, 389, 'OLHÃO', 14),
(8, 10, 'Olhão', 8700, 444, 'OLHÃO', 15),
(8, 10, 'Olhão', 8700, 328, 'OLHÃO', 16),
(8, 10, 'Olhão', 8700, 519, 'OLHÃO', 17),
(8, 10, 'Olhão', 8700, 504, 'OLHÃO', 18),
(8, 10, 'Olhão', 8700, 326, 'OLHÃO', 19),
(8, 10, 'Olhão', 8700, 466, 'OLHÃO', 20),
(8, 10, 'Olhão', 8700, 390, 'OLHÃO', 21),
(8, 10, 'Olhão', 8700, 568, 'OLHÃO', 22),
(8, 10, 'Olhão', 8700, 421, 'OLHÃO', 23),
(8, 10, 'Olhão', 8700, 253, 'OLHÃO', 24),
(8, 10, 'Olhão', 8700, 239, 'OLHÃO', 25),
(8, 10, 'Olhão', 8700, 388, 'OLHÃO', 26),
(8, 10, 'Olhão', 8700, 386, 'OLHÃO', 27),
(8, 10, 'Olhão', 8700, 387, 'OLHÃO', 28),
(8, 10, 'Olhão', 8700, 385, 'OLHÃO', 29),
(8, 10, 'Olhão', 8700, 449, 'OLHÃO', 30),
(8, 10, 'Olhão', 8700, 398, 'OLHÃO', 31),
(8, 10, 'Olhão', 8700, 567, 'OLHÃO', 32),
(8, 10, 'Olhão', 8700, 361, 'OLHÃO', 33),
(8, 10, 'Olhão', 8700, 320, 'OLHÃO', 34),
(8, 10, 'Olhão', 8700, 363, 'OLHÃO', 35),
(8, 10, 'Olhão', 8700, 365, 'OLHÃO', 36),
(8, 10, 'Olhão', 8700, 366, 'OLHÃO', 37),
(8, 10, 'Olhão', 8700, 364, 'OLHÃO', 38),
(8, 10, 'Olhão', 8700, 422, 'OLHÃO', 39),
(8, 10, 'Olhão', 8700, 378, 'OLHÃO', 40),
(8, 10, 'Olhão', 8700, 376, 'OLHÃO', 41),
(8, 10, 'Olhão', 8700, 377, 'OLHÃO', 42),
(8, 10, 'Olhão', 8700, 515, 'OLHÃO', 43),
(8, 10, 'Olhão', 8700, 354, 'OLHÃO', 44),
(8, 10, 'Olhão', 8700, 457, 'OLHÃO', 45),
(8, 10, 'Olhão', 8700, 336, 'OLHÃO', 46),
(8, 10, 'Olhão', 8700, 579, 'OLHÃO', 47),
(8, 10, 'Olhão', 8700, 557, 'OLHÃO', 48),
(8, 10, 'Olhão', 8700, 550, 'OLHÃO', 49),
(8, 10, 'Olhão', 8700, 475, 'OLHÃO', 50),
(8, 10, 'Olhão', 8700, 477, 'OLHÃO', 51),
(8, 10, 'Olhão', 8700, 478, 'OLHÃO', 52),
(8, 10, 'Olhão', 8700, 476, 'OLHÃO', 53),
(8, 10, 'Olhão', 8700, 486, 'OLHÃO', 54),
(8, 10, 'Olhão', 8700, 307, 'OLHÃO', 55),
(8, 10, 'Olhão', 8700, 306, 'OLHÃO', 56),
(8, 10, 'Olhão', 8700, 304, 'OLHÃO', 57),
(8, 10, 'Olhão', 8700, 302, 'OLHÃO', 58),
(8, 10, 'Olhão', 8700, 498, 'OLHÃO', 59),
(8, 10, 'Olhão', 8700, 358, 'OLHÃO', 60),
(8, 10, 'Olhão', 8700, 472, 'OLHÃO', 61),
(8, 10, 'Olhão', 8700, 381, 'OLHÃO', 62),
(8, 10, 'Olhão', 8700, 485, 'OLHÃO', 63),
(8, 10, 'Olhão', 8700, 292, 'OLHÃO', 64),
(8, 10, 'Olhão', 8700, 281, 'OLHÃO', 65),
(8, 10, 'Olhão', 8700, 479, 'OLHÃO', 66),
(8, 10, 'Olhão', 8700, 380, 'OLHÃO', 67),
(8, 10, 'Olhão', 8700, 330, 'OLHÃO', 68),
(8, 10, 'Olhão', 8700, 518, 'OLHÃO', 69),
(8, 10, 'Olhão', 8700, 497, 'OLHÃO', 70),
(8, 10, 'Olhão', 8700, 384, 'OLHÃO', 71),
(8, 10, 'Olhão', 8700, 464, 'OLHÃO', 72),
(8, 10, 'Olhão', 8700, 230, 'OLHÃO', 73),
(8, 10, 'Olhão', 8700, 334, 'OLHÃO', 74),
(8, 10, 'Olhão', 8700, 373, 'OLHÃO', 75),
(8, 10, 'Olhão', 8700, 513, 'OLHÃO', 76),
(8, 10, 'Olhão', 8700, 374, 'OLHÃO', 77),
(8, 10, 'Olhão', 8700, 473, 'OLHÃO', 78),
(8, 10, 'Olhão', 8700, 440, 'OLHÃO', 79),
(8, 10, 'Olhão', 8700, 348, 'OLHÃO', 80),
(8, 10, 'Olhão', 8700, 313, 'OLHÃO', 81),
(8, 10, 'Olhão', 8700, 399, 'OLHÃO', 82),
(8, 10, 'Olhão', 8700, 337, 'OLHÃO', 83),
(8, 10, 'Olhão', 8700, 329, 'OLHÃO', 84),
(8, 10, 'Olhão', 8700, 371, 'OLHÃO', 85),
(8, 10, 'Olhão', 8700, 510, 'OLHÃO', 86),
(8, 10, 'Olhão', 8700, 134, 'OLHÃO', 87),
(8, 10, 'Olhão', 8700, 514, 'OLHÃO', 88),
(8, 10, 'Olhão', 8700, 314, 'OLHÃO', 89),
(8, 10, 'Olhão', 8700, 425, 'OLHÃO', 90),
(8, 10, 'Olhão', 8700, 491, 'OLHÃO', 91),
(8, 10, 'Olhão', 8700, 521, 'OLHÃO', 92),
(8, 10, 'Olhão', 8700, 240, 'OLHÃO', 93),
(8, 10, 'Olhão', 8700, 407, 'OLHÃO', 94),
(8, 10, 'Olhão', 8700, 508, 'OLHÃO', 95),
(8, 10, 'Olhão', 8700, 559, 'OLHÃO', 96),
(8, 10, 'Olhão', 8700, 470, 'OLHÃO', 97),
(8, 10, 'Olhão', 8700, 443, 'OLHÃO', 98),
(8, 10, 'Olhão', 8700, 437, 'OLHÃO', 99),
(8, 10, 'Olhão', 8700, 332, 'OLHÃO', 100),
(8, 10, 'Olhão', 8700, 445, 'OLHÃO', 101),
(8, 10, 'Olhão', 8700, 339, 'OLHÃO', 102),
(8, 10, 'Olhão', 8700, 511, 'OLHÃO', 103),
(8, 10, 'Olhão', 8700, 554, 'OLHÃO', 104),
(8, 10, 'Olhão', 8700, 352, 'OLHÃO', 105),
(8, 10, 'Olhão', 8700, 525, 'OLHÃO', 106),
(8, 10, 'Olhão', 8700, 446, 'OLHÃO', 107),
(8, 10, 'Olhão', 8700, 359, 'OLHÃO', 108),
(8, 10, 'Olhão', 8700, 249, 'OLHÃO', 109),
(8, 10, 'Olhão', 8700, 524, 'OLHÃO', 110),
(8, 10, 'Olhão', 8700, 528, 'OLHÃO', 111),
(8, 10, 'Olhão', 8700, 344, 'OLHÃO', 112),
(8, 10, 'Olhão', 8700, 327, 'OLHÃO', 113),
(8, 10, 'Olhão', 8700, 560, 'OLHÃO', 114),
(8, 10, 'Olhão', 8700, 370, 'OLHÃO', 115),
(8, 10, 'Olhão', 8700, 439, 'OLHÃO', 116),
(8, 10, 'Olhão', 8700, 495, 'OLHÃO', 117),
(8, 10, 'Olhão', 8700, 360, 'OLHÃO', 118),
(8, 10, 'Olhão', 8700, 496, 'OLHÃO', 119),
(8, 10, 'Olhão', 8700, 221, 'OLHÃO', 120),
(8, 10, 'Olhão', 8700, 430, 'OLHÃO', 121),
(8, 10, 'Olhão', 8700, 357, 'OLHÃO', 122),
(8, 10, 'Olhão', 8700, 312, 'OLHÃO', 123),
(8, 10, 'Olhão', 8700, 395, 'OLHÃO', 124),
(8, 10, 'Olhão', 8700, 436, 'OLHÃO', 125),
(8, 10, 'Olhão', 8700, 551, 'OLHÃO', 126),
(8, 10, 'Olhão', 8700, 565, 'OLHÃO', 127),
(8, 10, 'Olhão', 8700, 343, 'OLHÃO', 128),
(8, 10, 'Olhão', 8700, 553, 'OLHÃO', 129),
(8, 10, 'Olhão', 8700, 409, 'OLHÃO', 130),
(8, 10, 'Olhão', 8700, 493, 'OLHÃO', 131),
(8, 10, 'Olhão', 8700, 346, 'OLHÃO', 132),
(8, 10, 'Olhão', 8700, 408, 'OLHÃO', 133),
(8, 10, 'Olhão', 8700, 431, 'OLHÃO', 134),
(8, 10, 'Olhão', 8700, 420, 'OLHÃO', 135),
(8, 10, 'Olhão', 8700, 469, 'OLHÃO', 136),
(8, 10, 'Olhão', 8700, 423, 'OLHÃO', 137),
(8, 10, 'Olhão', 8700, 487, 'OLHÃO', 138),
(8, 10, 'Olhão', 8700, 499, 'OLHÃO', 139),
(8, 10, 'Olhão', 8700, 372, 'OLHÃO', 140),
(8, 10, 'Olhão', 8700, 584, 'OLHÃO', 141),
(8, 10, 'Olhão', 8700, 489, 'OLHÃO', 142),
(8, 10, 'Olhão', 8700, 219, 'OLHÃO', 143),
(8, 10, 'Olhão', 8700, 995, 'OLHÃO', 144),
(8, 10, 'Olhão', 8700, 0, 'OLHÃO', 145),
(8, 10, 'Olhão', 8700, 263, 'OLHÃO', 146),
(8, 10, 'Olhão', 8700, 413, 'OLHÃO', 147),
(8, 10, 'Olhão', 8700, 415, 'OLHÃO', 148),
(8, 10, 'Olhão', 8700, 414, 'OLHÃO', 149),
(8, 10, 'Olhão', 8700, 509, 'OLHÃO', 150),
(8, 10, 'Olhão', 8700, 204, 'OLHÃO', 151),
(8, 10, 'Olhão', 8700, 214, 'OLHÃO', 152),
(8, 10, 'Olhão', 8700, 209, 'OLHÃO', 153),
(8, 10, 'Olhão', 8700, 517, 'OLHÃO', 154),
(8, 10, 'Olhão', 8700, 271, 'OLHÃO', 155),
(8, 10, 'Olhão', 8700, 212, 'OLHÃO', 156),
(8, 10, 'Olhão', 8700, 216, 'OLHÃO', 157),
(8, 10, 'Olhão', 8700, 276, 'OLHÃO', 158),
(8, 10, 'Olhão', 8700, 211, 'OLHÃO', 159),
(8, 10, 'Olhão', 8700, 203, 'OLHÃO', 160),
(8, 10, 'Olhão', 8700, 208, 'OLHÃO', 161),
(8, 10, 'Olhão', 8700, 205, 'OLHÃO', 162),
(8, 10, 'Olhão', 8700, 210, 'OLHÃO', 163),
(8, 10, 'Olhão', 8700, 277, 'OLHÃO', 164),
(8, 10, 'Olhão', 8700, 217, 'OLHÃO', 165),
(8, 10, 'Olhão', 8700, 213, 'OLHÃO', 166),
(8, 10, 'Olhão', 8700, 456, 'OLHÃO', 167),
(8, 10, 'Olhão', 8700, 424, 'OLHÃO', 168),
(8, 10, 'Olhão', 8700, 555, 'OLHÃO', 169),
(8, 10, 'Olhão', 8700, 391, 'OLHÃO', 170),
(8, 10, 'Olhão', 8700, 356, 'OLHÃO', 171),
(8, 10, 'Olhão', 8700, 392, 'OLHÃO', 172),
(8, 10, 'Olhão', 8700, 429, 'OLHÃO', 173),
(8, 10, 'Olhão', 8700, 410, 'OLHÃO', 174),
(8, 10, 'Olhão', 8700, 522, 'OLHÃO', 175),
(8, 10, 'Olhão', 8700, 237, 'OLHÃO', 176),
(8, 10, 'Olhão', 8700, 379, 'OLHÃO', 177),
(8, 10, 'Olhão', 8700, 236, 'OLHÃO', 178),
(8, 10, 'Olhão', 8700, 507, 'OLHÃO', 179),
(8, 10, 'Olhão', 8700, 474, 'OLHÃO', 180),
(8, 10, 'Olhão', 8700, 467, 'OLHÃO', 181),
(8, 10, 'Olhão', 8700, 442, 'OLHÃO', 182),
(8, 10, 'Olhão', 8700, 331, 'OLHÃO', 183),
(8, 10, 'Olhão', 8700, 562, 'OLHÃO', 184),
(8, 10, 'Olhão', 8700, 523, 'OLHÃO', 185),
(8, 10, 'Olhão', 8700, 355, 'OLHÃO', 186),
(8, 10, 'Olhão', 8700, 506, 'OLHÃO', 187),
(8, 10, 'Olhão', 8700, 393, 'OLHÃO', 188),
(8, 10, 'Olhão', 8700, 321, 'OLHÃO', 189),
(8, 10, 'Olhão', 8700, 438, 'OLHÃO', 190),
(8, 10, 'Olhão', 8700, 416, 'OLHÃO', 191),
(8, 10, 'Olhão', 8700, 563, 'OLHÃO', 192),
(8, 10, 'Olhão', 8700, 311, 'OLHÃO', 193),
(8, 10, 'Olhão', 8700, 318, 'OLHÃO', 194),
(8, 10, 'Olhão', 8700, 260, 'OLHÃO', 195),
(8, 10, 'Olhão', 8700, 432, 'OLHÃO', 196),
(8, 10, 'Olhão', 8700, 533, 'OLHÃO', 197),
(8, 10, 'Olhão', 8700, 223, 'OLHÃO', 198),
(8, 10, 'Olhão', 8700, 541, 'OLHÃO', 199),
(8, 10, 'Olhão', 8700, 471, 'OLHÃO', 200),
(8, 10, 'Olhão', 8700, 547, 'OLHÃO', 201),
(8, 10, 'Olhão', 8700, 433, 'OLHÃO', 202),
(8, 10, 'Olhão', 8700, 417, 'OLHÃO', 203),
(8, 10, 'Olhão', 8700, 238, 'OLHÃO', 204),
(8, 10, 'Olhão', 8700, 258, 'OLHÃO', 205),
(8, 10, 'Olhão', 8700, 353, 'OLHÃO', 206),
(8, 10, 'Olhão', 8700, 317, 'OLHÃO', 207),
(8, 10, 'Olhão', 8700, 315, 'OLHÃO', 208),
(8, 10, 'Olhão', 8700, 338, 'OLHÃO', 209),
(8, 10, 'Olhão', 8700, 394, 'OLHÃO', 210),
(8, 10, 'Olhão', 8700, 137, 'OLHÃO', 211),
(8, 10, 'Olhão', 8700, 142, 'OLHÃO', 212),
(8, 10, 'Olhão', 8700, 146, 'OLHÃO', 213),
(8, 10, 'Olhão', 8700, 148, 'OLHÃO', 214),
(8, 10, 'Olhão', 8700, 135, 'OLHÃO', 215),
(8, 10, 'Olhão', 8700, 145, 'OLHÃO', 216),
(8, 10, 'Olhão', 8700, 138, 'OLHÃO', 217),
(8, 10, 'Olhão', 8700, 139, 'OLHÃO', 218),
(8, 10, 'Olhão', 8700, 140, 'OLHÃO', 219),
(8, 10, 'Olhão', 8700, 141, 'OLHÃO', 220),
(8, 10, 'Olhão', 8700, 136, 'OLHÃO', 221),
(8, 10, 'Olhão', 8700, 150, 'OLHÃO', 222),
(8, 10, 'Olhão', 8700, 527, 'OLHÃO', 223),
(8, 10, 'Olhão', 8700, 333, 'OLHÃO', 224),
(8, 10, 'Olhão', 8700, 458, 'OLHÃO', 225),
(8, 10, 'Olhão', 8700, 483, 'OLHÃO', 226),
(8, 10, 'Olhão', 8700, 532, 'OLHÃO', 227),
(8, 10, 'Olhão', 8700, 538, 'OLHÃO', 228),
(8, 10, 'Olhão', 8700, 403, 'OLHÃO', 229),
(8, 10, 'Olhão', 8700, 405, 'OLHÃO', 230),
(8, 10, 'Olhão', 8700, 404, 'OLHÃO', 231),
(8, 10, 'Olhão', 8700, 406, 'OLHÃO', 232),
(8, 10, 'Olhão', 8700, 459, 'OLHÃO', 233),
(8, 10, 'Olhão', 8700, 463, 'OLHÃO', 234),
(8, 10, 'Olhão', 8700, 461, 'OLHÃO', 235),
(8, 10, 'Olhão', 8700, 462, 'OLHÃO', 236),
(8, 10, 'Olhão', 8700, 460, 'OLHÃO', 237),
(8, 10, 'Olhão', 8700, 441, 'OLHÃO', 238),
(8, 10, 'Olhão', 8700, 561, 'OLHÃO', 239),
(8, 10, 'Olhão', 8700, 427, 'OLHÃO', 240),
(8, 10, 'Olhão', 8700, 418, 'OLHÃO', 241),
(8, 10, 'Olhão', 8700, 147, 'OLHÃO', 242),
(8, 10, 'Olhão', 8700, 375, 'OLHÃO', 243),
(8, 10, 'Olhão', 8700, 132, 'OLHÃO', 244),
(8, 10, 'Olhão', 8700, 542, 'OLHÃO', 245),
(8, 10, 'Olhão', 8700, 564, 'OLHÃO', 246),
(8, 10, 'Olhão', 8700, 255, 'OLHÃO', 247),
(8, 10, 'Olhão', 8700, 232, 'OLHÃO', 248),
(8, 10, 'Olhão', 8700, 324, 'OLHÃO', 249),
(8, 10, 'Olhão', 8700, 234, 'OLHÃO', 250),
(8, 10, 'Olhão', 8700, 157, 'OLHÃO', 251),
(8, 10, 'Olhão', 8700, 231, 'OLHÃO', 252),
(8, 10, 'Olhão', 8700, 529, 'OLHÃO', 253),
(8, 10, 'Olhão', 8700, 269, 'OLHÃO', 254),
(8, 10, 'Olhão', 8700, 369, 'OLHÃO', 255),
(8, 10, 'Olhão', 8700, 349, 'OLHÃO', 256),
(8, 10, 'Olhão', 8700, 534, 'OLHÃO', 257),
(8, 10, 'Olhão', 8700, 164, 'OLHÃO', 258),
(8, 10, 'Olhão', 8700, 154, 'OLHÃO', 259),
(8, 10, 'Olhão', 8700, 160, 'OLHÃO', 260),
(8, 10, 'Olhão', 8700, 165, 'OLHÃO', 261),
(8, 10, 'Olhão', 8700, 188, 'OLHÃO', 262),
(8, 10, 'Olhão', 8700, 163, 'OLHÃO', 263),
(8, 10, 'Olhão', 8700, 261, 'OLHÃO', 264),
(8, 10, 'Olhão', 8700, 569, 'OLHÃO', 265),
(8, 10, 'Olhão', 8700, 152, 'OLHÃO', 266),
(8, 10, 'Olhão', 8700, 428, 'OLHÃO', 267),
(8, 10, 'Olhão', 8700, 155, 'OLHÃO', 268),
(8, 10, 'Olhão', 8700, 153, 'OLHÃO', 269),
(8, 10, 'Olhão', 8700, 284, 'OLHÃO', 270),
(8, 10, 'Olhão', 8700, 194, 'OLHÃO', 271),
(8, 10, 'Olhão', 8700, 267, 'OLHÃO', 272),
(8, 10, 'Olhão', 8700, 265, 'OLHÃO', 273),
(8, 10, 'Olhão', 8700, 161, 'OLHÃO', 274),
(8, 10, 'Olhão', 8700, 294, 'OLHÃO', 275),
(8, 10, 'Olhão', 8700, 293, 'OLHÃO', 276),
(8, 10, 'Olhão', 8700, 297, 'OLHÃO', 277),
(8, 10, 'Olhão', 8700, 351, 'OLHÃO', 278),
(8, 10, 'Olhão', 8700, 162, 'OLHÃO', 279),
(8, 10, 'Olhão', 8700, 156, 'OLHÃO', 280),
(8, 10, 'Olhão', 8700, 295, 'OLHÃO', 281),
(8, 10, 'Olhão', 8700, 169, 'OLHÃO', 282),
(8, 10, 'Olhão', 8700, 170, 'OLHÃO', 283),
(8, 10, 'Olhão', 8700, 183, 'OLHÃO', 284),
(8, 10, 'Olhão', 8700, 453, 'OLHÃO', 285),
(8, 10, 'Olhão', 8700, 290, 'OLHÃO', 286),
(8, 10, 'Olhão', 8700, 516, 'OLHÃO', 287),
(8, 10, 'Olhão', 8700, 215, 'OLHÃO', 288),
(8, 10, 'Olhão', 8700, 574, 'OLHÃO', 289),
(8, 10, 'Olhão', 8700, 575, 'OLHÃO', 290),
(8, 10, 'Olhão', 8700, 576, 'OLHÃO', 291),
(8, 10, 'Olhão', 8700, 577, 'OLHÃO', 292),
(8, 10, 'Olhão', 8700, 419, 'OLHÃO', 293),
(8, 10, 'Olhão', 8700, 578, 'OLHÃO', 294),
(8, 10, 'Olhão', 8700, 520, 'OLHÃO', 295),
(8, 10, 'Olhão', 8700, 325, 'OLHÃO', 296),
(8, 10, 'Olhão', 8700, 396, 'OLHÃO', 297),
(8, 10, 'Olhão', 8700, 539, 'OLHÃO', 298),
(8, 10, 'Olhão', 8700, 264, 'OLHÃO', 299),
(8, 10, 'Olhão', 8700, 494, 'OLHÃO', 300),
(8, 10, 'Olhão', 8700, 540, 'OLHÃO', 301),
(8, 10, 'Olhão', 8700, 426, 'OLHÃO', 302),
(8, 10, 'Olhão', 8700, 382, 'OLHÃO', 303),
(8, 10, 'Olhão', 8700, 319, 'OLHÃO', 304),
(8, 10, 'Olhão', 8700, 552, 'OLHÃO', 305),
(8, 10, 'Olhão', 8700, 503, 'OLHÃO', 306),
(8, 10, 'Olhão', 8700, 256, 'OLHÃO', 307),
(8, 10, 'Olhão', 8700, 583, 'OLHÃO', 308),
(8, 10, 'Olhão', 8700, 308, 'OLHÃO', 309),
(8, 10, 'Olhão', 8700, 402, 'OLHÃO', 310),
(8, 10, 'Olhão', 8700, 362, 'OLHÃO', 311),
(8, 10, 'Olhão', 8700, 558, 'OLHÃO', 312),
(8, 10, 'Olhão', 8700, 368, 'OLHÃO', 313),
(8, 10, 'Olhão', 8700, 531, 'OLHÃO', 314),
(8, 10, 'Olhão', 8700, 537, 'OLHÃO', 315),
(8, 10, 'Olhão', 8700, 492, 'OLHÃO', 316),
(8, 10, 'Olhão', 8700, 500, 'OLHÃO', 317),
(8, 10, 'Olhão', 8700, 350, 'OLHÃO', 318),
(8, 10, 'Olhão', 8700, 400, 'OLHÃO', 319),
(8, 10, 'Olhão', 8700, 530, 'OLHÃO', 320),
(8, 10, 'Olhão', 8700, 548, 'OLHÃO', 321),
(8, 10, 'Olhão', 8700, 544, 'OLHÃO', 322),
(8, 10, 'Olhão', 8700, 412, 'OLHÃO', 323),
(8, 10, 'Olhão', 8700, 411, 'OLHÃO', 324),
(8, 10, 'Olhão', 8700, 401, 'OLHÃO', 325),
(8, 10, 'Olhão', 8700, 159, 'OLHÃO', 326),
(8, 10, 'Olhão', 8700, 526, 'OLHÃO', 327),
(8, 10, 'Olhão', 8700, 482, 'OLHÃO', 328),
(8, 10, 'Olhão', 8700, 490, 'OLHÃO', 329),
(8, 10, 'Olhão', 8700, 342, 'OLHÃO', 330),
(8, 10, 'Olhão', 8700, 434, 'OLHÃO', 331),
(8, 10, 'Olhão', 8700, 397, 'OLHÃO', 332),
(8, 10, 'Olhão', 8700, 481, 'OLHÃO', 333),
(8, 10, 'Olhão', 8700, 345, 'OLHÃO', 334),
(8, 10, 'Olhão', 8700, 465, 'OLHÃO', 335),
(8, 10, 'Olhão', 8700, 347, 'OLHÃO', 336),
(8, 10, 'Olhão', 8700, 549, 'OLHÃO', 337),
(8, 10, 'Olhão', 8700, 448, 'OLHÃO', 338),
(8, 10, 'Olhão', 8700, 505, 'OLHÃO', 339),
(8, 10, 'Olhão', 8700, 323, 'OLHÃO', 340),
(8, 10, 'Olhão', 8700, 310, 'OLHÃO', 341),
(8, 10, 'Olhão', 8700, 999, 'OLHÃO', 342),
(8, 10, 'Olhão', 8700, 512, 'OLHÃO', 343),
(8, 10, 'Olhão', 8700, 447, 'OLHÃO', 344),
(8, 10, 'Olhão', 8700, 501, 'OLHÃO', 345),
(8, 10, 'Olhão', 8700, 454, 'OLHÃO', 346),
(8, 10, 'Olhão', 8700, 455, 'OLHÃO', 347),
(8, 10, 'Olhão', 8700, 435, 'OLHÃO', 348),
(8, 10, 'Cascalho', 8700, 175, 'OLHÃO', 349),
(8, 10, 'Vale da Mó', 8700, 175, 'OLHÃO', 350),
(8, 10, 'Pechão', 8700, 245, 'OLHÃO', 351),
(8, 10, 'Pechão', 8700, 171, 'OLHÃO', 352),
(8, 10, 'Pechão', 8700, 180, 'OLHÃO', 353),
(8, 10, 'Pechão', 8700, 178, 'OLHÃO', 354),
(8, 10, 'Pechão', 8700, 303, 'OLHÃO', 355),
(8, 10, 'Pechão', 8700, 260, 'OLHÃO', 356),
(8, 10, 'Pechão', 8700, 259, 'OLHÃO', 357),
(8, 10, 'Pechão', 8700, 309, 'OLHÃO', 358),
(8, 10, 'Pechão', 8700, 305, 'OLHÃO', 359),
(8, 10, 'Pechão', 8700, 580, 'OLHÃO', 360),
(8, 10, 'Belamandil', 8700, 172, 'OLHÃO', 361),
(8, 10, 'Belmonte de Cima', 8700, 174, 'OLHÃO', 362),
(8, 10, 'Belmonte de Baixo', 8700, 173, 'OLHÃO', 363),
(8, 10, 'Cova da Onça', 8700, 177, 'OLHÃO', 364),
(8, 10, 'Charneca', 8700, 176, 'OLHÃO', 365),
(8, 10, 'Queijeira', 8700, 181, 'OLHÃO', 366),
(8, 10, 'Lamaceiro', 8700, 179, 'OLHÃO', 367),
(8, 10, 'Paraíso', 8700, 180, 'OLHÃO', 368),
(8, 10, 'Arranhado', 8700, 179, 'OLHÃO', 369),
(8, 10, 'Bela Curral', 8700, 179, 'OLHÃO', 370),
(8, 10, 'Alecrineira', 8700, 149, 'OLHÃO', 371),
(8, 10, 'Boavista', 8700, 206, 'OLHÃO', 372),
(8, 10, 'Brancanes', 8700, 207, 'OLHÃO', 373),
(8, 10, 'Peares', 8700, 224, 'OLHÃO', 374),
(8, 10, 'Ilha da Armona', 8700, 282, 'OLHÃO', 375),
(8, 10, 'Poço Longo', 8700, 226, 'OLHÃO', 376),
(8, 10, 'Montemor', 8700, 207, 'OLHÃO', 377),
(8, 10, 'Igreja', 8700, 206, 'OLHÃO', 378),
(8, 10, 'Ana Velha', 8700, 270, 'OLHÃO', 379),
(8, 10, 'Lagoão', 8700, 77, 'MONCARAPACHO', 380),
(8, 10, 'Quelfes', 8700, 159, 'OLHÃO', 381),
(8, 10, 'Quelfes', 8700, 488, 'OLHÃO', 382),
(8, 10, 'Quelfes', 8700, 239, 'OLHÃO', 383),
(8, 10, 'Quelfes', 8700, 280, 'OLHÃO', 384),
(8, 10, 'Quelfes', 8700, 273, 'OLHÃO', 385),
(8, 10, 'Quelfes', 8700, 215, 'OLHÃO', 386),
(8, 10, 'Quelfes', 8700, 209, 'OLHÃO', 387),
(8, 10, 'Quelfes', 8700, 218, 'OLHÃO', 388),
(8, 10, 'Quelfes', 8700, 275, 'OLHÃO', 389),
(8, 10, 'Quelfes', 8700, 274, 'OLHÃO', 390),
(8, 10, 'Quelfes', 8700, 298, 'OLHÃO', 391),
(8, 10, 'Quelfes', 8700, 383, 'OLHÃO', 392),
(8, 10, 'Quelfes', 8700, 241, 'OLHÃO', 393),
(8, 10, 'Quelfes', 8700, 248, 'OLHÃO', 394),
(8, 10, 'Quelfes', 8700, 242, 'OLHÃO', 395),
(8, 10, 'Quelfes', 8700, 255, 'OLHÃO', 396),
(8, 10, 'Quelfes', 8700, 251, 'OLHÃO', 397),
(8, 10, 'Quelfes', 8700, 252, 'OLHÃO', 398),
(8, 10, 'Quelfes', 8700, 246, 'OLHÃO', 399),
(8, 10, 'Quelfes', 8700, 243, 'OLHÃO', 400),
(8, 10, 'Quelfes', 8700, 244, 'OLHÃO', 401),
(8, 10, 'Quelfes', 8700, 236, 'OLHÃO', 402),
(8, 10, 'Quelfes', 8700, 254, 'OLHÃO', 403),
(8, 10, 'Quelfes', 8700, 240, 'OLHÃO', 404),
(8, 10, 'Quelfes', 8700, 250, 'OLHÃO', 405),
(8, 10, 'Quelfes', 8700, 257, 'OLHÃO', 406),
(8, 10, 'Quelfes', 8700, 256, 'OLHÃO', 407),
(8, 10, 'Quelfes', 8700, 247, 'OLHÃO', 408),
(8, 10, 'Quelfes', 8700, 147, 'OLHÃO', 409),
(8, 10, 'Quelfes', 8700, 137, 'OLHÃO', 410),
(8, 10, 'Quelfes', 8700, 135, 'OLHÃO', 411),
(8, 10, 'Quelfes', 8700, 133, 'OLHÃO', 412),
(8, 10, 'Quelfes', 8700, 278, 'OLHÃO', 413),
(8, 10, 'Quelfes', 8700, 158, 'OLHÃO', 414),
(8, 10, 'Quelfes', 8700, 581, 'OLHÃO', 415),
(8, 10, 'Quatrim', 8700, 217, 'OLHÃO', 416),
(8, 10, 'Arrochela', 8700, 181, 'OLHÃO', 417),
(8, 10, 'Aldeamento de Marim', 8700, 201, 'MONCARAPACHO', 418),
(8, 10, 'Pinheiros de Marim', 8700, 225, 'OLHÃO', 419),
(8, 10, 'Marim', 8700, 221, 'OLHÃO', 420),
(8, 10, 'Areias', 8700, 202, 'OLHÃO', 421),
(8, 10, 'Monte das Murtas', 8700, 222, 'OLHÃO', 422),
(8, 10, 'Monte José Monchique', 8700, 223, 'OLHÃO', 423),
(8, 10, 'Ponte Velha', 8700, 227, 'OLHÃO', 424),
(8, 10, 'Quintal António Rodrigues', 8700, 272, 'OLHÃO', 425),
(8, 10, 'Arretorta', 8700, 181, 'OLHÃO', 426),
(8, 5, 'Faro', 8000, 257, 'FARO', 427),
(8, 5, 'Faro', 8005, 123, 'FARO', 428),
(8, 5, 'Faro', 8000, 332, 'FARO', 429),
(8, 5, 'Faro', 8000, 340, 'FARO', 430),
(8, 5, 'Faro', 8000, 353, 'FARO', 431),
(8, 5, 'Faro', 8004, 37, 'FARO', 432),
(8, 5, 'Faro', 8000, 338, 'FARO', 433),
(8, 5, 'Faro', 8004, 49, 'FARO', 434),
(8, 5, 'Faro', 8000, 72, 'FARO', 435),
(8, 5, 'Faro', 8000, 408, 'FARO', 436),
(8, 5, 'Faro', 8004, 14, 'FARO', 437),
(8, 5, 'Faro', 8000, 388, 'FARO', 438),
(8, 5, 'Faro', 8000, 379, 'FARO', 439),
(8, 5, 'Faro', 8005, 187, 'FARO', 440),
(8, 5, 'Faro', 8005, 142, 'FARO', 441),
(8, 5, 'Faro', 8005, 150, 'FARO', 442),
(8, 5, 'Faro', 8000, 500, 'FARO', 443),
(8, 5, 'Faro', 8005, 148, 'FARO', 444),
(8, 5, 'Faro', 8000, 499, 'FARO', 445),
(8, 5, 'Faro', 8005, 147, 'FARO', 446),
(8, 5, 'Faro', 8000, 498, 'FARO', 447),
(8, 5, 'Faro', 8005, 149, 'FARO', 448),
(8, 5, 'Faro', 8009, 14, 'FARO', 449),
(8, 5, 'Faro', 8009, 15, 'FARO', 450),
(8, 5, 'Faro', 8005, 117, 'FARO', 451),
(8, 5, 'Faro', 8005, 128, 'FARO', 452),
(8, 5, 'Faro', 8005, 113, 'FARO', 453),
(8, 5, 'Faro', 8005, 326, 'FARO', 454),
(8, 5, 'Faro', 8000, 177, 'FARO', 455),
(8, 5, 'Faro', 8005, 334, 'FARO', 456),
(8, 5, 'Faro', 8000, 502, 'FARO', 457),
(8, 5, 'Faro', 8000, 539, 'FARO', 458),
(8, 5, 'Faro', 8000, 248, 'FARO', 459),
(8, 5, 'Faro', 8005, 129, 'FARO', 460),
(8, 5, 'Faro', 8000, 305, 'FARO', 461),
(8, 5, 'Faro', 8005, 114, 'FARO', 462),
(8, 5, 'Faro', 8000, 347, 'FARO', 463),
(8, 5, 'Faro', 8000, 346, 'FARO', 464),
(8, 5, 'Faro', 8005, 328, 'FARO', 465),
(8, 5, 'Faro', 8000, 352, 'FARO', 466),
(8, 5, 'Faro', 8005, 226, 'FARO', 467),
(8, 5, 'Faro', 8000, 354, 'FARO', 468),
(8, 5, 'Faro', 8000, 208, 'FARO', 469),
(8, 5, 'Faro', 8000, 298, 'FARO', 470),
(8, 5, 'Faro', 8000, 426, 'FARO', 471),
(8, 5, 'Faro', 8000, 229, 'FARO', 472),
(8, 5, 'Faro', 8000, 370, 'FARO', 473),
(8, 5, 'Faro', 8005, 218, 'FARO', 474),
(8, 5, 'Faro', 8005, 233, 'FARO', 475),
(8, 5, 'Faro', 8000, 366, 'FARO', 476),
(8, 5, 'Faro', 8000, 190, 'FARO', 477),
(8, 5, 'Faro', 8000, 429, 'FARO', 478),
(8, 5, 'Faro', 8000, 544, 'FARO', 479),
(8, 5, 'Faro', 8000, 275, 'FARO', 480),
(8, 5, 'Faro', 8000, 336, 'FARO', 481),
(8, 5, 'Faro', 8000, 262, 'FARO', 482),
(8, 5, 'Faro', 8000, 189, 'FARO', 483),
(8, 5, 'Faro', 8000, 460, 'FARO', 484),
(8, 5, 'Faro', 8005, 435, 'FARO', 485),
(8, 5, 'Faro', 8000, 131, 'FARO', 486),
(8, 5, 'Faro', 8000, 999, 'FARO', 487),
(8, 5, 'Faro', 8004, 40, 'FARO', 488),
(8, 5, 'Faro', 8004, 39, 'FARO', 489),
(8, 5, 'Faro', 8000, 148, 'FARO', 490),
(8, 5, 'Faro', 8000, 163, 'FARO', 491),
(8, 5, 'Faro', 8005, 202, 'FARO', 492),
(8, 5, 'Faro', 8000, 348, 'FARO', 493),
(8, 5, 'Faro', 8000, 129, 'FARO', 494),
(8, 5, 'Faro', 8005, 993, 'FARO', 495),
(8, 5, 'Faro', 8005, 103, 'FARO', 496),
(8, 5, 'Faro', 8000, 536, 'FARO', 497),
(8, 5, 'Faro', 8000, 224, 'FARO', 498),
(8, 5, 'Faro', 8000, 350, 'FARO', 499),
(8, 5, 'Faro', 8000, 351, 'FARO', 500),
(8, 5, 'Faro', 8000, 349, 'FARO', 501),
(8, 5, 'Faro', 8000, 183, 'FARO', 502),
(8, 5, 'Faro', 8000, 185, 'FARO', 503),
(8, 5, 'Faro', 8000, 205, 'FARO', 504),
(8, 5, 'Faro', 8000, 393, 'FARO', 505),
(8, 5, 'Faro', 8005, 228, 'FARO', 506),
(8, 5, 'Faro', 8005, 318, 'FARO', 507),
(8, 5, 'Faro', 8000, 316, 'FARO', 508),
(8, 5, 'Faro', 8005, 178, 'FARO', 509),
(8, 5, 'Faro', 8005, 176, 'FARO', 510),
(8, 5, 'Faro', 8000, 505, 'FARO', 511),
(8, 5, 'Faro', 8005, 173, 'FARO', 512),
(8, 5, 'Faro', 8005, 174, 'FARO', 513),
(8, 5, 'Faro', 8005, 139, 'FARO', 514),
(8, 5, 'Faro', 8005, 492, 'FARO', 515),
(8, 5, 'Faro', 8005, 223, 'FARO', 516),
(8, 5, 'Faro', 8005, 234, 'FARO', 517),
(8, 5, 'Faro', 8005, 310, 'FARO', 518),
(8, 5, 'Faro', 8000, 442, 'FARO', 519),
(8, 5, 'Faro', 8005, 207, 'FARO', 520),
(8, 5, 'Faro', 8005, 224, 'FARO', 521),
(8, 5, 'Faro', 8005, 316, 'FARO', 522),
(8, 5, 'Faro', 8005, 189, 'FARO', 523),
(8, 5, 'Faro', 8005, 260, 'FARO', 524),
(8, 5, 'Faro', 8005, 259, 'FARO', 525),
(8, 5, 'Faro', 8005, 268, 'FARO', 526),
(8, 5, 'Faro', 8005, 267, 'FARO', 527),
(8, 5, 'Faro', 8000, 324, 'FARO', 528),
(8, 5, 'Faro', 8005, 247, 'FARO', 529),
(8, 5, 'Faro', 8005, 155, 'FARO', 530),
(8, 5, 'Faro', 8005, 269, 'FARO', 531),
(8, 5, 'Faro', 8000, 278, 'FARO', 532),
(8, 5, 'Faro', 8005, 137, 'FARO', 533),
(8, 5, 'Faro', 8005, 329, 'FARO', 534),
(8, 5, 'Faro', 8005, 996, 'FARO', 535),
(8, 5, 'Faro', 8005, 262, 'FARO', 536),
(8, 5, 'Faro', 8005, 544, 'FARO', 537),
(8, 5, 'Faro', 8005, 545, 'FARO', 538),
(8, 5, 'Faro', 8005, 252, 'FARO', 539),
(8, 5, 'Faro', 8005, 254, 'FARO', 540),
(8, 5, 'Faro', 8005, 166, 'FARO', 541),
(8, 5, 'Faro', 8005, 165, 'FARO', 542),
(8, 5, 'Faro', 8005, 546, 'FARO', 543),
(8, 5, 'Faro', 8005, 132, 'FARO', 544),
(8, 5, 'Faro', 8005, 238, 'FARO', 545),
(8, 5, 'Faro', 8000, 151, 'FARO', 546),
(8, 5, 'Faro', 8005, 257, 'FARO', 547),
(8, 5, 'Faro', 8005, 255, 'FARO', 548),
(8, 5, 'Faro', 8005, 256, 'FARO', 549),
(8, 5, 'Faro', 8005, 258, 'FARO', 550),
(8, 5, 'Faro', 8005, 253, 'FARO', 551),
(8, 5, 'Faro', 8000, 270, 'FARO', 552),
(8, 5, 'Faro', 8005, 227, 'FARO', 553),
(8, 5, 'Faro', 8005, 319, 'FARO', 554),
(8, 5, 'Faro', 8005, 335, 'FARO', 555),
(8, 5, 'Faro', 8005, 327, 'FARO', 556),
(8, 5, 'Faro', 8005, 433, 'FARO', 557),
(8, 5, 'Faro', 8005, 282, 'FARO', 558),
(8, 5, 'Faro', 8005, 261, 'FARO', 559),
(8, 5, 'Faro', 8005, 217, 'FARO', 560),
(8, 5, 'Faro', 8005, 99, 'FARO', 561),
(8, 5, 'Faro', 8005, 222, 'FARO', 562),
(8, 5, 'Faro', 8005, 264, 'FARO', 563),
(8, 5, 'Faro', 8005, 249, 'FARO', 564),
(8, 5, 'Faro', 8005, 198, 'FARO', 565),
(8, 5, 'Faro', 8005, 549, 'FARO', 566),
(8, 5, 'Faro', 8000, 342, 'FARO', 567),
(8, 5, 'Faro', 8000, 312, 'FARO', 568),
(8, 5, 'Faro', 8000, 314, 'FARO', 569),
(8, 5, 'Faro', 8000, 313, 'FARO', 570),
(8, 5, 'Faro', 8000, 315, 'FARO', 571),
(8, 5, 'Faro', 8000, 244, 'FARO', 572),
(8, 5, 'Faro', 8000, 246, 'FARO', 573),
(8, 5, 'Faro', 8000, 245, 'FARO', 574),
(8, 5, 'Faro', 8000, 247, 'FARO', 575),
(8, 5, 'Faro', 8000, 294, 'FARO', 576),
(8, 5, 'Faro', 8000, 296, 'FARO', 577),
(8, 5, 'Faro', 8000, 295, 'FARO', 578),
(8, 5, 'Faro', 8000, 297, 'FARO', 579),
(8, 5, 'Faro', 8004, 20, 'FARO', 580),
(8, 5, 'Faro', 8000, 236, 'FARO', 581),
(8, 5, 'Faro', 8000, 156, 'FARO', 582),
(8, 5, 'Faro', 8000, 478, 'FARO', 583),
(8, 5, 'Faro', 8000, 457, 'FARO', 584),
(8, 5, 'Faro', 8000, 335, 'FARO', 585),
(8, 5, 'Faro', 8000, 142, 'FARO', 586),
(8, 5, 'Faro', 8000, 101, 'FARO', 587),
(8, 5, 'Faro', 8000, 282, 'FARO', 588),
(8, 5, 'Faro', 8000, 284, 'FARO', 589),
(8, 5, 'Faro', 8000, 283, 'FARO', 590),
(8, 5, 'Faro', 8000, 482, 'FARO', 591),
(8, 5, 'Faro', 8000, 406, 'FARO', 592),
(8, 5, 'Faro', 8005, 547, 'FARO', 593),
(8, 5, 'Faro', 8005, 511, 'FARO', 594),
(8, 5, 'Faro', 8000, 417, 'FARO', 595),
(8, 5, 'Faro', 8000, 419, 'FARO', 596),
(8, 5, 'Faro', 8000, 418, 'FARO', 597),
(8, 5, 'Faro', 8000, 420, 'FARO', 598),
(8, 5, 'Faro', 8005, 331, 'FARO', 599),
(8, 5, 'Faro', 8000, 444, 'FARO', 600),
(8, 5, 'Faro', 8000, 437, 'FARO', 601),
(8, 5, 'Faro', 8000, 204, 'FARO', 602),
(8, 5, 'Faro', 8000, 452, 'FARO', 603),
(8, 5, 'Faro', 8000, 306, 'FARO', 604),
(8, 5, 'Faro', 8000, 202, 'FARO', 605),
(8, 5, 'Faro', 8000, 214, 'FARO', 606),
(8, 5, 'Faro', 8000, 215, 'FARO', 607),
(8, 5, 'Faro', 8000, 167, 'FARO', 608),
(8, 5, 'Faro', 8000, 168, 'FARO', 609),
(8, 5, 'Faro', 8004, 76, 'FARO', 610),
(8, 5, 'Faro', 8000, 311, 'FARO', 611),
(8, 5, 'Faro', 8000, 98, 'FARO', 612),
(8, 5, 'Faro', 8000, 149, 'FARO', 613),
(8, 5, 'Faro', 8000, 250, 'FARO', 614),
(8, 5, 'Faro', 8000, 169, 'FARO', 615),
(8, 5, 'Faro', 8000, 300, 'FARO', 616),
(8, 5, 'Faro', 8000, 396, 'FARO', 617),
(8, 5, 'Faro', 8000, 390, 'FARO', 618),
(8, 5, 'Faro', 8000, 302, 'FARO', 619),
(8, 5, 'Faro', 8000, 416, 'FARO', 620),
(8, 5, 'Faro', 8004, 2, 'FARO', 621),
(8, 5, 'Faro', 8000, 413, 'FARO', 622),
(8, 5, 'Faro', 8000, 401, 'FARO', 623),
(8, 5, 'Faro', 8000, 243, 'FARO', 624),
(8, 5, 'Faro', 8000, 106, 'FARO', 625),
(8, 5, 'Faro', 8000, 410, 'FARO', 626),
(8, 5, 'Faro', 8000, 269, 'FARO', 627),
(8, 5, 'Faro', 8000, 304, 'FARO', 628),
(8, 5, 'Faro', 8000, 428, 'FARO', 629),
(8, 5, 'Faro', 8000, 369, 'FARO', 630),
(8, 5, 'Faro', 8000, 382, 'FARO', 631),
(8, 5, 'Faro', 8000, 210, 'FARO', 632),
(8, 5, 'Faro', 8004, 1, 'FARO', 633),
(8, 5, 'Faro', 8000, 138, 'FARO', 634),
(8, 5, 'Faro', 8000, 268, 'FARO', 635),
(8, 5, 'Faro', 8000, 474, 'FARO', 636),
(8, 5, 'Faro', 8000, 364, 'FARO', 637),
(8, 5, 'Faro', 8000, 464, 'FARO', 638),
(8, 5, 'Faro', 8000, 403, 'FARO', 639),
(8, 5, 'Faro', 8000, 328, 'FARO', 640),
(8, 5, 'Faro', 8004, 17, 'FARO', 641),
(8, 5, 'Faro', 8000, 173, 'FARO', 642),
(8, 5, 'Faro', 8000, 162, 'FARO', 643),
(8, 5, 'Faro', 8000, 434, 'FARO', 644),
(8, 5, 'Faro', 8004, 18, 'FARO', 645),
(8, 5, 'Faro', 8000, 249, 'FARO', 646),
(8, 5, 'Faro', 8000, 327, 'FARO', 647),
(8, 5, 'Faro', 8000, 326, 'FARO', 648),
(8, 5, 'Faro', 8000, 174, 'FARO', 649),
(8, 5, 'Faro', 8000, 432, 'FARO', 650),
(8, 5, 'Faro', 8000, 323, 'FARO', 651),
(8, 5, 'Faro', 8000, 471, 'FARO', 652),
(8, 5, 'Faro', 8000, 235, 'FARO', 653),
(8, 5, 'Faro', 8000, 360, 'FARO', 654),
(8, 5, 'Faro', 8000, 433, 'FARO', 655),
(8, 5, 'Faro', 8000, 362, 'FARO', 656),
(8, 5, 'Faro', 8005, 163, 'FARO', 657),
(8, 5, 'Faro', 8000, 107, 'FARO', 658),
(8, 5, 'Faro', 8000, 261, 'FARO', 659),
(8, 5, 'Faro', 8000, 483, 'FARO', 660),
(8, 5, 'Faro', 8000, 472, 'FARO', 661),
(8, 5, 'Faro', 8000, 150, 'FARO', 662),
(8, 5, 'Faro', 8000, 459, 'FARO', 663),
(8, 5, 'Faro', 8004, 8, 'FARO', 664),
(8, 5, 'Faro', 8004, 13, 'FARO', 665),
(8, 5, 'Faro', 8004, 7, 'FARO', 666),
(8, 5, 'Faro', 8000, 361, 'FARO', 667),
(8, 5, 'Faro', 8000, 387, 'FARO', 668),
(8, 5, 'Faro', 8000, 477, 'FARO', 669),
(8, 5, 'Faro', 8000, 271, 'FARO', 670),
(8, 5, 'Faro', 8000, 463, 'FARO', 671),
(8, 5, 'Faro', 8000, 135, 'FARO', 672),
(8, 5, 'Faro', 8004, 10, 'FARO', 673),
(8, 5, 'Faro', 8000, 281, 'FARO', 674),
(8, 5, 'Faro', 8000, 217, 'FARO', 675),
(8, 5, 'Faro', 8000, 481, 'FARO', 676),
(8, 5, 'Faro', 8005, 297, 'FARO', 677),
(8, 5, 'Faro', 8005, 185, 'FARO', 678),
(8, 5, 'Faro', 8000, 309, 'FARO', 679),
(8, 5, 'Faro', 8005, 213, 'FARO', 680),
(8, 5, 'Faro', 8005, 188, 'FARO', 681),
(8, 5, 'Faro', 8005, 191, 'FARO', 682),
(8, 5, 'Faro', 8005, 196, 'FARO', 683),
(8, 5, 'Faro', 8005, 192, 'FARO', 684),
(8, 5, 'Faro', 8005, 193, 'FARO', 685),
(8, 5, 'Faro', 8004, 34, 'FARO', 686),
(8, 5, 'Faro', 8000, 329, 'FARO', 687),
(8, 5, 'Faro', 8005, 197, 'FARO', 688),
(8, 5, 'Faro', 8005, 194, 'FARO', 689),
(8, 5, 'Faro', 8005, 211, 'FARO', 690),
(8, 5, 'Faro', 8005, 199, 'FARO', 691),
(8, 5, 'Faro', 8000, 427, 'FARO', 692),
(8, 5, 'Faro', 8005, 231, 'FARO', 693),
(8, 5, 'Faro', 8005, 232, 'FARO', 694),
(8, 5, 'Faro', 8005, 283, 'FARO', 695),
(8, 5, 'Faro', 8005, 239, 'FARO', 696),
(8, 5, 'Faro', 8005, 236, 'FARO', 697),
(8, 5, 'Faro', 8000, 469, 'FARO', 698),
(8, 5, 'Faro', 8005, 167, 'FARO', 699),
(8, 5, 'Faro', 8005, 237, 'FARO', 700),
(8, 5, 'Faro', 8000, 164, 'FARO', 701),
(8, 5, 'Faro', 8004, 11, 'FARO', 702),
(8, 5, 'Faro', 8004, 9, 'FARO', 703),
(8, 5, 'Faro', 8000, 225, 'FARO', 704),
(8, 5, 'Faro', 8000, 510, 'FARO', 705),
(8, 5, 'Faro', 8000, 404, 'FARO', 706),
(8, 5, 'Faro', 8000, 159, 'FARO', 707),
(8, 5, 'Faro', 8000, 160, 'FARO', 708),
(8, 5, 'Faro', 8000, 479, 'FARO', 709),
(8, 5, 'Faro', 8004, 64, 'FARO', 710),
(8, 5, 'Faro', 8000, 234, 'FARO', 711),
(8, 5, 'Faro', 8000, 446, 'FARO', 712),
(8, 5, 'Faro', 8000, 421, 'FARO', 713),
(8, 5, 'Faro', 8000, 391, 'FARO', 714),
(8, 5, 'Faro', 8000, 154, 'FARO', 715),
(8, 5, 'Faro', 8000, 480, 'FARO', 716),
(8, 5, 'Faro', 8000, 400, 'FARO', 717),
(8, 5, 'Faro', 8005, 140, 'FARO', 718),
(8, 5, 'Faro', 8000, 137, 'FARO', 719),
(8, 5, 'Faro', 8000, 158, 'FARO', 720),
(8, 5, 'Faro', 8000, 291, 'FARO', 721),
(8, 5, 'Faro', 8000, 123, 'FARO', 722),
(8, 5, 'Faro', 8000, 285, 'FARO', 723),
(8, 5, 'Faro', 8000, 466, 'FARO', 724),
(8, 5, 'Faro', 8005, 504, 'FARO', 725),
(8, 5, 'Faro', 8000, 537, 'FARO', 726),
(8, 5, 'Faro', 8000, 273, 'FARO', 727),
(8, 5, 'Faro', 8000, 475, 'FARO', 728),
(8, 5, 'Faro', 8000, 230, 'FARO', 729),
(8, 5, 'Faro', 8000, 228, 'FARO', 730),
(8, 5, 'Faro', 8000, 320, 'FARO', 731),
(8, 5, 'Faro', 8000, 318, 'FARO', 732),
(8, 5, 'Faro', 8000, 321, 'FARO', 733),
(8, 5, 'Faro', 8000, 319, 'FARO', 734),
(8, 5, 'Faro', 8004, 63, 'FARO', 735),
(8, 5, 'Faro', 8004, 30, 'FARO', 736),
(8, 5, 'Faro', 8004, 29, 'FARO', 737),
(8, 5, 'Faro', 8000, 203, 'FARO', 738),
(8, 5, 'Faro', 8000, 206, 'FARO', 739),
(8, 5, 'Faro', 8000, 322, 'FARO', 740),
(8, 5, 'Faro', 8000, 333, 'FARO', 741),
(8, 5, 'Faro', 8000, 276, 'FARO', 742),
(8, 5, 'Faro', 8000, 445, 'FARO', 743),
(8, 5, 'Faro', 8000, 345, 'FARO', 744),
(8, 5, 'Faro', 8005, 520, 'FARO', 745),
(8, 5, 'Faro', 8000, 139, 'FARO', 746),
(8, 5, 'Faro', 8000, 399, 'FARO', 747),
(8, 5, 'Faro', 8000, 397, 'FARO', 748),
(8, 5, 'Faro', 8004, 27, 'FARO', 749),
(8, 5, 'Faro', 8000, 368, 'FARO', 750),
(8, 5, 'Faro', 8004, 28, 'FARO', 751),
(8, 5, 'Faro', 8000, 157, 'FARO', 752),
(8, 5, 'Faro', 8000, 303, 'FARO', 753),
(8, 5, 'Faro', 8000, 74, 'FARO', 754),
(8, 5, 'Faro', 8000, 73, 'FARO', 755),
(8, 5, 'Faro', 8004, 33, 'FARO', 756),
(8, 5, 'Faro', 8000, 239, 'FARO', 757),
(8, 5, 'Faro', 8000, 143, 'FARO', 758),
(8, 5, 'Faro', 8000, 144, 'FARO', 759),
(8, 5, 'Faro', 8004, 5, 'FARO', 760),
(8, 5, 'Faro', 8005, 131, 'FARO', 761),
(8, 5, 'Faro', 8005, 133, 'FARO', 762),
(8, 5, 'Faro', 8005, 134, 'FARO', 763),
(8, 5, 'Faro', 8005, 138, 'FARO', 764),
(8, 5, 'Faro', 8005, 135, 'FARO', 765),
(8, 5, 'Faro', 8005, 136, 'FARO', 766),
(8, 5, 'Faro', 8005, 242, 'FARO', 767),
(8, 5, 'Faro', 8005, 243, 'FARO', 768),
(8, 5, 'Faro', 8005, 244, 'FARO', 769),
(8, 5, 'Faro', 8005, 246, 'FARO', 770),
(8, 5, 'Faro', 8005, 245, 'FARO', 771),
(8, 5, 'Faro', 8005, 106, 'FARO', 772),
(8, 5, 'Faro', 8005, 206, 'FARO', 773),
(8, 5, 'Faro', 8005, 240, 'FARO', 774),
(8, 5, 'Faro', 8005, 241, 'FARO', 775),
(8, 5, 'Faro', 8009, 12, 'FARO', 776),
(8, 5, 'Faro', 8009, 4, 'FARO', 777),
(8, 5, 'Faro', 8005, 248, 'FARO', 778),
(8, 5, 'Faro', 8005, 220, 'FARO', 779),
(8, 5, 'Faro', 8005, 221, 'FARO', 780),
(8, 5, 'Faro', 8000, 176, 'FARO', 781),
(8, 5, 'Faro', 8000, 425, 'FARO', 782),
(8, 5, 'Faro', 8000, 422, 'FARO', 783),
(8, 5, 'Faro', 8000, 424, 'FARO', 784),
(8, 5, 'Faro', 8000, 423, 'FARO', 785),
(8, 5, 'Faro', 8004, 26, 'FARO', 786),
(8, 5, 'Faro', 8000, 402, 'FARO', 787),
(8, 5, 'Faro', 8000, 307, 'FARO', 788),
(8, 5, 'Faro', 8000, 222, 'FARO', 789),
(8, 5, 'Faro', 8000, 220, 'FARO', 790),
(8, 5, 'Faro', 8000, 218, 'FARO', 791),
(8, 5, 'Faro', 8000, 219, 'FARO', 792),
(8, 5, 'Faro', 8000, 223, 'FARO', 793),
(8, 5, 'Faro', 8000, 221, 'FARO', 794),
(8, 5, 'Faro', 8000, 201, 'FARO', 795),
(8, 5, 'Faro', 8000, 381, 'FARO', 796),
(8, 5, 'Faro', 8000, 165, 'FARO', 797),
(8, 5, 'Faro', 8000, 233, 'FARO', 798),
(8, 5, 'Faro', 8000, 357, 'FARO', 799),
(8, 5, 'Faro', 8000, 356, 'FARO', 800),
(8, 5, 'Faro', 8004, 31, 'FARO', 801),
(8, 5, 'Faro', 8000, 84, 'FARO', 802),
(8, 5, 'Faro', 8000, 263, 'FARO', 803),
(8, 5, 'Faro', 8005, 177, 'FARO', 804),
(8, 5, 'Faro', 8004, 69, 'FARO', 805),
(8, 5, 'Faro', 8000, 77, 'FARO', 806),
(8, 5, 'Faro', 8000, 75, 'FARO', 807),
(8, 5, 'Faro', 8000, 76, 'FARO', 808),
(8, 5, 'Faro', 8004, 23, 'FARO', 809),
(8, 5, 'Faro', 8004, 21, 'FARO', 810),
(8, 5, 'Faro', 8004, 22, 'FARO', 811),
(8, 5, 'Faro', 8004, 71, 'FARO', 812),
(8, 5, 'Faro', 8004, 70, 'FARO', 813),
(8, 5, 'Faro', 8000, 334, 'FARO', 814),
(8, 5, 'Faro', 8000, 339, 'FARO', 815),
(8, 5, 'Faro', 8000, 504, 'FARO', 816),
(8, 5, 'Faro', 8000, 81, 'FARO', 817),
(8, 5, 'Faro', 8000, 238, 'FARO', 818),
(8, 5, 'Faro', 8000, 337, 'FARO', 819),
(8, 5, 'Faro', 8000, 153, 'FARO', 820),
(8, 5, 'Faro', 8000, 355, 'FARO', 821),
(8, 5, 'Faro', 8000, 209, 'FARO', 822),
(8, 5, 'Faro', 8000, 258, 'FARO', 823),
(8, 5, 'Faro', 8000, 171, 'FARO', 824),
(8, 5, 'Faro', 8000, 367, 'FARO', 825),
(8, 5, 'Faro', 8000, 237, 'FARO', 826),
(8, 5, 'Faro', 8000, 555, 'FARO', 827),
(8, 5, 'Faro', 8005, 500, 'FARO', 828),
(8, 5, 'Faro', 8000, 451, 'FARO', 829),
(8, 5, 'Faro', 8004, 45, 'FARO', 830),
(8, 5, 'Faro', 8004, 46, 'FARO', 831),
(8, 5, 'Faro', 8000, 186, 'FARO', 832),
(8, 5, 'Faro', 8004, 15, 'FARO', 833),
(8, 5, 'Faro', 8004, 47, 'FARO', 834),
(8, 5, 'Faro', 8000, 405, 'FARO', 835),
(8, 5, 'Faro', 8000, 232, 'FARO', 836),
(8, 5, 'Faro', 8004, 60, 'FARO', 837),
(8, 5, 'Faro', 8000, 241, 'FARO', 838),
(8, 5, 'Faro', 8000, 372, 'FARO', 839),
(8, 5, 'Faro', 8000, 384, 'FARO', 840),
(8, 5, 'Faro', 8000, 365, 'FARO', 841),
(8, 5, 'Faro', 8000, 503, 'FARO', 842),
(8, 5, 'Faro', 8000, 501, 'FARO', 843),
(8, 5, 'Faro', 8000, 456, 'FARO', 844),
(8, 5, 'Faro', 8000, 213, 'FARO', 845),
(8, 5, 'Faro', 8000, 386, 'FARO', 846),
(8, 5, 'Faro', 8000, 166, 'FARO', 847),
(8, 5, 'Faro', 8005, 160, 'FARO', 848),
(8, 5, 'Faro', 8005, 157, 'FARO', 849),
(8, 5, 'Faro', 8005, 216, 'FARO', 850),
(8, 5, 'Faro', 8005, 304, 'FARO', 851),
(8, 5, 'Faro', 8000, 170, 'FARO', 852),
(8, 5, 'Faro', 8000, 448, 'FARO', 853),
(8, 5, 'Faro', 8005, 203, 'FARO', 854),
(8, 5, 'Faro', 8000, 814, 'FARO', 855),
(8, 5, 'Faro', 8000, 187, 'FARO', 856),
(8, 5, 'Faro', 8000, 266, 'FARO', 857),
(8, 5, 'Faro', 8000, 188, 'FARO', 858),
(8, 5, 'Faro', 8005, 102, 'FARO', 859),
(8, 5, 'Faro', 8005, 999, 'FARO', 860),
(8, 5, 'Faro', 8005, 146, 'FARO', 861),
(8, 5, 'Faro', 8005, 212, 'FARO', 862),
(8, 5, 'Faro', 8005, 145, 'FARO', 863),
(8, 5, 'Faro', 8000, 378, 'FARO', 864),
(8, 5, 'Faro', 8005, 447, 'FARO', 865),
(8, 5, 'Faro', 8000, 255, 'FARO', 866),
(8, 5, 'Faro', 8005, 105, 'FARO', 867),
(8, 5, 'Faro', 8005, 108, 'FARO', 868),
(8, 5, 'Faro', 8005, 109, 'FARO', 869),
(8, 5, 'Faro', 8005, 112, 'FARO', 870),
(8, 5, 'Faro', 8005, 542, 'FARO', 871),
(8, 5, 'Faro', 8000, 343, 'FARO', 872),
(8, 5, 'Faro', 8005, 130, 'FARO', 873),
(8, 5, 'Faro', 8005, 144, 'FARO', 874),
(8, 5, 'Faro', 8000, 476, 'FARO', 875),
(8, 5, 'Faro', 8005, 164, 'FARO', 876),
(8, 5, 'Faro', 8004, 3, 'FARO', 877),
(8, 5, 'Faro', 8004, 75, 'FARO', 878),
(8, 5, 'Faro', 8000, 398, 'FARO', 879),
(8, 5, 'Faro', 8000, 458, 'FARO', 880),
(8, 5, 'Faro', 8000, 409, 'FARO', 881),
(8, 5, 'Faro', 8005, 278, 'FARO', 882),
(8, 5, 'Faro', 8005, 548, 'FARO', 883),
(8, 5, 'Faro', 8000, 447, 'FARO', 884),
(8, 5, 'Faro', 8000, 292, 'FARO', 885),
(8, 5, 'Faro', 8000, 290, 'FARO', 886),
(8, 5, 'Faro', 8000, 293, 'FARO', 887),
(8, 5, 'Faro', 8004, 50, 'FARO', 888),
(8, 5, 'Faro', 8000, 470, 'FARO', 889),
(8, 5, 'Faro', 8000, 538, 'FARO', 890),
(8, 5, 'Faro', 8000, 540, 'FARO', 891),
(8, 5, 'Faro', 8000, 541, 'FARO', 892),
(8, 5, 'Faro', 8000, 542, 'FARO', 893),
(8, 5, 'Faro', 8000, 240, 'FARO', 894),
(8, 5, 'Faro', 8000, 252, 'FARO', 895),
(8, 5, 'Faro', 8005, 493, 'FARO', 896),
(8, 5, 'Faro', 8000, 0, 'FARO', 897),
(8, 5, 'Faro', 8005, 995, 'FARO', 898),
(8, 5, 'Faro', 8000, 467, 'FARO', 899),
(8, 5, 'Faro', 8005, 181, 'FARO', 900),
(8, 5, 'Faro', 8000, 145, 'FARO', 901),
(8, 5, 'Faro', 8000, 301, 'FARO', 902),
(8, 5, 'Faro', 8000, 253, 'FARO', 903),
(8, 5, 'Faro', 8000, 286, 'FARO', 904),
(8, 5, 'Faro', 8000, 394, 'FARO', 905),
(8, 5, 'Faro', 8000, 267, 'FARO', 906),
(8, 5, 'Faro', 8000, 411, 'FARO', 907),
(8, 5, 'Faro', 8000, 274, 'FARO', 908),
(8, 5, 'Faro', 8000, 438, 'FARO', 909),
(8, 5, 'Faro', 8000, 226, 'FARO', 910),
(8, 5, 'Faro', 8000, 363, 'FARO', 911),
(8, 5, 'Faro', 8000, 134, 'FARO', 912),
(8, 5, 'Faro', 8000, 141, 'FARO', 913),
(8, 5, 'Faro', 8000, 435, 'FARO', 914),
(8, 5, 'Faro', 8000, 299, 'FARO', 915),
(8, 5, 'Faro', 8000, 509, 'FARO', 916),
(8, 5, 'Faro', 8000, 358, 'FARO', 917),
(8, 5, 'Faro', 8000, 260, 'FARO', 918),
(8, 5, 'Faro', 8000, 461, 'FARO', 919),
(8, 5, 'Faro', 8000, 227, 'FARO', 920),
(8, 5, 'Faro', 8000, 172, 'FARO', 921),
(8, 5, 'Faro', 8000, 78, 'FARO', 922),
(8, 5, 'Faro', 8000, 79, 'FARO', 923),
(8, 5, 'Faro', 8000, 80, 'FARO', 924),
(8, 5, 'Faro', 8000, 184, 'FARO', 925),
(8, 5, 'Faro', 8000, 344, 'FARO', 926),
(8, 5, 'Faro', 8000, 256, 'FARO', 927),
(8, 5, 'Faro', 8000, 440, 'FARO', 928),
(8, 5, 'Faro', 8000, 371, 'FARO', 929),
(8, 5, 'Faro', 8000, 443, 'FARO', 930),
(8, 5, 'Faro', 8005, 143, 'FARO', 931),
(8, 5, 'Faro', 8000, 211, 'FARO', 932),
(8, 5, 'Faro', 8000, 359, 'FARO', 933),
(8, 5, 'Faro', 8000, 133, 'FARO', 934),
(8, 5, 'Faro', 8000, 431, 'FARO', 935),
(8, 5, 'Faro', 8000, 231, 'FARO', 936),
(8, 5, 'Faro', 8000, 196, 'FARO', 937),
(8, 5, 'Faro', 8000, 265, 'FARO', 938),
(8, 5, 'Faro', 8000, 389, 'FARO', 939),
(8, 5, 'Faro', 8004, 35, 'FARO', 940),
(8, 5, 'Faro', 8000, 259, 'FARO', 941),
(8, 5, 'Faro', 8000, 200, 'FARO', 942),
(8, 5, 'Faro', 8000, 197, 'FARO', 943),
(8, 5, 'Faro', 8000, 199, 'FARO', 944),
(8, 5, 'Faro', 8000, 198, 'FARO', 945),
(8, 5, 'Faro', 8004, 25, 'FARO', 946),
(8, 5, 'Faro', 8000, 392, 'FARO', 947),
(8, 5, 'Faro', 8000, 155, 'FARO', 948),
(8, 5, 'Faro', 8000, 272, 'FARO', 949),
(8, 5, 'Faro', 8000, 279, 'FARO', 950),
(8, 5, 'Faro', 8000, 430, 'FARO', 951),
(8, 5, 'Faro', 8000, 180, 'FARO', 952),
(8, 5, 'Faro', 8000, 140, 'FARO', 953),
(8, 5, 'Faro', 8004, 61, 'FARO', 954),
(8, 5, 'Faro', 8000, 465, 'FARO', 955),
(8, 5, 'Faro', 8004, 38, 'FARO', 956),
(8, 5, 'Faro', 8000, 216, 'FARO', 957),
(8, 5, 'Faro', 8004, 36, 'FARO', 958),
(8, 5, 'Faro', 8000, 242, 'FARO', 959),
(8, 5, 'Ilha da Culatra', 8005, 556, 'FARO', 960),
(8, 5, 'Ilha do Farol', 8005, 554, 'FARO', 961),
(8, 5, 'Agostos', 8005, 401, 'FARO', 962),
(8, 5, 'Alagoas', 8005, 402, 'FARO', 963),
(8, 5, 'Aldeia', 8005, 406, 'FARO', 964),
(8, 5, 'Benatrite', 8005, 420, 'FARO', 965),
(8, 5, 'Bordeira', 8005, 423, 'FARO', 966),
(8, 5, 'Canal', 8005, 431, 'FARO', 967),
(8, 5, 'Charneca', 8005, 440, 'FARO', 968),
(8, 5, 'Colmeal', 8005, 444, 'FARO', 969),
(8, 5, 'Falfosa', 8005, 483, 'FARO', 970),
(8, 5, 'Goldra de Cima', 8005, 487, 'FARO', 971),
(8, 5, 'Gorjões', 8005, 488, 'FARO', 972),
(8, 5, 'Laranjeira', 8005, 497, 'FARO', 973),
(8, 5, 'Medronhal', 8005, 502, 'FARO', 974),
(8, 5, 'Palhagueira', 8005, 509, 'FARO', 975),
(8, 5, 'Pé do Cerro', 8005, 512, 'FARO', 976),
(8, 5, 'Poço Mouro', 8005, 517, 'FARO', 977),
(8, 5, 'Quinta das Raposeiras', 8005, 527, 'FARO', 978),
(8, 5, 'Santa Bárbara de Nexe', 8005, 997, 'FARO', 979),
(8, 5, 'Santa Bárbara de Nexe', 8005, 491, 'FARO', 980),
(8, 5, 'Telheiro', 8005, 532, 'FARO', 981),
(8, 5, 'Valados', 8005, 534, 'FARO', 982),
(8, 5, 'Arábia', 8005, 408, 'FARO', 983),
(8, 5, 'Areal Gordo', 8009, 11, 'FARO', 984),
(8, 5, 'Areal Gordo', 8005, 409, 'FARO', 985),
(8, 5, 'Arneiro', 8005, 412, 'FARO', 986),
(8, 5, 'Bairro Rufina', 8005, 416, 'FARO', 987),
(8, 5, 'Bela Curral', 8005, 418, 'FARO', 988),
(8, 5, 'Bela Salema', 8009, 16, 'FARO', 989),
(8, 5, 'Bela Salema', 8005, 419, 'FARO', 990),
(8, 5, 'Besouro', 8005, 421, 'FARO', 991),
(8, 5, 'Biogal', 8005, 422, 'FARO', 992),
(8, 5, 'Braciais', 8005, 424, 'FARO', 993),
(8, 5, 'Brejo', 8005, 425, 'FARO', 994),
(8, 5, 'Caldeira Neto', 8005, 427, 'FARO', 995),
(8, 5, 'Caliços', 8005, 428, 'FARO', 996),
(8, 5, 'Campinas', 8009, 13, 'FARO', 997),
(8, 5, 'Campinas', 8009, 1, 'FARO', 998),
(8, 5, 'Campinas', 8005, 429, 'FARO', 999),
(8, 5, 'Canada', 8005, 430, 'FARO', 1000),
(8, 5, 'Carreiros de Baixo', 8005, 433, 'FARO', 1001),
(8, 5, 'Carreiros do Meio', 8005, 434, 'FARO', 1002),
(8, 5, 'Cerro do Bruxo', 8005, 435, 'FARO', 1003),
(8, 5, 'Chão de Cevada', 8005, 439, 'FARO', 1004),
(8, 5, 'Chaveca', 8005, 441, 'FARO', 1005),
(8, 5, 'Chelote', 8005, 442, 'FARO', 1006),
(8, 5, 'Complexo Desportivo', 8005, 445, 'FARO', 1007),
(8, 5, 'Conceição', 8005, 507, 'FARO', 1008),
(8, 5, 'Conceição', 8005, 442, 'FARO', 1009),
(8, 5, 'Conceição', 8005, 446, 'FARO', 1010),
(8, 5, 'Conceição', 8005, 21, 'FARO', 1011),
(8, 5, 'Conceição', 8005, 505, 'FARO', 1012),
(8, 5, 'Escuro', 8005, 448, 'FARO', 1013),
(8, 5, 'Ferradeira', 8005, 484, 'FARO', 1014),
(8, 5, 'Galvana', 8005, 486, 'FARO', 1015),
(8, 5, 'Jardina', 8005, 494, 'FARO', 1016),
(8, 5, 'Goinal', 8005, 495, 'FARO', 1017),
(8, 5, 'Laranjeiro', 8005, 498, 'FARO', 1018),
(8, 5, 'Lejana de Cima', 8009, 3, 'FARO', 1019),
(8, 5, 'Lejana de Cima', 8005, 499, 'FARO', 1020),
(8, 5, 'Mar e Guerra', 8005, 500, 'FARO', 1021),
(8, 5, 'Mata Lobos', 8005, 501, 'FARO', 1022),
(8, 5, 'Meloal', 8005, 503, 'FARO', 1023),
(8, 5, 'Monte Sabino', 8005, 505, 'FARO', 1024),
(8, 5, 'Outeiro', 8005, 507, 'FARO', 1025),
(8, 5, 'Paço Branco', 8005, 508, 'FARO', 1026),
(8, 5, 'Pão Branco', 8005, 510, 'FARO', 1027),
(8, 5, 'Patacão', 8005, 511, 'FARO', 1028),
(8, 5, 'Pereiro', 8005, 513, 'FARO', 1029),
(8, 5, 'Perna de Pau', 8009, 10, 'FARO', 1030),
(8, 5, 'Perna de Pau', 8005, 514, 'FARO', 1031),
(8, 5, 'Pontes de Marchil', 8009, 20, 'FARO', 1032),
(8, 5, 'Pontes de Marchil', 8009, 19, 'FARO', 1033),
(8, 5, 'Pontes de Marchil', 8005, 518, 'FARO', 1034),
(8, 5, 'Quinta Grande', 8005, 522, 'FARO', 1035),
(8, 5, 'Quinta Mateus Bolas', 8005, 523, 'FARO', 1036),
(8, 5, 'Quintal João Alfredo', 8005, 526, 'FARO', 1037),
(8, 5, 'Rio Seco', 8005, 528, 'FARO', 1038),
(8, 5, 'Torre Natal', 8005, 533, 'FARO', 1039),
(8, 5, 'Vale Carneiros', 8005, 535, 'FARO', 1040),
(8, 5, 'Vale da Amoreira', 8005, 536, 'FARO', 1041),
(8, 5, 'Virgílios', 8009, 17, 'FARO', 1042),
(8, 5, 'Virgílios', 8005, 540, 'FARO', 1043),
(8, 5, 'Horta das Figuras', 8005, 145, 'FARO', 1044),
(8, 5, 'Ariolos', 8005, 413, 'FARO', 1045),
(8, 5, 'Ladeira', 8005, 517, 'FARO', 1046),
(8, 5, 'Goldra de Baixo', 8005, 487, 'FARO', 1047),
(8, 5, 'Vale Grande', 8005, 404, 'FARO', 1048),
(8, 5, 'Gambelas', 8005, 226, 'FARO', 1049),
(8, 5, 'Gambelas', 8005, 294, 'FARO', 1050),
(8, 5, 'Gambelas', 8005, 319, 'FARO', 1051),
(8, 5, 'Gambelas', 8005, 222, 'FARO', 1052),
(8, 5, 'Gambelas', 8005, 211, 'FARO', 1053),
(8, 5, 'Gambelas', 8005, 214, 'FARO', 1054),
(8, 5, 'Gambelas', 8005, 195, 'FARO', 1055),
(8, 5, 'Gambelas', 8005, 200, 'FARO', 1056),
(8, 5, 'Gambelas', 8005, 201, 'FARO', 1057),
(8, 5, 'Gambelas', 8005, 336, 'FARO', 1058),
(8, 5, 'Gambelas', 8005, 146, 'FARO', 1059),
(8, 5, 'Gambelas', 8005, 215, 'FARO', 1060),
(8, 5, 'Gambelas', 8005, 549, 'FARO', 1061),
(8, 5, 'Senhora da Saúde', 8005, 148, 'FARO', 1062),
(8, 5, 'Barros', 8005, 428, 'FARO', 1063),
(8, 5, 'Zona Industrial do Bom João', 8000, 502, 'FARO', 1064),
(8, 5, 'Vale de Gralhas', 8005, 552, 'FARO', 1065),
(8, 5, 'Montenegro', 8005, 190, 'FARO', 1066),
(8, 5, 'Montenegro', 8005, 994, 'FARO', 1067),
(8, 5, 'Montenegro', 8005, 179, 'FARO', 1068),
(8, 5, 'Montenegro', 8005, 294, 'FARO', 1069),
(8, 5, 'Montenegro', 8005, 268, 'FARO', 1070),
(8, 5, 'Montenegro', 8005, 263, 'FARO', 1071),
(8, 5, 'Montenegro', 8005, 281, 'FARO', 1072),
(8, 5, 'Montenegro', 8005, 278, 'FARO', 1073),
(8, 5, 'Montenegro', 8005, 276, 'FARO', 1074),
(8, 5, 'Montenegro', 8005, 272, 'FARO', 1075),
(8, 5, 'Montenegro', 8005, 275, 'FARO', 1076),
(8, 5, 'Montenegro', 8005, 273, 'FARO', 1077),
(8, 5, 'Montenegro', 8005, 274, 'FARO', 1078),
(8, 5, 'Montenegro', 8005, 277, 'FARO', 1079),
(8, 5, 'Montenegro', 8005, 299, 'FARO', 1080),
(8, 5, 'Montenegro', 8005, 177, 'FARO', 1081),
(8, 5, 'Montenegro', 8005, 310, 'FARO', 1082),
(8, 5, 'Montenegro', 8005, 231, 'FARO', 1083),
(8, 5, 'Montenegro', 8005, 175, 'FARO', 1084),
(8, 5, 'Montenegro', 8005, 99, 'FARO', 1085),
(8, 5, 'Montenegro', 8005, 205, 'FARO', 1086),
(8, 5, 'Montenegro', 8005, 269, 'FARO', 1087),
(8, 5, 'Montenegro', 8005, 163, 'FARO', 1088),
(8, 5, 'Montenegro', 8005, 303, 'FARO', 1089),
(8, 5, 'Montenegro', 8005, 314, 'FARO', 1090),
(8, 5, 'Montenegro', 8005, 265, 'FARO', 1091),
(8, 5, 'Montenegro', 8005, 204, 'FARO', 1092),
(8, 5, 'Montenegro', 8005, 230, 'FARO', 1093),
(8, 5, 'Montenegro', 8005, 235, 'FARO', 1094),
(8, 5, 'Montenegro', 8005, 209, 'FARO', 1095),
(8, 5, 'Montenegro', 8005, 335, 'FARO', 1096),
(8, 5, 'Montenegro', 8005, 178, 'FARO', 1097),
(8, 5, 'Montenegro', 8005, 562, 'FARO', 1098),
(8, 5, 'Montenegro', 8005, 183, 'FARO', 1099),
(8, 5, 'Montenegro', 8005, 261, 'FARO', 1100),
(8, 5, 'Malvada', 8005, 553, 'FARO', 1101),
(8, 5, 'Vale de El-Rei', 8005, 515, 'FARO', 1102),
(8, 5, 'Torre', 8005, 443, 'FARO', 1103),
(8, 5, 'Hangares', 8005, 555, 'FARO', 1104),
(8, 5, 'Ilha do Cabo de Santa Maria', 8005, 554, 'FARO', 1105),
(8, 5, 'Lejana de Baixo', 8005, 302, 'FARO', 1106),
(8, 5, 'Moinho José Grelha', 8000, 814, 'FARO', 1107),
(8, 5, 'Ramalhete', 8005, 557, 'FARO', 1108),
(8, 5, 'Salgados', 8005, 540, 'FARO', 1109),
(8, 5, 'Peral', 8005, 559, 'FARO', 1110),
(8, 5, 'Vale da Venda', 8005, 412, 'FARO', 1111),
(8, 5, 'Atalaia', 8005, 560, 'FARO', 1112),
(8, 5, 'Aeroporto de Faro', 8005, 558, 'FARO', 1113),
(8, 5, 'Ascensão', 8005, 148, 'FARO', 1114),
(8, 5, 'Quinta da Jardina', 8005, 503, 'FARO', 1115),
(8, 5, 'Vale da Mó', 8005, 428, 'FARO', 1116),
(8, 5, 'Espragueira', 8005, 561, 'FARO', 1117),
(8, 5, 'Bemposta', 8005, 414, 'FARO', 1118),
(8, 5, 'Malhão', 8005, 561, 'FARO', 1119),
(8, 5, 'Quinta do Eucalipto', 8005, 169, 'FARO', 1120),
(8, 5, 'Quinta do Eucalipto', 8005, 227, 'FARO', 1121),
(8, 5, 'Quinta do Eucalipto', 8005, 170, 'FARO', 1122),
(8, 5, 'Quinta do Eucalipto', 8005, 300, 'FARO', 1123),
(8, 5, 'Quinta do Eucalipto', 8005, 229, 'FARO', 1124);

-- --------------------------------------------------------

--
-- Estrutura da tabela `concelhos`
--

CREATE TABLE `concelhos` (
  `cod_distrito` varchar(2) DEFAULT NULL,
  `cod_concelho` varchar(2) DEFAULT NULL,
  `nome_concelho` varchar(27) DEFAULT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `concelhos`
--

INSERT INTO `concelhos` (`cod_distrito`, `cod_concelho`, `nome_concelho`, `ID`) VALUES
('01', '06', 'Castelo de Paiva', 1),
('01', '07', 'Espinho', 2),
('01', '08', 'Estarreja', 3),
('01', '09', 'Santa Maria da Feira', 4),
('01', '10', 'Ílhavo', 5),
('01', '11', 'Mealhada', 6),
('01', '12', 'Murtosa', 7),
('01', '13', 'Oliveira de Azeméis', 8),
('01', '14', 'Oliveira do Bairro', 9),
('01', '15', 'Ovar', 10),
('01', '16', 'São João da Madeira', 11),
('01', '17', 'Sever do Vouga', 12),
('01', '18', 'Vagos', 13),
('01', '19', 'Vale de Cambra', 14),
('01', '01', 'Águeda', 15),
('01', '02', 'Albergaria-a-Velha', 16),
('01', '03', 'Anadia', 17),
('01', '04', 'Arouca', 18),
('01', '05', 'Aveiro', 19),
('02', '06', 'Castro Verde', 20),
('02', '07', 'Cuba', 21),
('02', '08', 'Ferreira do Alentejo', 22),
('02', '09', 'Mértola', 23),
('02', '10', 'Moura', 24),
('02', '11', 'Odemira', 25),
('02', '12', 'Ourique', 26),
('02', '13', 'Serpa', 27),
('02', '14', 'Vidigueira', 28),
('02', '01', 'Aljustrel', 29),
('02', '02', 'Almodôvar', 30),
('02', '03', 'Alvito', 31),
('02', '04', 'Barrancos', 32),
('02', '05', 'Beja', 33),
('03', '06', 'Esposende', 34),
('03', '07', 'Fafe', 35),
('03', '08', 'Guimarães', 36),
('03', '09', 'Póvoa de Lanhoso', 37),
('03', '10', 'Terras de Bouro', 38),
('03', '11', 'Vieira do Minho', 39),
('03', '12', 'Vila Nova de Famalicão', 40),
('03', '13', 'Vila Verde', 41),
('03', '14', 'Vizela', 42),
('03', '01', 'Amares', 43),
('03', '02', 'Barcelos', 44),
('03', '03', 'Braga', 45),
('03', '04', 'Cabeceiras de Basto', 46),
('03', '05', 'Celorico de Basto', 47),
('04', '06', 'Miranda do Douro', 48),
('04', '07', 'Mirandela', 49),
('04', '08', 'Mogadouro', 50),
('04', '09', 'Torre de Moncorvo', 51),
('04', '10', 'Vila Flor', 52),
('04', '11', 'Vimioso', 53),
('04', '12', 'Vinhais', 54),
('04', '01', 'Alfândega da Fé', 55),
('04', '02', 'Bragança', 56),
('04', '03', 'Carrazeda de Ansiães', 57),
('04', '04', 'Freixo de Espada à Cinta', 58),
('04', '05', 'Macedo de Cavaleiros', 59),
('05', '06', 'Oleiros', 60),
('05', '07', 'Penamacor', 61),
('05', '08', 'Proença-a-Nova', 62),
('05', '09', 'Sertã', 63),
('05', '10', 'Vila de Rei', 64),
('05', '11', 'Vila Velha de Ródão', 65),
('05', '01', 'Belmonte', 66),
('05', '02', 'Castelo Branco', 67),
('05', '03', 'Covilhã', 68),
('05', '04', 'Fundão', 69),
('05', '05', 'Idanha-a-Nova', 70),
('06', '06', 'Góis', 71),
('06', '07', 'Lousã', 72),
('06', '08', 'Mira', 73),
('06', '09', 'Miranda do Corvo', 74),
('06', '10', 'Montemor-o-Velho', 75),
('06', '11', 'Oliveira do Hospital', 76),
('06', '12', 'Pampilhosa da Serra', 77),
('06', '13', 'Penacova', 78),
('06', '14', 'Penela', 79),
('06', '15', 'Soure', 80),
('06', '16', 'Tábua', 81),
('06', '17', 'Vila Nova de Poiares', 82),
('06', '01', 'Arganil', 83),
('06', '02', 'Cantanhede', 84),
('06', '03', 'Coimbra', 85),
('06', '04', 'Condeixa-a-Nova', 86),
('06', '05', 'Figueira da Foz', 87),
('07', '06', 'Montemor-o-Novo', 88),
('07', '07', 'Mora', 89),
('07', '08', 'Mourão', 90),
('07', '09', 'Portel', 91),
('07', '10', 'Redondo', 92),
('07', '11', 'Reguengos de Monsaraz', 93),
('07', '12', 'Vendas Novas', 94),
('07', '13', 'Viana do Alentejo', 95),
('07', '14', 'Vila Viçosa', 96),
('07', '01', 'Alandroal', 97),
('07', '02', 'Arraiolos', 98),
('07', '03', 'Borba', 99),
('07', '04', 'Estremoz', 100),
('07', '05', 'Évora', 101),
('08', '06', 'Lagoa (Algarve)', 102),
('08', '07', 'Lagos', 103),
('08', '08', 'Loulé', 104),
('08', '09', 'Monchique', 105),
('08', '10', 'Olhão', 106),
('08', '11', 'Portimão', 107),
('08', '12', 'São Brás de Alportel', 108),
('08', '13', 'Silves', 109),
('08', '14', 'Tavira', 110),
('08', '15', 'Vila do Bispo', 111),
('08', '16', 'Vila Real de Santo António', 112),
('08', '01', 'Albufeira', 113),
('08', '02', 'Alcoutim', 114),
('08', '03', 'Aljezur', 115),
('08', '04', 'Castro Marim', 116),
('08', '05', 'Faro', 117),
('09', '06', 'Gouveia', 118),
('09', '07', 'Guarda', 119),
('09', '08', 'Manteigas', 120),
('09', '09', 'Meda', 121),
('09', '10', 'Pinhel', 122),
('09', '11', 'Sabugal', 123),
('09', '12', 'Seia', 124),
('09', '13', 'Trancoso', 125),
('09', '14', 'Vila Nova de Foz Côa', 126),
('09', '01', 'Aguiar da Beira', 127),
('09', '02', 'Almeida', 128),
('09', '03', 'Celorico da Beira', 129),
('09', '04', 'Figueira de Castelo Rodrigo', 130),
('09', '05', 'Fornos de Algodres', 131),
('10', '06', 'Caldas da Rainha', 132),
('10', '07', 'Castanheira de Pêra', 133),
('10', '08', 'Figueiró dos Vinhos', 134),
('10', '09', 'Leiria', 135),
('10', '10', 'Marinha Grande', 136),
('10', '11', 'Nazaré', 137),
('10', '12', 'Óbidos', 138),
('10', '13', 'Pedrógão Grande', 139),
('10', '14', 'Peniche', 140),
('10', '15', 'Pombal', 141),
('10', '16', 'Porto de Mós', 142),
('10', '01', 'Alcobaça', 143),
('10', '02', 'Alvaiázere', 144),
('10', '03', 'Ansião', 145),
('10', '04', 'Batalha', 146),
('10', '05', 'Bombarral', 147),
('11', '06', 'Lisboa', 148),
('11', '07', 'Loures', 149),
('11', '08', 'Lourinhã', 150),
('11', '09', 'Mafra', 151),
('11', '10', 'Oeiras', 152),
('11', '11', 'Sintra', 153),
('11', '12', 'Sobral de Monte Agraço', 154),
('11', '13', 'Torres Vedras', 155),
('11', '14', 'Vila Franca de Xira', 156),
('11', '15', 'Amadora', 157),
('11', '16', 'Odivelas', 158),
('11', '01', 'Alenquer', 159),
('11', '02', 'Arruda dos Vinhos', 160),
('11', '03', 'Azambuja', 161),
('11', '04', 'Cadaval', 162),
('11', '05', 'Cascais', 163),
('12', '06', 'Crato', 164),
('12', '07', 'Elvas', 165),
('12', '08', 'Fronteira', 166),
('12', '09', 'Gavião', 167),
('12', '10', 'Marvão', 168),
('12', '11', 'Monforte', 169),
('12', '12', 'Nisa', 170),
('12', '13', 'Ponte de Sor', 171),
('12', '14', 'Portalegre', 172),
('12', '15', 'Sousel', 173),
('12', '01', 'Alter do Chão', 174),
('12', '02', 'Arronches', 175),
('12', '03', 'Avis', 176),
('12', '04', 'Campo Maior', 177),
('12', '05', 'Castelo de Vide', 178),
('13', '06', 'Maia', 179),
('13', '07', 'Marco de Canaveses', 180),
('13', '08', 'Matosinhos', 181),
('13', '09', 'Paços de Ferreira', 182),
('13', '10', 'Paredes', 183),
('13', '11', 'Penafiel', 184),
('13', '12', 'Porto', 185),
('13', '13', 'Póvoa de Varzim', 186),
('13', '14', 'Santo Tirso', 187),
('13', '15', 'Valongo', 188),
('13', '16', 'Vila do Conde', 189),
('13', '17', 'Vila Nova de Gaia', 190),
('13', '18', 'Trofa', 191),
('13', '01', 'Amarante', 192),
('13', '02', 'Baião', 193),
('13', '03', 'Felgueiras', 194),
('13', '04', 'Gondomar', 195),
('13', '05', 'Lousada', 196),
('14', '06', 'Cartaxo', 197),
('14', '07', 'Chamusca', 198),
('14', '08', 'Constância', 199),
('14', '09', 'Coruche', 200),
('14', '10', 'Entroncamento', 201),
('14', '11', 'Ferreira do Zêzere', 202),
('14', '12', 'Golegã', 203),
('14', '13', 'Mação', 204),
('14', '14', 'Rio Maior', 205),
('14', '15', 'Salvaterra de Magos', 206),
('14', '16', 'Santarém', 207),
('14', '17', 'Sardoal', 208),
('14', '18', 'Tomar', 209),
('14', '19', 'Torres Novas', 210),
('14', '20', 'Vila Nova da Barquinha', 211),
('14', '21', 'Ourém', 212),
('14', '01', 'Abrantes', 213),
('14', '02', 'Alcanena', 214),
('14', '03', 'Almeirim', 215),
('14', '04', 'Alpiarça', 216),
('14', '05', 'Benavente', 217),
('15', '06', 'Moita', 218),
('15', '07', 'Montijo', 219),
('15', '08', 'Palmela', 220),
('15', '09', 'Santiago do Cacém', 221),
('15', '10', 'Seixal', 222),
('15', '11', 'Sesimbra', 223),
('15', '12', 'Setúbal', 224),
('15', '13', 'Sines', 225),
('15', '01', 'Alcácer do Sal', 226),
('15', '02', 'Alcochete', 227),
('15', '03', 'Almada', 228),
('15', '04', 'Barreiro', 229),
('15', '05', 'Grândola', 230),
('16', '06', 'Ponte da Barca', 231),
('16', '07', 'Ponte de Lima', 232),
('16', '08', 'Valença', 233),
('16', '09', 'Viana do Castelo', 234),
('16', '10', 'Vila Nova de Cerveira', 235),
('16', '01', 'Arcos de Valdevez', 236),
('16', '02', 'Caminha', 237),
('16', '03', 'Melgaço', 238),
('16', '04', 'Monção', 239),
('16', '05', 'Paredes de Coura', 240),
('17', '05', 'Mondim de Basto', 241),
('17', '06', 'Montalegre', 242),
('17', '07', 'Murça', 243),
('17', '08', 'Peso da Régua', 244),
('17', '09', 'Ribeira de Pena', 245),
('17', '10', 'Sabrosa', 246),
('17', '11', 'Santa Marta de Penaguião', 247),
('17', '12', 'Valpaços', 248),
('17', '13', 'Vila Pouca de Aguiar', 249),
('17', '14', 'Vila Real', 250),
('17', '01', 'Alijó', 251),
('17', '02', 'Boticas', 252),
('17', '03', 'Chaves', 253),
('17', '04', 'Mesão Frio', 254),
('18', '05', 'Lamego', 255),
('18', '06', 'Mangualde', 256),
('18', '07', 'Moimenta da Beira', 257),
('18', '08', 'Mortágua', 258),
('18', '09', 'Nelas', 259),
('18', '10', 'Oliveira de Frades', 260),
('18', '11', 'Penalva do Castelo', 261),
('18', '12', 'Penedono', 262),
('18', '13', 'Resende', 263),
('18', '14', 'Santa Comba Dão', 264),
('18', '15', 'São João da Pesqueira', 265),
('18', '16', 'São Pedro do Sul', 266),
('18', '17', 'Sátão', 267),
('18', '18', 'Sernancelhe', 268),
('18', '19', 'Tabuaço', 269),
('18', '20', 'Tarouca', 270),
('18', '21', 'Tondela', 271),
('18', '22', 'Vila Nova de Paiva', 272),
('18', '23', 'Viseu', 273),
('18', '24', 'Vouzela', 274),
('18', '01', 'Armamar', 275),
('18', '02', 'Carregal do Sal', 276),
('18', '03', 'Castro Daire', 277),
('18', '04', 'Cinfães', 278),
('31', '05', 'Ponta do Sol', 279),
('31', '06', 'Porto Moniz', 280),
('31', '07', 'Ribeira Brava', 281),
('31', '08', 'Santa Cruz', 282),
('31', '09', 'Santana', 283),
('31', '10', 'São Vicente', 284),
('31', '01', 'Calheta (Madeira)', 285),
('31', '02', 'Câmara de Lobos', 286),
('31', '03', 'Funchal', 287),
('31', '04', 'Machico', 288),
('32', '01', 'Porto Santo', 289),
('41', '01', 'Vila do Porto', 290),
('42', '05', 'Ribeira Grande', 291),
('42', '06', 'Vila Franca do Campo', 292),
('42', '01', 'Lagoa (São Miguel)', 293),
('42', '02', 'Nordeste', 294),
('42', '03', 'Ponta Delgada', 295),
('42', '04', 'Povoação', 296),
('43', '01', 'Angra do Heroísmo', 297),
('43', '02', 'Praia da Vitória', 298),
('44', '01', 'Santa Cruz da Graciosa', 299),
('45', '01', 'Calheta (São Jorge)', 300),
('45', '02', 'Velas', 301),
('46', '01', 'Lajes do Pico', 302),
('46', '02', 'Madalena', 303),
('46', '03', 'São Roque do Pico', 304),
('47', '01', 'Horta', 305),
('48', '01', 'Lajes das Flores', 306),
('48', '02', 'Santa Cruz das Flores', 307),
('49', '01', 'Corvo', 308);

-- --------------------------------------------------------

--
-- Estrutura da tabela `distritos`
--

CREATE TABLE `distritos` (
  `cod_distrito` varchar(2) DEFAULT NULL,
  `nome_distrito` varchar(19) DEFAULT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `distritos`
--

INSERT INTO `distritos` (`cod_distrito`, `nome_distrito`, `ID`) VALUES
('01', 'Aveiro', 1),
('02', 'Beja', 2),
('03', 'Braga', 3),
('04', 'Bragança', 4),
('05', 'Castelo Branco', 5),
('06', 'Coimbra', 6),
('07', 'Évora', 7),
('08', 'Faro', 8),
('09', 'Guarda', 9),
('10', 'Leiria', 10),
('11', 'Lisboa', 11),
('12', 'Portalegre', 12),
('13', 'Porto', 13),
('14', 'Santarém', 14),
('15', 'Setúbal', 15),
('16', 'Viana do Castelo', 16),
('17', 'Vila Real', 17),
('18', 'Viseu', 18),
('31', 'Ilha da Madeira', 19),
('32', 'Ilha de Porto Santo', 20),
('41', 'Ilha de Santa Maria', 21),
('42', 'Ilha de São Miguel', 22),
('43', 'Ilha Terceira', 23),
('44', 'Ilha da Graciosa', 24),
('45', 'Ilha de São Jorge', 25),
('46', 'Ilha do Pico', 26),
('47', 'Ilha do Faial', 27),
('48', 'Ilha das Flores', 28),
('49', 'Ilha do Corvo', 29);

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(111, 'admin', 'logentry'),
(113, 'auth', 'group'),
(112, 'auth', 'permission'),
(114, 'auth', 'user'),
(89, 'clientes', 'cadeira'),
(90, 'clientes', 'cliente'),
(91, 'clientes', 'estadosmenu'),
(92, 'clientes', 'fatura'),
(93, 'clientes', 'funcionario'),
(94, 'clientes', 'funcionarionotificacao'),
(95, 'clientes', 'ingredientes'),
(96, 'clientes', 'menurestaurante'),
(97, 'clientes', 'mesa'),
(98, 'clientes', 'notificacao'),
(106, 'clientes', 'notificacaorestaurante'),
(99, 'clientes', 'pedido'),
(100, 'clientes', 'produto'),
(107, 'clientes', 'produtoingredientes'),
(108, 'clientes', 'produtomenurestaurante'),
(109, 'clientes', 'produtopedido'),
(101, 'clientes', 'reserva'),
(110, 'clientes', 'reservamesa'),
(102, 'clientes', 'restaurante'),
(103, 'clientes', 'sala'),
(104, 'clientes', 'tipofuncionario'),
(105, 'clientes', 'tipoproduto'),
(115, 'contenttypes', 'contenttype'),
(120, 'cozinha', 'cadeira'),
(121, 'cozinha', 'estadosmenu'),
(122, 'cozinha', 'fatura'),
(123, 'cozinha', 'funcionario'),
(124, 'cozinha', 'funcionarionotificacao'),
(125, 'cozinha', 'ingredientes'),
(126, 'cozinha', 'menurestaurante'),
(127, 'cozinha', 'mesa'),
(133, 'cozinha', 'notificacao'),
(134, 'cozinha', 'notificacaorestaurante'),
(128, 'cozinha', 'pedido'),
(135, 'cozinha', 'produto'),
(136, 'cozinha', 'produtoingredientes'),
(138, 'cozinha', 'produtomenurestaurante'),
(137, 'cozinha', 'produtopedido'),
(140, 'cozinha', 'reserva'),
(139, 'cozinha', 'reservamesa'),
(129, 'cozinha', 'restaurante'),
(130, 'cozinha', 'sala'),
(131, 'cozinha', 'tipofuncionario'),
(132, 'cozinha', 'tipoproduto'),
(45, 'estatistica', 'cadeira'),
(64, 'estatistica', 'cliente'),
(46, 'estatistica', 'estadosmenu'),
(47, 'estatistica', 'fatura'),
(48, 'estatistica', 'funcionario'),
(65, 'estatistica', 'funcionarionotificacao'),
(49, 'estatistica', 'ingredientes'),
(50, 'estatistica', 'menurestaurante'),
(51, 'estatistica', 'mesa'),
(52, 'estatistica', 'notificacao'),
(66, 'estatistica', 'notificacaorestaurante'),
(53, 'estatistica', 'pedido'),
(54, 'estatistica', 'produto'),
(60, 'estatistica', 'produtoingredientes'),
(61, 'estatistica', 'produtomenurestaurante'),
(62, 'estatistica', 'produtopedido'),
(55, 'estatistica', 'reserva'),
(63, 'estatistica', 'reservamesa'),
(56, 'estatistica', 'restaurante'),
(57, 'estatistica', 'sala'),
(58, 'estatistica', 'tipofuncionario'),
(59, 'estatistica', 'tipoproduto'),
(23, 'funcionarios', 'cadeira'),
(42, 'funcionarios', 'cliente'),
(24, 'funcionarios', 'estadosmenu'),
(25, 'funcionarios', 'fatura'),
(26, 'funcionarios', 'funcionario'),
(43, 'funcionarios', 'funcionarionotificacao'),
(27, 'funcionarios', 'ingredientes'),
(28, 'funcionarios', 'menurestaurante'),
(29, 'funcionarios', 'mesa'),
(30, 'funcionarios', 'notificacao'),
(44, 'funcionarios', 'notificacaorestaurante'),
(31, 'funcionarios', 'pedido'),
(32, 'funcionarios', 'produto'),
(38, 'funcionarios', 'produtoingredientes'),
(39, 'funcionarios', 'produtomenurestaurante'),
(40, 'funcionarios', 'produtopedido'),
(33, 'funcionarios', 'reserva'),
(41, 'funcionarios', 'reservamesa'),
(34, 'funcionarios', 'restaurante'),
(35, 'funcionarios', 'sala'),
(36, 'funcionarios', 'tipofuncionario'),
(37, 'funcionarios', 'tipoproduto'),
(67, 'notificacoes', 'cadeira'),
(86, 'notificacoes', 'cliente'),
(68, 'notificacoes', 'estadosmenu'),
(69, 'notificacoes', 'fatura'),
(70, 'notificacoes', 'funcionario'),
(87, 'notificacoes', 'funcionarionotificacao'),
(71, 'notificacoes', 'ingredientes'),
(72, 'notificacoes', 'menurestaurante'),
(73, 'notificacoes', 'mesa'),
(74, 'notificacoes', 'notificacao'),
(88, 'notificacoes', 'notificacaorestaurante'),
(75, 'notificacoes', 'pedido'),
(76, 'notificacoes', 'produto'),
(82, 'notificacoes', 'produtoingredientes'),
(83, 'notificacoes', 'produtomenurestaurante'),
(84, 'notificacoes', 'produtopedido'),
(77, 'notificacoes', 'reserva'),
(85, 'notificacoes', 'reservamesa'),
(78, 'notificacoes', 'restaurante'),
(79, 'notificacoes', 'sala'),
(80, 'notificacoes', 'tipofuncionario'),
(81, 'notificacoes', 'tipoproduto'),
(1, 'restaurantes', 'cadeira'),
(20, 'restaurantes', 'cliente'),
(117, 'restaurantes', 'codigos_postais_parcial'),
(118, 'restaurantes', 'concelhos'),
(119, 'restaurantes', 'distritos'),
(2, 'restaurantes', 'estadosmenu'),
(3, 'restaurantes', 'fatura'),
(4, 'restaurantes', 'funcionario'),
(21, 'restaurantes', 'funcionarionotificacao'),
(5, 'restaurantes', 'ingredientes'),
(6, 'restaurantes', 'menurestaurante'),
(7, 'restaurantes', 'mesa'),
(8, 'restaurantes', 'notificacao'),
(22, 'restaurantes', 'notificacaorestaurante'),
(9, 'restaurantes', 'pedido'),
(10, 'restaurantes', 'produto'),
(16, 'restaurantes', 'produtoingredientes'),
(17, 'restaurantes', 'produtomenurestaurante'),
(18, 'restaurantes', 'produtopedido'),
(11, 'restaurantes', 'reserva'),
(19, 'restaurantes', 'reservamesa'),
(12, 'restaurantes', 'restaurante'),
(13, 'restaurantes', 'sala'),
(14, 'restaurantes', 'tipofuncionario'),
(15, 'restaurantes', 'tipoproduto'),
(116, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-07 14:00:05.776246'),
(2, 'auth', '0001_initial', '2022-05-07 14:00:16.043543'),
(3, 'admin', '0001_initial', '2022-05-07 14:00:18.136668'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-07 14:00:18.168931'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-07 14:00:18.209857'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-07 14:00:18.835305'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-07 14:00:19.668284'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-07 14:00:19.923900'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-07 14:00:19.978318'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-07 14:00:21.927669'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-07 14:00:21.972212'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-07 14:00:22.032271'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-07 14:00:22.131430'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-07 14:00:22.254375'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-07 14:00:22.377188'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-07 14:00:22.438496'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-07 14:00:22.539743'),
(18, 'clientes', '0001_initial', '2022-05-07 14:00:22.594826'),
(19, 'estatistica', '0001_initial', '2022-05-07 14:00:22.648146'),
(20, 'estatistica', '0002_funcnotficaenv_funcnotificarec_and_more', '2022-05-07 14:00:22.683043'),
(21, 'estatistica', '0003_cliente_funcionarionotificacao_and_more', '2022-05-07 14:00:22.744408'),
(22, 'estatistica', '0004_notificacaorestaurante', '2022-05-07 14:00:22.781148'),
(23, 'funcionarios', '0001_initial', '2022-05-07 14:00:22.851283'),
(24, 'funcionarios', '0002_funcnotficaenv_funcnotificarec_and_more', '2022-05-07 14:00:22.902688'),
(25, 'funcionarios', '0003_cliente_funcionarionotificacao_and_more', '2022-05-07 14:00:22.952379'),
(26, 'funcionarios', '0004_notificacaorestaurante', '2022-05-07 14:00:22.990866'),
(27, 'notificacoes', '0001_initial', '2022-05-07 14:00:23.410353'),
(28, 'notificacoes', '0002_cliente_funcionarionotificacao_and_more', '2022-05-07 14:00:23.466757'),
(29, 'notificacoes', '0003_notificacaorestaurante', '2022-05-07 14:00:23.522921'),
(30, 'restaurantes', '0001_initial', '2022-05-07 14:00:23.595631'),
(31, 'restaurantes', '0002_funcnotficaenv_funcnotificarec_and_more', '2022-05-07 14:00:23.644067'),
(32, 'restaurantes', '0003_cliente_funcionarionotificacao_and_more', '2022-05-07 14:00:23.708400'),
(33, 'restaurantes', '0004_notificacaorestaurante', '2022-05-07 14:00:23.744150'),
(34, 'sessions', '0001_initial', '2022-05-07 14:00:24.108163'),
(35, 'clientes', '0002_delete_cliente', '2022-05-21 14:04:07.357634'),
(36, 'cozinha', '0001_initial', '2022-05-21 14:04:07.412517'),
(37, 'estatistica', '0005_delete_cliente', '2022-05-21 14:04:07.420512'),
(38, 'funcionarios', '0005_delete_cliente', '2022-05-21 14:04:07.427532'),
(39, 'notificacoes', '0004_delete_cliente', '2022-05-21 14:04:07.437894'),
(40, 'restaurantes', '0005_codigos_postais_parcial_concelhos_distritos_and_more', '2022-05-21 14:04:07.450371');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('07rnrvcqrr8yrmmiu6nms83pgtzz75am', '.eJxNj8EKwjAQRP9lzyk0sWk1Zy8FEQ_eJdStrrTZkqQn8d_NCkJvw7yZZecNmRYe1zCAaxVQOvGDAjitIGLK_RGcURB4RnAwTIQhIyiQwob9gYOXp1kCGSccOWyINrvGtt3-UGhYZ4y8YErsU2FN8e7kizK1MVVtKy3Wk6OnQAOx9DtnrXQ5S7Coc7z4cuH37LWsuCU_CdLw-QJAUkDh:1npXe4:_DR4yzVx8bn9s_ROlO7hO5fniF93LxhX5RKjNuImxzw', '2022-05-27 15:56:00.266004'),
('4l9xcjdmqcm6181zoe70dmfw9tcpppa2', 'eyJ0aXBvZnVuYyI6MSwiaXNMb2dpbiI6MSwicmVzdElEIjpudWxsLCJub21lIjoiYWRtaW4iLCJmdW5jSUQiOjh9:1nuXAt:4710YZdCQP17Hqkz9o7wBSEDM_PzGWDNI2IDiMZpHMM', '2022-06-10 10:26:31.067504'),
('5buwbkno4krgfkmq9anq0ipetl37y69f', 'eyJ0aXBvZnVuYyI6MSwiaXNMb2dpbiI6MSwicmVzdElEIjoyLCJub21lIjoiY2xpZW50ZSIsImZ1bmNJRCI6Mn0:1npRhk:Iy9XAvRq0-C26rL8lP__5iEQuzl6vlM1EyQIqjiEhDs', '2022-05-27 09:35:24.013337'),
('cjklsw1r5cuggxp2pcrswmbttbitylhn', '.eJyrVirJLMhPK81LVrIy1FHKLPbJT8_MA7OLUotLPF2UrPJKc3J0lPLyc1OVrJQSU3KB0jpKIB0gSQugnpR4oFKgnJFSLQACrhjH:1nuGj3:3HtDOst1s-9cGELvEJbQb_bqZfApRwvBbWe7naUNwOk', '2022-06-09 16:52:41.642496'),
('dogklzbxazaknpugt2x7qfj9j0a14ogw', 'eyJ0aXBvZnVuYyI6NiwiaXNMb2dpbiI6MSwicmVzdElEIjoyLCJub21lIjoiY2xpZW50ZSIsImZ1bmNJRCI6Mn0:1npVGE:OKHgFEcG8Dr7il7lEfTWcYHVhj2LRp8Rw8uClNHWuus', '2022-05-27 13:23:14.791306'),
('dt36wbju05uluica1bwvpp7qn90wgfcm', 'eyJ0aXBvZnVuYyI6MSwiaXNMb2dpbiI6MSwicmVzdElEIjoyLCJub21lIjoiR3VpbGhlcm1lIFJhbW9zIiwiZnVuY0lEIjoxMX0:1nw8yI:_fETnuIYaI3o_Buf3lQWv7a-QeMjHkGNNnk9mB8C3jQ', '2022-06-14 21:00:10.385425'),
('f4rjqkdn0ozkg9srdnjckzgo557xra46', '.eJxNjLEOwjAMRP_FcyslgVDIR6AO7JVVjDBK4ioJE-q_4zCxnd67uw9kSbRGptwIAryQE8EAjSI9JP8Z6w5Hf5rOF7X5najIRrUKVnVe2Z1RkzPOjcaPdlL0lIKceWX57YMxfSutFzVdy4z6AMEOcONNloqxKwv7F_4GLSE:1nnMeW:DxeiDJ4wrfGTH_q4WpgvCCw3XPax7fSpqIo4bO-mxV0', '2022-05-21 15:47:28.694798'),
('fhrtt61sibjs7y3yz56l0rdgmd9foiw6', 'eyJmdW5jSUQiOjExLCJpZF9yZXMiOiIyIiwiaWRfc2FsYSI6IjEifQ:1nvmNb:dAFvnmLfg9lmua7KvUxuq1yTz_ymVFiDkLdAkXNcrAA', '2022-06-13 20:52:47.500973'),
('g9hrzx84npfy8nz92ghaetta4gjbg4oe', '.eJwdi8EKgCAQBf_lnb3U0VvQJegfQtJiQXfD1VP076m3GZh5UeiRq_IJOxmQ7nITD85By7bCco3RgCUFWCw-EZOW7LxkGPSzR_31R1taM2OIuuiGfT-WjB_1:1nnLC8:ygjTCRMUp1k6n-bd8DTre3zDptAYgAS4Oy40aLZNNtU', '2022-05-21 14:14:04.401830'),
('gub975bo4lzxq0id0q4vhlji4y64mxpe', '.eJxNjs0KwkAMhF9Fcm6hu7b-7LkXQcSDd1lrqoE2Kbvbk_jubgpCL2Ey3yTMB_qZu1MLzhbAMmI3EHJCcPAQHzc6oICEA_bCK2rstm52-8MxU55HDDJhjJp2UGfvST4rW1lbVk1p1HpL8MTUkeh97azRW0kazOoSrj5_AGcKuNEk9-gHRZpKedeiC6R4lhfxogPGtGqf4_-K3x_GlUI2:1np9e4:pkdLMM8pKjMU-gYLZQmubSraGkxqsAvF0KxYJjd7PVE', '2022-05-26 14:18:24.950812'),
('gwvkxksz2qrcajwm7dtrnlaeeyzgrjqv', '.eJwtjDEKwzAQBL8itlYTl6rTGFLlA0ZIG3Ng3QWf7Cbk71FCuoWZ2Re6PO1xaEG6RIjfbBX97Z3e5yvSFKHWiISyCbUTEd_gzxrVPa9sQ7jTuZ85sErPNYdiLfhR6G4jkrqMz6FNeH8AK5knCQ:1npCvi:Ux00t-usq6ntH4RArvINHqmK0KsrEVDthvkMLSzfkDg', '2022-05-26 17:48:50.217922'),
('hn2wwtjfoxl2njkp19x73ay6ivt78xwl', '.eJxNj8EKgzAMht8lZwVbp9t63mUwxg67j-KiBjSRtp7G3n2pMPD28X9_QvKBRIv0K3fgTAEUbzIQbxwwpusFnC2AZUZw0E2EnBAKyAM79xcOhpWmEcOcSwkn7IV31tj60LTH01ktrzMGWTBG8VFdq9mbvJKtrC2rpjS1RqMET0wdSTbG1bnHknJR6R4eXjdsBz_1k1f0U1YGvj-Pi0KT:1npEcL:I-v9JU6K3E70dhyYHonaQSAVzB6jKQwxZorU5zT7emc', '2022-05-26 19:36:57.308243'),
('i775pzfx4sjyqjd9jioguiywzxbksn07', '.eJyrVkorzUv2dFGystBRykyJL0otVrJSMlICc4oTcxKhPJCq-MwUIM8UyCvJLMgHiShZGQIVFvvkp2fmgdlA7SUgw_JKc3J0lPLyc1OBOhJTcoHStQC7eiCv:1ntqr0:eArZ-NDXiUYnsBLXb0elMni1wPC76naTpngbv40Sets', '2022-06-08 13:15:10.738658'),
('kvqz1y7spd27lacu4eanm2s9uly7vpzs', 'eyJ0aXBvZnVuYyI6MSwiaXNMb2dpbiI6MSwicmVzdElEIjpudWxsLCJub21lIjoiQWRtaW5pc3RyYWRvciIsImZ1bmNJRCI6MX0:1nspLc:w-HfZ1FCTjMgG2lkPXX5pTNoSWGfl90QvhQB9b0C7IY', '2022-06-05 17:26:32.938070'),
('l7rn66iakmg9kanhvcjxpmv55fllasck', '.eJxNj0ELgkAQhf_LnBXcTbP23CWI6NA9Bh1tQHfEXQ8V_fdmhcDb433vDfM-EHmSbvENOJMBh4v07Fc9U4jnEzibgZeRwEEzMPlIkEEqbNgfOOjx9cYWNRJpoE78hhm7K6t9fTgq9ctIs0wUgmBQVqrXMqqyhbV5UeWmVuspM7LnhiX1S2dM6kpMQVXX-YZ6YX33rjseAYeEDHx_4tFBrw:1npG6J:R-6mPCpzJH5YPNJmk1Q3qZGghwf7ZeBd0VHJmoaI34w', '2022-05-26 21:11:59.465822'),
('myfq69lrg1igiin3vzb7paerg0rspe31', '.eJyrVkorzUv2dFGyMjTUUSrJLMgH8YE8HaXMYp_89Mw8MLsotbgEpMhIRykvPzdVyUrJvTQzJyO1KDdVISgxN79YCag-JR6oDChlBOEUJ-Ykgnm1AENmHxA:1nvPeY:sbZQCw7VOnqkLjyAnp99JZ1Uv_WTWGHxxR2FaO7zTq8', '2022-06-12 20:36:46.549460'),
('sr7mzr7fji9111x6karb1sztbq6um1ub', '.eJxNj0urAjEMhf_KkPUITnV8dO1GuFwu4l5CJ46BaSNN527E_24qCO6S852TxwMK3-U6pwB-0wLrj4ycwHctZNJyPIB3LSSJBB7CxJQKQQs18MU-wMM483SjHKup0ERXSV-0c6t1v9nu9kbTHCnLnVQF1djatIHRKrd0brHsF25n0k0ycuLAUvMr3_c1K6UarfrNf2gT3gef7ZOL4lRRZyxSUsWRovUnUsr_2NDABQdsgsRG51C3w_MFuRFRlA:1npS3T:O4Ad0EIDXsjNN8grgL3n8iL4gsogBXOOvSw63vdJ9OU', '2022-05-27 09:57:51.849023'),
('t86l0otwikd76papxbi5ij7wl9pgipmg', 'eyJ0aXBvZnVuYyI6MSwiaXNMb2dpbiI6MSwicmVzdElEIjpudWxsLCJub21lIjoiYWRtaW4iLCJmdW5jSUQiOjh9:1nub5K:jS-1uZ2pwwkjEPywnIk1Is4rsSbZBwtaYmxAaqHl4GA', '2022-06-10 14:37:02.257305'),
('wptuloanwn8vz6v43w8icsku7tk4aiin', '.eJxtj81qAzEMhF9l8XkDtvuTZs-BUiilhN6D8CqJwJaCZfdS-u6V00sPvY39jcczX-7UOb3s3RIeZsdSMGVCbugW99wpX7AWnA5QRN3sGmY8Cf_x7ELYbu_C084o94JVrqgqoMbu7W4lMBV9jBv_uInDdpEKxJRIjAS_eD_eShtGU2_1HSzBCs3ug65yVMgDBWMFWRXOWOx8QMX6CROu1GCFKUmZtKfxuzlpPVYcJeKobTFj5i2T9FXOxDdtlja2c8_5d_0_s79_APsMW7o:1nwL9L:OZD7p31i-PHDcee5qSxQJ01kadV41ElrFlATEkNgWuw', '2022-06-15 10:00:23.026234'),
('xygxwrxmdy9je2e8bdooyvymalnwsw56', '.eJyrVkorzUv2dFGyMjTUUcpMiS9KLVayUjJU0lEqySzIB0kCpYAyxT756Zl5YDZQSQlIh5GOUl5-bipQuXtpZk5GalFuqkJQYm5-sVItAIerGyI:1nx9gX:YCFcmycsIq8ulBxBLX4wg58FM5UUO82t0wNqOOXU0S4', '2022-06-17 15:58:01.672575'),
('zrbuk2kpra1dply7nbv2zuyvphw12y79', '.eJyrVkorzUv2dFGyMjTUUcpMiS9KLVayUjJS0gFLxGemAHmGxkBuSWZBPkgIqBKosNgnPz0zD8wG6igBGWCko5SXn5sKVO9empmTkVqUm6oQlJibX6xUCwAaWB9N:1nuiZT:AlL0e3keODdilVTpn3uGfmO4leSYAgaAloJcryJmmDI', '2022-06-10 22:36:39.249190');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estadosmenu`
--

CREATE TABLE `estadosmenu` (
  `ID` int(10) NOT NULL,
  `Estado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fatura`
--

CREATE TABLE `fatura` (
  `ID` int(10) NOT NULL,
  `NomeCliente` varchar(30) DEFAULT NULL,
  `NumeroContribuinte` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `ID` int(10) NOT NULL,
  `TipoFuncionarioID` int(10) NOT NULL,
  `RestauranteID` int(10) DEFAULT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Telefone` bigint(13) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`ID`, `TipoFuncionarioID`, `RestauranteID`, `Nome`, `Telefone`, `Email`, `Password`) VALUES
(2, 6, 2, 'cliente', 123456789, 'cliente@gmail.com', 'pbkdf2_sha256$320000$ea9PX8i2c7I7Cf47zv3YOT$Ztm9NhgTJax/0M6Wcd4MuIi68+C4jbJDKIYK0BLBzTM='),
(4, 3, 2, 'André Singh', 123456879, 'cozinha@gmail.com', 'pbkdf2_sha256$320000$4Nm8NXL54vAaMJkl6Qye8l$aynvQ0n3GURFQuJyia39kyGGLcH8l5X2j+lziFinAdY='),
(5, 4, 2, 'Rui Paraísu', 987654321, 'garcon@gmail.com', 'pbkdf2_sha256$320000$tuGY6yOM5GyO4lYG2fyKvM$iC5GWlBuWWwmH7cpWEUICIpkeT57OEL6fyft6U6YQtk='),
(8, 7, NULL, 'admin', 123456789, '123@gmail.com', 'pbkdf2_sha256$320000$rwDH5CEcYwVqx8rUyTdino$f+bvzDTDDNuxEQlFBR7fg4C/BXvJs6eg/+dNJh5bNtg='),
(11, 1, 2, 'Guilherme Ramos', 232323232, 'admin@gmail.com', 'pbkdf2_sha256$320000$3sRBtHHiLkDFHOEMraxilV$/pWEGiYi7qxNceozhg3IHTqXhPhowgdmEjY9rksqMOQ='),
(15, 1, NULL, 'Guilherme Ramos', 123456789, 'admin2@gmail.com', 'pbkdf2_sha256$320000$7YfAgaK62jwmMmO8FYpZSc$QvQJgMldN2Gd4JS1jyZqjt1vkTcbDPU1z4prUIrAeAU=');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario_notificacao`
--

CREATE TABLE `funcionario_notificacao` (
  `ID` int(10) NOT NULL,
  `FuncionarioID_Recetor` int(10) DEFAULT NULL,
  `FuncionarioID` int(10) NOT NULL,
  `visto` int(1) NOT NULL,
  `MenuRestauranteID` int(10) DEFAULT NULL,
  `PedidoID` int(10) DEFAULT NULL,
  `Data` datetime NOT NULL,
  `NotificacaoID` int(10) NOT NULL,
  `Nome restaurante` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario_notificacao`
--

INSERT INTO `funcionario_notificacao` (`ID`, `FuncionarioID_Recetor`, `FuncionarioID`, `visto`, `MenuRestauranteID`, `PedidoID`, `Data`, `NotificacaoID`, `Nome restaurante`) VALUES
(39, 8, 8, 1, NULL, NULL, '2022-05-25 14:14:12', 2, 'Sabores do Churrasco'),
(40, 8, 8, 1, NULL, NULL, '2022-05-25 14:15:10', 2, 'Sabores do Churrasco'),
(41, 8, 8, 1, NULL, NULL, '2022-05-26 17:52:41', 2, 'Sabores do Churrasco'),
(42, 11, 8, 1, NULL, NULL, '2022-05-27 22:02:14', 2, 'Sabores do Churrasco'),
(43, 11, 11, 1, NULL, NULL, '2022-05-27 22:25:10', 2, 'Koko'),
(44, 11, 8, 1, NULL, NULL, '2022-05-27 23:22:33', 1, '12dw'),
(46, 11, 11, 1, NULL, NULL, '2022-06-01 10:20:26', 2, 'Koko'),
(47, 8, 8, 1, NULL, NULL, '2022-06-03 16:18:08', 2, 'Koko'),
(48, 11, 11, 1, NULL, NULL, '2022-06-03 16:35:27', 2, 'Koko'),
(49, 11, 11, 1, NULL, NULL, '2022-06-03 16:35:29', 2, 'Koko'),
(50, 11, 11, 1, NULL, NULL, '2022-06-03 16:35:34', 2, 'Koko');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingredientes`
--

CREATE TABLE `ingredientes` (
  `ID` int(10) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `menurestaurante`
--

CREATE TABLE `menurestaurante` (
  `ID` int(10) NOT NULL,
  `FuncionarioID` int(10) NOT NULL,
  `EstadosMenuID` int(10) NOT NULL,
  `DataInicio` date DEFAULT NULL,
  `DataFim` date DEFAULT NULL,
  `RestauranteID` int(10) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mesa`
--

CREATE TABLE `mesa` (
  `ID` int(10) NOT NULL,
  `SalaID` int(10) DEFAULT NULL,
  `Numero` int(10) DEFAULT NULL,
  `MaximoPessoas` int(10) NOT NULL,
  `Limpeza` tinyint(1) NOT NULL,
  `Ocupada` tinyint(1) NOT NULL,
  `Reservada` tinyint(1) NOT NULL,
  `Posicaox` int(10) NOT NULL,
  `Posicaoy` int(10) NOT NULL,
  `Posicaox1` int(10) NOT NULL,
  `Posicaoy1` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `mesa`
--

INSERT INTO `mesa` (`ID`, `SalaID`, `Numero`, `MaximoPessoas`, `Limpeza`, `Ocupada`, `Reservada`, `Posicaox`, `Posicaoy`, `Posicaox1`, `Posicaoy1`) VALUES
(1, 1, 1, 4, 0, 1, 0, 1, 1, 1, 1),
(2, 1, 2, 8, 1, 1, 0, 2, 2, 2, 2),
(3, 3, 1, 4, 1, 0, 1, 1, 1, 1, 1),
(4, 3, 2, 4, 1, 0, 0, 2, 2, 2, 2),
(5, 2, 1, 4, 1, 0, 0, 1, 1, 1, 1),
(6, 2, 2, 4, 1, 0, 0, 4, 4, 4, 4),
(8, 1, 3, 5, 1, 0, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacao`
--

CREATE TABLE `notificacao` (
  `ID` int(10) NOT NULL,
  `Template` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `notificacao`
--

INSERT INTO `notificacao` (`ID`, `Template`) VALUES
(1, 'Novo restaurante criado'),
(2, 'Restaurante atualizado'),
(3, 'Restaurante eliminado'),
(4, 'TakeAway pronto'),
(5, 'Nova reserva efetuada'),
(6, 'Novo TakeAway criado'),
(7, 'Reserva Cancelada'),
(8, 'Reserva alterada'),
(9, 'TakeAway cancelado'),
(10, 'TakeAway alterado'),
(11, 'Novo pedido'),
(12, 'Pedido alterado'),
(13, 'Pedido cancelado'),
(14, 'Prato pronto'),
(15, 'Prato devolvido'),
(16, 'TakeAway pronto'),
(17, 'Novo menu'),
(18, 'Menu alterado'),
(19, 'Menu eliminado'),
(20, 'Pedido pronto'),
(21, 'Produto acabado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacao_restaurante`
--

CREATE TABLE `notificacao_restaurante` (
  `NotificacaoID` int(10) NOT NULL,
  `RestauranteID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `ID` int(10) NOT NULL,
  `FuncionarioID` int(10) NOT NULL,
  `FaturaID` int(10) DEFAULT NULL,
  `ReservaID` int(10) DEFAULT NULL,
  `CadeiraID` int(10) DEFAULT NULL,
  `PrecoTotal` double NOT NULL,
  `DataAbertura` datetime DEFAULT NULL,
  `DataEncerramento` datetime DEFAULT NULL,
  `TakeAway` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`ID`, `FuncionarioID`, `FaturaID`, `ReservaID`, `CadeiraID`, `PrecoTotal`, `DataAbertura`, `DataEncerramento`, `TakeAway`) VALUES
(1, 8, NULL, 13, 1, 10, '2022-05-08 13:58:27', '2022-05-08 15:58:27', 0),
(2, 8, NULL, 13, 2, 8, '2022-05-09 13:59:12', '2022-05-09 14:30:12', 0),
(3, 8, NULL, 13, 3, 6, '2022-05-10 16:59:12', '2022-05-10 18:29:12', 0),
(4, 8, NULL, 13, 4, 25, '2022-05-12 14:59:12', '2022-05-12 15:20:12', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `ID` int(10) NOT NULL,
  `TipoProdutoID` int(10) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Preco` float NOT NULL,
  `Quantidade` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`ID`, `TipoProdutoID`, `Nome`, `Preco`, `Quantidade`) VALUES
(1, 1, 'Pão de alho ', 2, 20),
(2, 1, 'Azeitonas', 2, 20),
(3, 2, 'Lasanha', 5, 20),
(4, 2, 'Bacalhau com natas', 5, 20),
(5, 3, 'Mouse de Chocolate', 2, 20),
(6, 3, 'Tarte de limão', 2, 20),
(7, 4, 'Cerveja', 1, 20),
(8, 4, 'Agua', 1, 20);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_ingredientes`
--

CREATE TABLE `produto_ingredientes` (
  `ProdutoID` int(10) NOT NULL,
  `IngredientesID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_menurestaurante`
--

CREATE TABLE `produto_menurestaurante` (
  `ProdutoID` int(10) NOT NULL,
  `MenuRestauranteID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_pedido`
--

CREATE TABLE `produto_pedido` (
  `ProdutoID` int(10) NOT NULL,
  `PedidoID` int(10) NOT NULL,
  `ID` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `ID` int(10) NOT NULL,
  `FuncionarioID` int(10) DEFAULT NULL,
  `RestauranteID` int(10) NOT NULL,
  `NomeCliente` varchar(30) DEFAULT NULL,
  `TelefoneCliente` bigint(20) DEFAULT NULL,
  `NumeroPessoas` int(11) DEFAULT NULL,
  `Nota` varchar(255) DEFAULT NULL,
  `Dia` date DEFAULT NULL,
  `HoraInicio` time DEFAULT NULL,
  `MesaID` int(10) NOT NULL,
  `ClienteID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`ID`, `FuncionarioID`, `RestauranteID`, `NomeCliente`, `TelefoneCliente`, `NumeroPessoas`, `Nota`, `Dia`, `HoraInicio`, `MesaID`, `ClienteID`) VALUES
(3, NULL, 2, 'jaime', 123456789, 4, '', '2022-05-08', '15:03:00', 2, NULL),
(4, NULL, 2, 'jaime', 123456789, 4, '', '2022-05-08', '16:13:00', 1, NULL),
(5, NULL, 2, 'jaime', 123456789, 4, '', '2022-05-09', '16:14:00', 1, NULL),
(7, NULL, 2, 'jaime', 123456789, 6, '', '2022-05-09', '16:14:00', 2, NULL),
(12, NULL, 2, 'jaime', 123456789, 8, '', '2022-05-13', '12:57:00', 2, 2),
(13, NULL, 2, 'guilherme', 123456789, 2, '', '2022-05-28', '13:55:00', 1, 2),
(14, NULL, 2, 'jaime', 123456789, 4, '', '2022-05-14', '17:55:00', 1, 2),
(15, NULL, 2, 'Guilherme Ramos', 911773189, 5, '', '2022-06-29', '10:00:00', 8, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva_mesa`
--

CREATE TABLE `reserva_mesa` (
  `ReservaID` int(10) NOT NULL,
  `MesaID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `restaurante`
--

CREATE TABLE `restaurante` (
  `ID` int(10) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `NumeroTelefone` bigint(20) NOT NULL,
  `Rua` varchar(100) DEFAULT NULL,
  `Numero_andar` varchar(30) DEFAULT NULL,
  `Codigo` varchar(10) DEFAULT NULL,
  `Cidade` varchar(30) DEFAULT NULL,
  `Abertura` time DEFAULT NULL,
  `Fecho` time DEFAULT NULL,
  `Distrito` varchar(30) DEFAULT NULL,
  `Imagem` varchar(150) DEFAULT NULL,
  `Abertura_Tarde` time DEFAULT NULL,
  `Fecho_Tarde` time DEFAULT NULL,
  `Dia_Fecho` varchar(30) DEFAULT NULL,
  `estado` varchar(15) NOT NULL,
  `FuncionarioID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `restaurante`
--

INSERT INTO `restaurante` (`ID`, `Nome`, `NumeroTelefone`, `Rua`, `Numero_andar`, `Codigo`, `Cidade`, `Abertura`, `Fecho`, `Distrito`, `Imagem`, `Abertura_Tarde`, `Fecho_Tarde`, `Dia_Fecho`, `estado`, `FuncionarioID`) VALUES
(1, 'Koko', 911773189, 'Rua Fernando Corrêa de Oliveir', 'Nrº3 1ºDt', '8700-488', 'Quelfes', '09:00:00', '22:00:00', 'Faro', 'images/koko.jpg', NULL, NULL, 'terça-feira', 'ativo', 11),
(2, 'Sabores do Churrasco', 911773187, 'Rua Fernando Corrêa de Oliveira2232', 'Bl2oco A nrº3 1ºDt', '8700-000', 'Olhão', '11:00:00', '14:00:00', 'Faro', 'images/churrasco.jpg', '16:00:00', '23:00:00', 'segunda-feira', 'ativo', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE `sala` (
  `ID` int(10) NOT NULL,
  `RestauranteID` int(10) DEFAULT NULL,
  `Capacidade` int(10) NOT NULL,
  `NomeSala` varchar(30) DEFAULT NULL,
  `Fumador` tinyint(1) NOT NULL,
  `TipoSala` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sala`
--

INSERT INTO `sala` (`ID`, `RestauranteID`, `Capacidade`, `NomeSala`, `Fumador`, `TipoSala`) VALUES
(1, 2, 120, 'Esplanada', 1, 'Exterior'),
(2, 2, 120, 'Sala interior', 0, 'Interior'),
(3, 2, 120, 'Esplanada2', 0, 'Exterior');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipofuncionario`
--

CREATE TABLE `tipofuncionario` (
  `ID` int(10) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipofuncionario`
--

INSERT INTO `tipofuncionario` (`ID`, `Nome`) VALUES
(1, 'Administrador'),
(2, 'Anfitreao'),
(3, 'Cozinha'),
(4, 'Garcon'),
(5, 'Limpeza'),
(6, 'Cliente'),
(7, 'Administrador Sistema');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoproduto`
--

CREATE TABLE `tipoproduto` (
  `ID` int(10) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipoproduto`
--

INSERT INTO `tipoproduto` (`ID`, `Nome`) VALUES
(1, 'Entradas'),
(2, 'Pratos'),
(3, 'Sobremesas'),
(4, 'Bebidas');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  ADD KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`) USING BTREE;

--
-- Índices para tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Índices para tabela `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices para tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Índices para tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `cadeira`
--
ALTER TABLE `cadeira`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKCadeira369297` (`MesaID`);

--
-- Índices para tabela `codigos_postais_parcial`
--
ALTER TABLE `codigos_postais_parcial`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `concelhos`
--
ALTER TABLE `concelhos`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Índices para tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Índices para tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Índices para tabela `estadosmenu`
--
ALTER TABLE `estadosmenu`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `fatura`
--
ALTER TABLE `fatura`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKFuncionari71675` (`RestauranteID`),
  ADD KEY `FKFuncionari996140` (`TipoFuncionarioID`);

--
-- Índices para tabela `funcionario_notificacao`
--
ALTER TABLE `funcionario_notificacao`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKFuncionari866677` (`FuncionarioID_Recetor`),
  ADD KEY `FKFuncionari9616` (`MenuRestauranteID`),
  ADD KEY `FKFuncionari870513` (`PedidoID`),
  ADD KEY `FKFuncionari496360` (`FuncionarioID`),
  ADD KEY `FKFuncionari327814` (`NotificacaoID`);

--
-- Índices para tabela `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `menurestaurante`
--
ALTER TABLE `menurestaurante`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKMenuRestau553562` (`RestauranteID`),
  ADD KEY `FKMenuRestau774524` (`EstadosMenuID`),
  ADD KEY `FKMenuRestau710302` (`FuncionarioID`);

--
-- Índices para tabela `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKMesa888794` (`SalaID`);

--
-- Índices para tabela `notificacao`
--
ALTER TABLE `notificacao`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `notificacao_restaurante`
--
ALTER TABLE `notificacao_restaurante`
  ADD PRIMARY KEY (`NotificacaoID`,`RestauranteID`),
  ADD KEY `FKNotificaca305036` (`RestauranteID`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKPedido971647` (`CadeiraID`),
  ADD KEY `FKPedido407252` (`ReservaID`),
  ADD KEY `FKPedido629333` (`FaturaID`),
  ADD KEY `FKPedido749767` (`FuncionarioID`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKProduto359168` (`TipoProdutoID`);

--
-- Índices para tabela `produto_ingredientes`
--
ALTER TABLE `produto_ingredientes`
  ADD PRIMARY KEY (`ProdutoID`,`IngredientesID`),
  ADD KEY `FKProduto_In527824` (`IngredientesID`);

--
-- Índices para tabela `produto_menurestaurante`
--
ALTER TABLE `produto_menurestaurante`
  ADD KEY `FKProduto_Me76740` (`MenuRestauranteID`);

--
-- Índices para tabela `produto_pedido`
--
ALTER TABLE `produto_pedido`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKProduto_Pe205411` (`PedidoID`);

--
-- Índices para tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKReserva552731` (`RestauranteID`),
  ADD KEY `FKReserva711133` (`FuncionarioID`),
  ADD KEY `FKReserva401372` (`MesaID`),
  ADD KEY `FKReserva896783` (`ClienteID`);

--
-- Índices para tabela `reserva_mesa`
--
ALTER TABLE `reserva_mesa`
  ADD PRIMARY KEY (`ReservaID`,`MesaID`),
  ADD KEY `FKReserva_Me827875` (`MesaID`);

--
-- Índices para tabela `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKSala361702` (`RestauranteID`);

--
-- Índices para tabela `tipofuncionario`
--
ALTER TABLE `tipofuncionario`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `tipoproduto`
--
ALTER TABLE `tipoproduto`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=561;

--
-- AUTO_INCREMENT de tabela `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cadeira`
--
ALTER TABLE `cadeira`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `codigos_postais_parcial`
--
ALTER TABLE `codigos_postais_parcial`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1125;

--
-- AUTO_INCREMENT de tabela `concelhos`
--
ALTER TABLE `concelhos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT de tabela `distritos`
--
ALTER TABLE `distritos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT de tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `estadosmenu`
--
ALTER TABLE `estadosmenu`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fatura`
--
ALTER TABLE `fatura`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `funcionario_notificacao`
--
ALTER TABLE `funcionario_notificacao`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `menurestaurante`
--
ALTER TABLE `menurestaurante`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mesa`
--
ALTER TABLE `mesa`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `notificacao`
--
ALTER TABLE `notificacao`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `produto_pedido`
--
ALTER TABLE `produto_pedido`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `restaurante`
--
ALTER TABLE `restaurante`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `sala`
--
ALTER TABLE `sala`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipofuncionario`
--
ALTER TABLE `tipofuncionario`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tipoproduto`
--
ALTER TABLE `tipoproduto`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limitadores para a tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limitadores para a tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `cadeira`
--
ALTER TABLE `cadeira`
  ADD CONSTRAINT `FKCadeira369297` FOREIGN KEY (`MesaID`) REFERENCES `mesa` (`ID`);

--
-- Limitadores para a tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `FKFuncionari71675` FOREIGN KEY (`RestauranteID`) REFERENCES `restaurante` (`ID`),
  ADD CONSTRAINT `FKFuncionari996140` FOREIGN KEY (`TipoFuncionarioID`) REFERENCES `tipofuncionario` (`ID`);

--
-- Limitadores para a tabela `funcionario_notificacao`
--
ALTER TABLE `funcionario_notificacao`
  ADD CONSTRAINT `FKFuncionari327814` FOREIGN KEY (`NotificacaoID`) REFERENCES `notificacao` (`ID`),
  ADD CONSTRAINT `FKFuncionari496360` FOREIGN KEY (`FuncionarioID`) REFERENCES `funcionario` (`ID`),
  ADD CONSTRAINT `FKFuncionari866677` FOREIGN KEY (`FuncionarioID_Recetor`) REFERENCES `funcionario` (`ID`),
  ADD CONSTRAINT `FKFuncionari870513` FOREIGN KEY (`PedidoID`) REFERENCES `pedido` (`ID`),
  ADD CONSTRAINT `FKFuncionari9616` FOREIGN KEY (`MenuRestauranteID`) REFERENCES `menurestaurante` (`ID`);

--
-- Limitadores para a tabela `menurestaurante`
--
ALTER TABLE `menurestaurante`
  ADD CONSTRAINT `FKMenuRestau553562` FOREIGN KEY (`RestauranteID`) REFERENCES `restaurante` (`ID`),
  ADD CONSTRAINT `FKMenuRestau710302` FOREIGN KEY (`FuncionarioID`) REFERENCES `funcionario` (`ID`),
  ADD CONSTRAINT `FKMenuRestau774524` FOREIGN KEY (`EstadosMenuID`) REFERENCES `estadosmenu` (`ID`);

--
-- Limitadores para a tabela `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `FKMesa888794` FOREIGN KEY (`SalaID`) REFERENCES `sala` (`ID`);

--
-- Limitadores para a tabela `notificacao_restaurante`
--
ALTER TABLE `notificacao_restaurante`
  ADD CONSTRAINT `FKNotificaca305036` FOREIGN KEY (`RestauranteID`) REFERENCES `restaurante` (`ID`),
  ADD CONSTRAINT `FKNotificaca550105` FOREIGN KEY (`NotificacaoID`) REFERENCES `notificacao` (`ID`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FKPedido407252` FOREIGN KEY (`ReservaID`) REFERENCES `reserva` (`ID`),
  ADD CONSTRAINT `FKPedido629333` FOREIGN KEY (`FaturaID`) REFERENCES `fatura` (`ID`),
  ADD CONSTRAINT `FKPedido749767` FOREIGN KEY (`FuncionarioID`) REFERENCES `funcionario` (`ID`),
  ADD CONSTRAINT `FKPedido971647` FOREIGN KEY (`CadeiraID`) REFERENCES `cadeira` (`ID`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `FKProduto359168` FOREIGN KEY (`TipoProdutoID`) REFERENCES `tipoproduto` (`ID`);

--
-- Limitadores para a tabela `produto_ingredientes`
--
ALTER TABLE `produto_ingredientes`
  ADD CONSTRAINT `FKProduto_In209254` FOREIGN KEY (`ProdutoID`) REFERENCES `produto` (`ID`),
  ADD CONSTRAINT `FKProduto_In527824` FOREIGN KEY (`IngredientesID`) REFERENCES `ingredientes` (`ID`);

--
-- Limitadores para a tabela `produto_menurestaurante`
--
ALTER TABLE `produto_menurestaurante`
  ADD CONSTRAINT `FKProduto_Me76740` FOREIGN KEY (`MenuRestauranteID`) REFERENCES `menurestaurante` (`ID`);

--
-- Limitadores para a tabela `produto_pedido`
--
ALTER TABLE `produto_pedido`
  ADD CONSTRAINT `FKProduto_Pe205411` FOREIGN KEY (`PedidoID`) REFERENCES `pedido` (`ID`);

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `FKReserva401372` FOREIGN KEY (`MesaID`) REFERENCES `mesa` (`ID`),
  ADD CONSTRAINT `FKReserva552731` FOREIGN KEY (`RestauranteID`) REFERENCES `restaurante` (`ID`),
  ADD CONSTRAINT `FKReserva711133` FOREIGN KEY (`FuncionarioID`) REFERENCES `funcionario` (`ID`),
  ADD CONSTRAINT `FKReserva896783` FOREIGN KEY (`ClienteID`) REFERENCES `funcionario` (`ID`);

--
-- Limitadores para a tabela `reserva_mesa`
--
ALTER TABLE `reserva_mesa`
  ADD CONSTRAINT `FKReserva_Me827875` FOREIGN KEY (`MesaID`) REFERENCES `mesa` (`ID`),
  ADD CONSTRAINT `FKReserva_Me872389` FOREIGN KEY (`ReservaID`) REFERENCES `reserva` (`ID`);

--
-- Limitadores para a tabela `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `FKSala361702` FOREIGN KEY (`RestauranteID`) REFERENCES `restaurante` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
