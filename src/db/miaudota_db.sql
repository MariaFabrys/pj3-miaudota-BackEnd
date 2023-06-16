-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Jun-2023 às 22:31
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

--
-- Extraindo dados da tabela `adocao`
--

INSERT INTO `adocao` (`id`, `nome`, `foto`, `idade`, `sexo`, `vacinado`, `castrado`, `raca`, `descricao`, `tipo`) VALUES
(2, 'Fernanda', 'https://www.florence.edu.br/wp-content/uploads/2022/08/Imagem-Materia_Dia-do-Cachorro.png', 2, 'femea', '', '', 's', '', 'cachorro');

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
(2, 'ee777e', 'ee7772e', 772, 'e77ee', 'ee77e', '77eee', 'ee77e', 'ee77e', ''),
(3, 'cachorro', 'Maria', 23, 'gggg', 'femea', 'pequeno', 'https://www.florence.edu.br/wp-content/uploads/2022/08/Imagem-Materia_Dia-do-Cachorro.png', '', ''),
(4, 'cachorro', 'Maria', 23, 's', 'femea', 'pequeno', 'https://www.florence.edu.br/wp-content/uploads/2022/08/Imagem-Materia_Dia-do-Cachorro.png', '', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
(5, 'cachorro', 'Maria', 23, 'gggg', 'femea', 'pequeno', 'https://www.florence.edu.br/wp-content/uploads/2022/08/Imagem-Materia_Dia-do-Cachorro.png', '', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
(6, 'cachorro', 'Mariao', 2, 'cão', 'femea', 'pequeno', 'https://www.florence.edu.br/wp-content/uploads/2022/08/Imagem-Materia_Dia-do-Cachorro.png', '18', 'sadsdsasd');

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
(8, 8, 'd0f454e9-191f-4e86-91d8-920ae463ea09'),
(9, 8, '81d585b6-278b-4a5e-97a9-84b7aa2187ff'),
(10, 8, '695da8e7-6848-4965-aae4-fe298073ac3f'),
(11, 8, '1d5e8ef2-58a6-487e-8791-713eeae5562a'),
(12, 8, '26f3de43-46c7-4361-b85d-abeb24bd389c'),
(13, 8, 'fde94a86-14eb-4fa4-af08-d650b08c6880'),
(14, 8, 'f5519fcb-4fe0-48db-9734-8258d6538909'),
(15, 8, '64561c10-763d-4a18-9718-3f56042ac1db'),
(16, 8, '784de075-6ce6-4c4b-82d1-b08c54796727'),
(17, 8, '9e23b01c-2ad7-41c7-9e95-d08096dad70e'),
(18, 8, '15d523da-8b09-4037-bff4-b6000782d276'),
(19, 8, 'b4e60570-4e09-47dd-a971-c2b64d6682ce'),
(20, 8, '9c3c9026-ad11-4ed7-8283-9b8fe88d5614'),
(21, 8, '1109189b-32c7-4c2a-97de-839a9484c093'),
(22, 8, 'bb0884f4-0359-44d5-934c-1fccd6debd2a'),
(23, 8, '81892845-ef1c-4b08-a00d-5ecb306252ce'),
(24, 8, 'a5941357-906b-4690-be95-86927db16eaf'),
(25, 8, 'd2a90d18-f090-4069-a659-8c9c125db075'),
(26, 8, 'f788a68d-0294-4478-ac9b-0cd9ba613953'),
(27, 8, '5298aaf8-b396-47e5-9913-e18aa3db6735'),
(28, 8, '71275dbd-e68a-4e07-90b2-2218adf793b0'),
(29, 8, 'f7c94b5b-1c62-4bd3-a1e8-c6819481e85c'),
(30, 8, 'a48f8f63-e2c3-4180-8b70-819897ab5fae'),
(31, 8, 'a50c9f11-6571-405b-be9a-05537fae3ec6'),
(32, 8, '222287a1-e1a9-4cf5-b74c-608ce0f276ed'),
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
(45, 8, '907abb09-4e50-4dda-8e8c-36abf26e819e');

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
(6, '', '', 'Maria Eduarda', '@mariafabrys', 'maria@gmail', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0, 'user'),
(7, '', '', 'asdasdas', 'asdasdasd', 'sadasd@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0, 'user'),
(8, 'https://www.fatosdesconhecidos.com.br/wp-content/uploads/2016/11/1-47-1280x720.jpg', '', 'Fernandão', 'Fendanda1', 'fernanda@gmail.com123', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 0, 'user');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `perdido`
--
ALTER TABLE `perdido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `sessoes`
--
ALTER TABLE `sessoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
