-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Maio-2023 às 22:45
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
  `foto` varchar(500) NOT NULL,
  `idade` int(11) NOT NULL,
  `sexo` varchar(200) NOT NULL,
  `vacinado` varchar(200) NOT NULL,
  `castrado` varchar(200) NOT NULL,
  `raca` varchar(200) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `tipo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perdido`
--

CREATE TABLE `perdido` (
  `id` int(11) NOT NULL,
  `tipo` varchar(200) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `idade` int(11) NOT NULL,
  `raca` varchar(200) NOT NULL,
  `sexo` varchar(200) NOT NULL,
  `porte` varchar(200) NOT NULL,
  `foto` varchar(500) NOT NULL,
  `bairro` varchar(500) NOT NULL,
  `descricao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perdido`
--

INSERT INTO `perdido` (`id`, `tipo`, `nome`, `idade`, `raca`, `sexo`, `porte`, `foto`, `bairro`, `descricao`) VALUES
(2, 'ee777e', 'ee7772e', 772, 'e77ee', 'ee77e', '77eee', 'ee77e', 'ee77e', '');

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
(1, 5, 'efaebab2-dcc1-447e-85e3-e1adf4eb3403'),
(2, 5, '6a13d57f-d95f-47da-b677-c9b304ce9ff9'),
(3, 6, '4cde0229-f410-4b78-b957-e1cb8931e776');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `fotoperfil` varchar(500) NOT NULL,
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
(6, '', '', 'Maria Eduarda', '@mariafabrys', 'maria@gmail', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0, 'user');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `perdido`
--
ALTER TABLE `perdido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `sessoes`
--
ALTER TABLE `sessoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
