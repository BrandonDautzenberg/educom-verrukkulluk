-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 27 okt 2023 om 15:24
-- Serverversie: 10.4.28-MariaDB
-- PHP-versie: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verrukkulluk`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `naam` varchar(80) NOT NULL,
  `omschrijving` varchar(255) NOT NULL,
  `prijs` int(10) NOT NULL,
  `eenheid` varchar(80) NOT NULL,
  `verpakking` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `artikel`
--

INSERT INTO `artikel` (`id`, `naam`, `omschrijving`, `prijs`, `eenheid`, `verpakking`) VALUES
(1, 'spinazie', 'Spinazie om te (roer)bakken met een uitje, in de salade, stamppot of in een hartige taart. Met spinazie kun je echt eindeloos combineren. Extra handig! Deze spinazie is al gewassen en dus direct klaar voor gebruik.', 159, 'gram', 'afbeelding'),
(2, 'gele uien', 'Uien behoren tot de familie van de uiachtigen, evenals prei en knoflook.', 164, 'stuks', 'afbeelding'),
(3, 'knoflook', 'Knoflook is een echte smaakmaker die een gerecht extra smaak en geur geeft.', 109, 'tenen', 'afbeelding'),
(4, 'biologisch orzo', 'Orzo van 100% biologische tarwe. Kijk voor recepten en inspiratie op ah.nl/allerhande', 189, 'gram', 'afbeelding'),
(5, 'griekse feta', 'Smaak: zacht en mild.', 229, 'gram', 'afbeelding'),
(6, 'olijfolie', 'Geraffineerde olijfolie. Olie die uitsluitend bestaat uit geraffineerde olijfolie en rechtstreeks uit olijven verkregen olie.', 699, 'el', 'afbeelding'),
(7, 'fusilli', 'Pasta van durumtarwegriesmeel', 119, 'gram', 'afbeelding'),
(8, 'hamblokjes', 'Gekookte hamblokjes', 199, 'gram', 'afbeelding'),
(9, 'pastasaus tomaat en basilicum', 'Een klassieke pastasaus met tomaat en basilicum', 135, 'gram', 'afbeelding'),
(10, 'grana padano', 'Grana padano is een harde italiaanse kaas gemaakt van koemelk met een wat lager vetpercentage. Grana Padano lijkt veel op de parmigiano reggiano, maar is een stuk jonger en milder van smaak.', 379, 'gram', 'afbeelding'),
(11, 'gerookte spekreepjes', 'Gerookte en gezouten varkensspekreepjes, heerlijk door de pasta, winterse stoofpotten tot zomerse salades. Gezouten en gerookt, dat proef je terug in de karakteristieke smaak!', 319, 'gram', 'afbeelding'),
(12, 'prei', 'Prei is een kruidachtige plant met een karakteristieke geur. De enigszins lange stengels zijn wit tot lichtgroen, het blad is donkergroen. Prei behoort tot de lookfamilie waartoe ook ui, bieslook en knoflook behoren.', 62, 'stuk', 'afbeelding'),
(13, 'cheddar geraspte kaas', 'Deze geraspte cheddar is heerlijk om te gebruiken in tex-mex of ovenschotel gerechten, zoals nacho\'s.', 289, 'gram', 'afbeelding'),
(14, 'zuivelspread', 'Albert heijn zuivelspread is een zachte en milde, naturel zuivelspread.', 129, 'gram', 'afbeelding'),
(15, 'peterselie', 'Deze peterselie met frisse, groene smaak is een echte smaakmaker in allerhande gerechten zoals soepen, sauzen en pastagerechten.', 109, 'gram', 'afbeelding'),
(16, 'karwijzaad', 'Karwijzaad heeft een bittere, zoete, anijsachtige smaak met een scherpe ondertoon.', 299, 'gram', 'afbeelding'),
(17, 'witte bollen', 'Smaakvolle zachte witte bollen.', 159, 'stuks', 'afbeelding'),
(18, 'gegrilde rode paprika', 'Stevig van structuur met een heerlijk rijke, zoet-kruidige smaak.', 259, 'gram', 'afbeelding'),
(19, 'tomaten', 'Tomaten zijn sappig en vol van smaak. Een gezonde aanvulling in de salade of voor op de boterham.', 139, 'gram', 'afbeelding'),
(20, 'tomatenketchup', 'Deze ketchup is een heerlijk saus vol zongerijpte tomaten. Een echte smaakmaker bij frites, vlees, vis en pasta', 119, 'l', 'afbeelding');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerecht`
--

