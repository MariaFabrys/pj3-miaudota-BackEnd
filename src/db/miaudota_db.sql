-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Jun-2023 às 19:26
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `miaudota_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adocao`
--

CREATE TABLE `adocao` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `foto` varchar(1000) NOT NULL,
  `idade` varchar(200) NOT NULL,
  `sexo` varchar(200) NOT NULL,
  `castrado` varchar(200) NOT NULL,
  `raca` varchar(200) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `tipo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `adocao`
--

INSERT INTO `adocao` (`id`, `nome`, `foto`, `idade`, `sexo`, `castrado`, `raca`, `descricao`, `tipo`) VALUES
(13, 'Maria', 'https://s3.amazonaws.com/petz-cdm-stg/7182ab81-1f6c-4068-b3bc-ba3b124b3b35.jpeg\n', 'adad', 'macho', 'sim', 'gggg', 'qweqweqwe', 'cachorro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perdido`
--

CREATE TABLE `perdido` (
  `id` int(11) NOT NULL,
  `tipo` varchar(200) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `idade` varchar(200) NOT NULL,
  `raca` varchar(200) NOT NULL,
  `sexo` varchar(200) NOT NULL,
  `porte` varchar(200) NOT NULL,
  `foto` varchar(1000) NOT NULL,
  `bairro` varchar(500) NOT NULL,
  `descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessoes`
--

CREATE TABLE `sessoes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `sessao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sessoes`
--

INSERT INTO `sessoes` (`id`, `id_usuario`, `sessao`) VALUES
(33, 8, '263b3506-e4e0-47bb-a75d-ea3fa38b29eb'),
(34, 8, 'c75e97d2-2665-42fe-a382-30f346cb0a58'),
(35, 8, '268c7b34-fbd8-4d97-b194-edaf78dcb361'),
(36, 8, 'e4388733-03e7-4215-a66f-0bb8fd3a8ba0'),
(37, 8, 'c5112df6-f2c7-4468-9edd-0009637853b5'),
(38, 8, '0b586c70-865f-4257-92d3-9275f5b5497d'),
(41, 8, '495049a2-faba-4b20-8b32-d8a04d7c688b'),
(42, 8, '306ffb1a-c71d-41f2-bb8c-892bc37aa213'),
(43, 8, 'b3b7a012-442e-45a8-9478-cf9acce6e065'),
(44, 8, 'bc13d847-a444-4be1-a38b-3d3720210d2a'),
(45, 8, '907abb09-4e50-4dda-8e8c-36abf26e819e'),
(64, 8, 'e7c3c50d-f4ee-4a1b-b6ae-4f73f606d278');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `fotoperfil` varchar(1000) NOT NULL,
  `fotocapa` varchar(500) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `usuario` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `idade` int(11) NOT NULL,
  `qtdanimais` int(11) NOT NULL,
  `roles` varchar(200) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `fotoperfil`, `fotocapa`, `nome`, `usuario`, `email`, `senha`, `idade`, `qtdanimais`, `roles`) VALUES
(5, 'https://avatars.githubusercontent.com/u/104683974?v=4', 'https://images.ecycle.com.br/wp-content/uploads/2021/05/20195924/o-que-e-paisagem.jpg', 'Maria Eduarda', '@mariafabrys', 'maria@gmail', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 18, 1, 'user'),
(6, '', '', 'Maria Eduarda', '@mariafabrys', 'maria@gmail', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0, 'user'),
(7, '', '', 'asdasdas', 'asdasdasd', 'sadasd@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0, 'user'),
(8, 'https://www.fatosdesconhecidos.com.br/wp-content/uploads/2016/11/1-47-1280x720.jpg', '', 'Fernand', 'Fendanda2', 'fernanda@gmail.com123', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 4, 'user');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `adocao`
--
ALTER TABLE `adocao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `perdido`
--
ALTER TABLE `perdido`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_usuario` (`id_usuario`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `adocao`
--
ALTER TABLE `adocao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `perdido`
--
ALTER TABLE `perdido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `sessoes`
--
ALTER TABLE `sessoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
