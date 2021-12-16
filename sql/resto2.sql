-- phpMyAdmin SQL Dump
-- version 5.1.1-1.fc34
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 15 nov. 2021 à 16:54
-- Version du serveur : 10.5.12-MariaDB-log
-- Version de PHP : 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `resto2`
--

-- --------------------------------------------------------

--
-- Structure de la table `aimer`
--

CREATE TABLE `aimer` (
  `idR` bigint(20) NOT NULL,
  `idU` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `aimer`
--

INSERT INTO `aimer` (`idR`, `idU`) VALUES
(1, 3),
(1, 4),
(1, 7),
(2, 3),
(3, 3),
(4, 3),
(4, 6),
(5, 6),
(6, 6),
(7, 3),
(7, 6),
(8, 3),
(8, 6),
(8, 7),
(10, 1),
(11, 5);

-- --------------------------------------------------------

--
-- Structure de la table `critiquer`
--

CREATE TABLE `critiquer` (
  `idR` bigint(20) NOT NULL,
  `note` int(11) DEFAULT NULL,
  `commentaire` varchar(4096) DEFAULT NULL,
  `idU` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `critiquer`
--

INSERT INTO `critiquer` (`idR`, `note`, `commentaire`, `idU`) VALUES
(1, 3, 'moyen', 2),
(1, 3, 'Très bonne entrecote, les frites sont maisons et delicieuses.', 3),
(1, 4, 'Très bon accueil.', 5),
(1, 4, '5/5 parce que j\'aime les entrecotes', 6),
(1, 5, NULL, 7),
(2, 2, 'bof.', 2),
(2, 1, 'À éviter...', 3),
(2, 1, 'Cuisine tres moyenne.', 5),
(2, 5, NULL, 6),
(4, 5, NULL, 3),
(4, 5, 'Rapide.', 5),
(5, 3, 'Cuisine correcte.', 5),
(6, 4, 'Cuisine de qualité.', 5),
(7, 4, 'Bon accueil.', 1),
(7, NULL, NULL, 3),
(7, 5, 'Excellent.', 5),
(8, 1, NULL, 6),
(8, 4, NULL, 7),
(9, 4, 'Très bon accueil :)', 3);

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE `photo` (
  `idP` bigint(20) NOT NULL,
  `cheminP` varchar(255) DEFAULT NULL,
  `idR` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`idP`, `cheminP`, `idR`) VALUES
(0, 'entrepote.jpg', 1),
(2, 'sapporo.jpg', 3),
(3, 'restaurant_entrepotes.jpg', 1),
(4, 'barDuCharcutier.jpg', 2),
(6, 'cidrerieDuFronton.jpg', 4),
(7, 'agadir.jpg', 5),
(8, 'leBistrotSainteCluque.jpg', 6),
(9, 'auberge.jpg', 7),
(10, 'laTableDePottoka.jpg', 8),
(11, 'rotisserieDuRoyLeon.jpg', 9),
(12, 'barDuMarche.jpg', 10),
(13, 'trinquetModerne.jpg', 11),
(14, 'cidrerieDuFronton2.jpg', 4),
(15, 'cidrerieDuFronton3.jpg', 4);

-- --------------------------------------------------------

--
-- Structure de la table `preferer`
--

CREATE TABLE `preferer` (
  `idTC` bigint(20) NOT NULL,
  `idU` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `preferer`
--

INSERT INTO `preferer` (`idTC`, `idU`) VALUES
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 4),
(2, 5),
(2, 6),
(3, 4),
(3, 6),
(5, 3),
(7, 7),
(9, 3),
(9, 7),
(10, 3),
(10, 4),
(10, 6),
(10, 7),
(11, 3),
(11, 5),
(11, 6),
(11, 7);

-- --------------------------------------------------------

--
-- Structure de la table `proposer`
--

CREATE TABLE `proposer` (
  `idR` bigint(20) NOT NULL,
  `idTC` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `proposer`
--

INSERT INTO `proposer` (`idR`, `idTC`) VALUES
(1, 1),
(2, 1),
(3, 3),
(4, 1),
(4, 8),
(4, 11),
(5, 3),
(6, 10),
(7, 6),
(8, 11),
(9, 10),
(10, 1),
(11, 1),
(11, 10);

-- --------------------------------------------------------

--
-- Structure de la table `resto`
--

CREATE TABLE `resto` (
  `idR` bigint(20) NOT NULL,
  `nomR` varchar(255) DEFAULT NULL,
  `numAdrR` varchar(20) DEFAULT NULL,
  `voieAdrR` varchar(255) DEFAULT NULL,
  `cpR` char(5) DEFAULT NULL,
  `villeR` varchar(255) DEFAULT NULL,
  `latitudeDegR` float DEFAULT NULL,
  `longitudeDegR` float DEFAULT NULL,
  `descR` text DEFAULT NULL,
  `horairesR` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `resto`
--

INSERT INTO `resto` (`idR`, `nomR`, `numAdrR`, `voieAdrR`, `cpR`, `villeR`, `latitudeDegR`, `longitudeDegR`, `descR`, `horairesR`) VALUES
(1, 'l\'entrepote', '2', 'rue Maurice Ravel', '33000', 'Bordeaux', 44.7948, -0.58754, 'description', '<table>\n    <thead>\n        <tr>\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\n        </tr>\n    </thead>\n    <tbody>\n        <tr>\n            <td class=\"label\">Midi</td>\n            <td class=\"cell\">de 11h45 à 14h30</td>\n            <td class=\"cell\">de 11h45 à 15h00</td>\n        </tr>\n        <tr>\n            <td class=\"label\">Soir</td>\n            <td class=\"cell\">de 18h45 à 22h30</td>\n            <td class=\"cell\">de 18h45 à 1h</td>	\n        </tr>\n        <tr>\n            <td class=\"label\">À emporter</td>\n            <td class=\"cell\">de 11h30 à 23h</td>\n            <td class=\"cell\">de 11h30 à 2h</td>\n        </tr>\n    </tbody>\n</table>'),
(2, 'le bar du charcutier', '30', 'rue Parlement Sainte-Catherine', '33000', 'Bordeaux', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(3, 'Sapporo', '33', 'rue Saint Rémi', '33000', 'Bordeaux', NULL, NULL, 'Le Sapporo propose à ses clients de délicieux plats typiques japonais.', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(4, 'Cidrerie du fronton', NULL, 'Place du Fronton', '64210', 'Arbonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(5, 'Agadir', '3', 'Rue Sainte-Catherine', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(6, 'Le Bistrot Sainte Cluque', '9', 'Rue Hugues', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(7, 'la petite auberge', '15', 'rue des cordeliers', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(8, 'La table de POTTOKA', '21', 'Quai Amiral Dubourdieu', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(9, 'La Rotisserie du Roy Léon', '8', 'rue de coursic', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(10, 'Bar du Marché', '39', 'Rue des Basques', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(11, 'Trinquet Moderne', '60', 'Avenue Dubrocq', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>');

-- --------------------------------------------------------

--
-- Structure de la table `typeCuisine`
--

CREATE TABLE `typeCuisine` (
  `idTC` bigint(20) NOT NULL,
  `libelleTC` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `typeCuisine`
--

INSERT INTO `typeCuisine` (`idTC`, `libelleTC`) VALUES
(1, 'sud ouest'),
(2, 'japonaise'),
(3, 'orientale'),
(4, 'fastfood'),
(5, 'vegetarienne'),
(6, 'vegan'),
(7, 'crepe'),
(8, 'sandwich'),
(9, 'tartes'),
(10, 'viande'),
(11, 'grillade');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idU` bigint(20) NOT NULL,
  `mailU` varchar(150) NOT NULL,
  `mdpU` varchar(255) DEFAULT NULL,
  `pseudoU` varchar(50) DEFAULT NULL,
  `adminU` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idU`, `mailU`, `mdpU`, `pseudoU`, `adminU`) VALUES
(1, 'alex.garat@gmail.com', '$1$zvN5hYSQSQDFUIQSdufUQSDFznHF5osT.', '@lex', 0),
(2, 'jj.soueix@gmail.com', '$1$zvN5hYMI$SDFGSDFGJqJSDJF.', 'drskott', 0),
(3, 'mathieu.capliez@gmail.com', 'seSzpoUAQgIl.', 'pich', 0),
(4, 'michel.garay@gmail.com', '$1$zvN5hYMI$VSatLQ6SDFGdsfgznHF5osT.', 'Mitch', 0),
(5, 'nicolas.harispe@gmail.com', '$1$zvNDSFQSdfqsDfQsdfsT.', 'Nico40', 0),
(6, 'test@bts.sio', 'seSzpoUAQgIl.', 'testeur SIO', 1),
(7, 'yann@lechambon.fr', 'sej6dETYl/ea.', 'yann', 0),
(39, 'a', '$2y$10$hem3v21g8cKDjTyG/gg7SeJQkH3Dtn2x.BAHkLk537prMPUqdZA32', 'a', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aimer`
--
ALTER TABLE `aimer`
  ADD PRIMARY KEY (`idR`,`idU`),
  ADD KEY `aimer_ibfk_2` (`idU`);

--
-- Index pour la table `critiquer`
--
ALTER TABLE `critiquer`
  ADD PRIMARY KEY (`idR`,`idU`),
  ADD KEY `critiquer_ibfk_2` (`idU`);

--
-- Index pour la table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`idP`),
  ADD KEY `idR` (`idR`);

--
-- Index pour la table `preferer`
--
ALTER TABLE `preferer`
  ADD PRIMARY KEY (`idTC`,`idU`),
  ADD KEY `idTC` (`idTC`),
  ADD KEY `preferer_ibfk_1` (`idU`);

--
-- Index pour la table `proposer`
--
ALTER TABLE `proposer`
  ADD PRIMARY KEY (`idR`,`idTC`),
  ADD KEY `idTC` (`idTC`);

--
-- Index pour la table `resto`
--
ALTER TABLE `resto`
  ADD PRIMARY KEY (`idR`);

--
-- Index pour la table `typeCuisine`
--
ALTER TABLE `typeCuisine`
  ADD PRIMARY KEY (`idTC`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idU`),
  ADD UNIQUE KEY `mailU` (`mailU`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
    MODIFY `idU` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
ALTER TABLE `resto`
    MODIFY `idR` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
ALTER TABLE `typeCuisine`
    MODIFY `idTC` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aimer`
--
ALTER TABLE `aimer`
  ADD CONSTRAINT `aimer_ibfk_1` FOREIGN KEY (`idR`) REFERENCES `resto` (`idR`),
  ADD CONSTRAINT `aimer_ibfk_2` FOREIGN KEY (`idU`) REFERENCES `utilisateur` (`idU`);

--
-- Contraintes pour la table `critiquer`
--
ALTER TABLE `critiquer`
  ADD CONSTRAINT `critiquer_ibfk_1` FOREIGN KEY (`idR`) REFERENCES `resto` (`idR`),
  ADD CONSTRAINT `critiquer_ibfk_2` FOREIGN KEY (`idU`) REFERENCES `utilisateur` (`idU`);

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`idR`) REFERENCES `resto` (`idR`);

--
-- Contraintes pour la table `preferer`
--
ALTER TABLE `preferer`
  ADD CONSTRAINT `preferer_ibfk_1` FOREIGN KEY (`idU`) REFERENCES `utilisateur` (`idU`),
  ADD CONSTRAINT `preferer_ibfk_2` FOREIGN KEY (`idTC`) REFERENCES `typeCuisine` (`idTC`);

--
-- Contraintes pour la table `proposer`
--
ALTER TABLE `proposer`
  ADD CONSTRAINT `proposer_ibfk_1` FOREIGN KEY (`idR`) REFERENCES `resto` (`idR`),
  ADD CONSTRAINT `proposer_ibfk_2` FOREIGN KEY (`idTC`) REFERENCES `typeCuisine` (`idTC`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