CREATE TABLE `gerecht` (
  `id` int(11) NOT NULL,
  `keuken_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datum_toegevoegd` date NOT NULL DEFAULT current_timestamp(),
  `titel` varchar(255) NOT NULL,
  `korte_omschrijving` varchar(255) NOT NULL,
  `lange_omschrijving` varchar(255) NOT NULL,
  `afbeelding` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gerecht`
--

INSERT INTO `gerecht` (`id`, `keuken_id`, `type_id`, `user_id`, `datum_toegevoegd`, `titel`, `korte_omschrijving`, `lange_omschrijving`, `afbeelding`) VALUES
(1, 1, 6, 1, '2023-10-23', 'Orzo met Spinazie', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'linknaarafbeelding'),
(2, 1, 4, 2, '2023-10-26', 'Fusilli met groentesaus en hamblokjes', 'Fusilli leent zich voor tal van pastagerechten, maar met name voor dunne sauzen. De saus en kruiden gaan dan in de groeven zitten, waardoor de smaak optimaal tot z’n recht komt.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'linknaarafbeelding'),
(3, 3, 4, 3, '2023-10-26', 'Preisoep met spekjes en kaas', 'Deze romige preisoep, die ook nog eens keto is, krijgt een hartige crunchy touch dankzij uitgebakken spekjes. Afgetopt met cheddar en peterselie. Lekker!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'linknaarafbeelding'),
(4, 7, 6, 4, '2023-10-26', 'Broodje vegaburger met tomaat en geroosterde paprika', 'Broodje vegaburger gemaakt? Daar moeten tomaat en geroosterde paprika bij!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'linknaarafbeelding');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerecht_info`
--

CREATE TABLE `gerecht_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gerecht_id` int(11) NOT NULL,
  `record_type` varchar(1) NOT NULL,
  `datum` date NOT NULL,
  `nummeriekveld` int(1) NOT NULL,
  `tekstveld` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gerecht_info`
--

INSERT INTO `gerecht_info` (`id`, `user_id`, `gerecht_id`, `record_type`, `datum`, `nummeriekveld`, `tekstveld`) VALUES
(1, 1, 1, 'O', '2023-10-26', 4, '\"Lekker!\"'),
(2, 2, 1, 'F', '2023-10-26', 0, ''),
(3, 3, 2, 'B', '2023-10-26', 1, 'Kook de fusilli beetgaar volgens de aanwijzingen op de verpakking. Verhit ondertussen de olijfolie in een hapjespan en bak de groenten 5 min. op middelhoog vuur.'),
(4, 4, 1, 'F', '0000-00-00', 0, ''),
(10, 3, 2, 'B', '2023-10-26', 2, 'Voeg de hamblokjes toe en bak 1 min. mee. Schenk de pastasaus bij het groente-hammengsel en warm 2 min. goed door.'),
(11, 3, 2, 'B', '2023-10-26', 3, 'Giet de pasta af en meng door de saus. Rasp er de Grana Padano over en serveer.'),
(12, 2, 1, 'B', '2023-10-26', 1, 'Snipper de ui. Verhit de olie in een hapjespan en bak de ui en het venkelzaad 1 min. op hoog vuur. Snijd ondertussen de knoflook fijn. Voeg samen met de orzo toe en bak nog 1 min. mee op middelhoog vuur. Voeg kokend water toe, schep om en laat de orzo met de deksel op de pan in 7-8 min. op middelhoog vuur gaar worden.'),
(13, 2, 1, 'B', '2023-10-26', 2, 'Verkruimel ondertussen de feta. Snijd de dille fijn en de muntblaadjes in reepjes.'),
(16, 2, 1, 'B', '2023-10-26', 3, 'Schep, als de orzo bijna gaar is, in delen de spinazie door de orzo totdat de spinazie slinkt. Schep de feta en dille erdoor. Breng de orzo op smaak met peper en eventueel zout en bestrooi met de munt.'),
(17, 5, 3, 'B', '2023-10-27', 1, 'Verhit een koekenpan zonder olie of boter op middelhoog vuur en bak de spekjes 3-5 min. tot lichtbruin en knapperig. Schep de spekjes uit de pan, laat de helft van de vrijgekomen vet in de pan. Schep de andere helft in een andere soeppan.'),
(18, 5, 3, 'B', '2023-10-27', 2, 'Snijd ondertussen de uien in halve ringen. Bak de uien in de koekenpan in het achtergebleven bakvet 10 min. op middelhoog vuur tot gekaramelliseerd en zacht. Voeg het karwijzaad toe.'),
(19, 5, 3, 'B', '2023-10-27', 3, 'Snijd ondertussen de prei in dunne ringen en spoel af onder koud stromend water. Voeg de prei toe aan de soeppan en bak 8-10 min. op middelhoog vuur tot zacht. Voeg het kokend water toe en kook 5 min.'),
(20, 5, 3, 'B', '2023-10-27', 4, 'Voeg de zuivelspread en de helft van de gebakken ui toe aan de soep en pureer alles glad met de staafmixer. Breng de soep op smaak met peper en eventueel zout.'),
(21, 5, 3, 'B', '2023-10-27', 5, 'Snijd de peterselie fijn. Verdeel de soep over kommen. Bestrooi met de rest van de gekaramelliseerde ui, geraspte kaas, de gebakken spekjes en peterselie.'),
(22, 4, 4, 'B', '2023-10-26', 1, 'Verhit de olie in een hapjespan en bak de burgers in 5 min. goudbruin. Keer halverwege.'),
(23, 4, 4, 'B', '2023-10-26', 2, 'Verhit de grillpan. Snijd de bolletjes doormidden en gril alle helften op de snijkant 1 min. Leg de broodjes open.'),
(24, 4, 4, 'B', '2023-10-26', 3, 'Laat de paprika uitlekken en vang 1 el vocht (per 4 personen) op. Snijd de paprika en de tomaten in blokjes van een ½ cm. Meng de tomaat met de paprika, het paprika-vocht, peper en eventueel zout.'),
(25, 4, 4, 'B', '2023-10-26', 4, 'Besmeer beide helften van de broodjes met de ketchup en beleg met de vegaburger en tomaten-paprikasalsa.');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `gerecht_id` int(11) NOT NULL,
  `artikel_id` int(11) NOT NULL,
  `aantal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `ingredient`
--

INSERT INTO `ingredient` (`id`, `gerecht_id`, `artikel_id`, `aantal`) VALUES
(1, 1, 4, 300),
(2, 1, 6, 2),
(3, 1, 5, 200),
(4, 2, 7, 300),
(5, 2, 9, 520),
(6, 2, 8, 250),
(7, 2, 10, 50),
(8, 2, 6, 1),
(9, 4, 17, 4),
(10, 4, 19, 4),
(11, 4, 20, 2),
(12, 4, 18, 150),
(13, 3, 12, 500),
(14, 3, 11, 75),
(15, 3, 13, 75),
(16, 3, 14, 100),
(17, 3, 15, 5),
(18, 1, 1, 600),
(19, 1, 2, 1),
(20, 1, 3, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `keuken_type`
--

CREATE TABLE `keuken_type` (
  `id` int(11) NOT NULL,
  `record_type` varchar(1) NOT NULL,
  `omschrijving` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `keuken_type`
--

INSERT INTO `keuken_type` (`id`, `record_type`, `omschrijving`) VALUES
(1, 'K', 'Italiaans'),
(2, 'K', 'Grieks'),
(3, 'K', 'Frans'),
(4, 'T', 'Vlees'),
(5, 'T', 'Vis'),
(6, 'T', 'Vegan'),
(7, 'K', 'Amerikaans'),
(8, 'K', 'Indonesisch');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `afbeelding` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `user_name`, `email`, `password`, `afbeelding`) VALUES
(1, 'John Doe', 'JohnDoe@hotmail.com', 'abc123def', 'linknaarafbeelding'),
(2, 'Jane Doe', 'JaneDoe@hotmail.com', 'efg456hij789', 'linknaarafbeelding'),
(3, 'John Smith', 'Johnsmith@mail.com', 'P4ssword!', 'linknaarafbeelding'),
(4, 'Jan Janssen', 'Janssen@mail.com', 'Janssen123', 'linknaarafbeelding'),
(5, 'Anne Claessen', 'aclaessen@mail.com', 'xxyy23#', 'linknaarafbeelding');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `gerecht`
--
ALTER TABLE `gerecht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keuken_id` (`keuken_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexen voor tabel `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `gerecht_id` (`gerecht_id`);

--
-- Indexen voor tabel `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerecht_id` (`gerecht_id`),
  ADD KEY `artikel_id` (`artikel_id`);

--
-- Indexen voor tabel `keuken_type`
--
ALTER TABLE `keuken_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_type` (`record_type`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `gerecht`
--
ALTER TABLE `gerecht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `gerecht_info`
--
ALTER TABLE `gerecht_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT voor een tabel `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `keuken_type`
--
ALTER TABLE `keuken_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `gerecht`
--
ALTER TABLE `gerecht`
  ADD CONSTRAINT `gerecht_ibfk_1` FOREIGN KEY (`keuken_id`) REFERENCES `keuken_type` (`id`),
  ADD CONSTRAINT `gerecht_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `keuken_type` (`id`),
  ADD CONSTRAINT `gerecht_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Beperkingen voor tabel `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD CONSTRAINT `gerecht_info_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`);

--
-- Beperkingen voor tabel `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`),
  ADD CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`artikel_id`) REFERENCES `artikel` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
