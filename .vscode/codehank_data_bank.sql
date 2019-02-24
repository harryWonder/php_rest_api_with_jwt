-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2019 at 11:34 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codehank_data_bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `textStatus` text NOT NULL,
  `created_by` text NOT NULL,
  `created_on` date NOT NULL,
  `updated_by` text NOT NULL,
  `updated_on` date NOT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  `tempToken` varchar(255) NOT NULL,
  `profile_picture` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `username`, `password`, `textStatus`, `created_by`, `created_on`, `updated_by`, `updated_on`, `verified`, `tempToken`, `profile_picture`, `active`) VALUES
(1, 'stephenilori458@gmail.com', 'harrywonder', '$2y$10$dyanrDNVi3roZFP/a.CaE.iWhAf93UXWmLI1gbpRR9ZqlIU1mgn1q', '', 'web_service', '2019-01-17', '', '0000-00-00', 0, 'H6#j.22&3yD.F$NJsO8A.GD1(COdDoK2a@t^_$Bg6!^DQ$6D2sHT2(PLDsUDg$g8.uv*LsI)%AEPhhsG3?P_v8gMs)', '', 1),
(2, 'johndoe45@gmail.com', 'johndoe', '$2y$10$ZXEGqeC1SkapX0zF8DRMf.29u1kwFCmgWyGc/wbj4RvI0EE87aYJe', '', 'web_service', '2019-01-17', '', '0000-00-00', 0, '_@6usMg.1v3NDhP2!*CKDdGOA2DIF6$LJ^.E%P6j.s)8^tTOa8?8H(GDUQ3)vhDDLsg$B2sy.&sAg_#oDsPH2g($2$', '', 1),
(3, 'steve45@gmail.com', 'stevewonder', '$2y$10$6n3F0v4fKhZX8mEih3WE8eIt3j.YXVpOXLV0gnFVFpQoX6J1pbm86', 'just got here. Hiya Devs', 'web_service', '2019-01-17', '', '0000-00-00', 0, 'HEsPL8*#^us%662I6gPAsy3a)C8K.Q_ohM.vTBGNg_2$?UtO$h3!O1LjHP(F$D$G^DDv2gD2(gssd..8D2JD@&)DsA', '', 1),
(4, 'becca45@gmail.com', 'becky', '$2y$10$sFAxc5rC4wzaxz2AAA/oSufppPXU9pW1ZFWl3vJuqqE.vcmTZ3g.q', '', 'web_service', '2019-01-17', '', '0000-00-00', 0, '%EgIN!sCD(8J6y6L_8Ogug)12K*D2&G(32.doBUAPTv$.t.H@PsDjPF)6?MhDsv$La$ADHs.D^G3s^8_2h#gDs2QO$', '', 1),
(5, 'bukunmi21@gmail.com', 'bukky', '$2y$10$dqq9AgDdtErDrK6tta0Ap.w0//Ot57jDLob2SsIBn9MkhFWXkidY6', 'anananamammamaakaaaaaaa', 'web_service', '2019-01-17', '', '0000-00-00', 0, 'uvvgHQO8$_dC.2sF.$s1A)G_%KPL!.s8)?@O2DA(^U6.&DN*hG(2$MHyJss2s$gjP8D3DTDg6t2#^LD6DBhEoP3agI', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `subject` text NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `picture` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `subject`, `content`, `date`, `time`, `picture`, `video`) VALUES
(1, 'aaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaa', '2019-01-17', '05:17:23', '', ''),
(2, 'aaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaa', '2019-01-17', '05:17:23', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `community`
--

CREATE TABLE `community` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `language` text NOT NULL,
  `level` text NOT NULL,
  `points` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `sender` text NOT NULL,
  `receiver` text NOT NULL,
  `content_type` text NOT NULL,
  `sender_type` text NOT NULL,
  `receiver_type` text NOT NULL,
  `date_time` datetime NOT NULL,
  `read_status` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `sender`, `receiver`, `content_type`, `sender_type`, `receiver_type`, `date_time`, `read_status`, `message`) VALUES
(1, 'CodeHank', 'harrywonder', 'BasicNotification', 'AllService', 'AllService', '2019-01-17 01:35:29', 0, 'Congratulations harrywonder on becoming our most recent codehank member, we hope you get the best out of our services while visiting various community depending on your stack. However, it\'s important you verify your email address as unverified email address will not receive full priviledges. &amp;lt;a href=\'https://localhost/codehank/verify_mail?Email = stephenilori458@gmail.com\''),
(2, 'CodeHank', 'harrywonder', 'BasicNotification', 'AllService', 'AllService', '2019-01-17 01:41:36', 0, 'Congratulations harrywonder on becoming our most recent codehank member, we hope you get the best out of our services while visiting various community depending on your stack. However, it\'s important you verify your email address as unverified email address will not receive full priviledges. &amp;lt;a href=\'https://localhost/codehank/verify_mail?Email = stephenilori458@gmail.com\''),
(3, 'CodeHank', 'francis24', 'BasicNotification', 'AllService', 'AllService', '2019-01-17 01:43:20', 0, 'Congratulations francis24 on becoming our most recent codehank member, we hope you get the best out of our services while visiting various community depending on your stack. However, it\'s important you verify your email address as unverified email address will not receive full priviledges. &amp;lt;a href=\'https://localhost/codehank/verify_mail?Email = francis45@gmail.com\''),
(4, 'CodeHank', 'harrywonder', 'BasicNotification', 'AllService', 'AllService', '2019-01-17 01:44:44', 0, 'Congratulations harrywonder on becoming our most recent codehank member, we hope you get the best out of our services while visiting various community depending on your stack. However, it\'s important you verify your email address as unverified email address will not receive full priviledges. &amp;lt;a href=\'https://localhost/codehank/verify_mail?Email = stephenilori458@gmail.com\''),
(5, 'CodeHank', 'johndoe', 'BasicNotification', 'AllService', 'AllService', '2019-01-17 11:37:49', 0, 'Congratulations johndoe on becoming our most recent codehank member, we hope you get the best out of our services while visiting various community depending on your stack. However, it\'s important you verify your email address as unverified email address will not receive full priviledges. &amp;lt;a href=\'https://localhost/codehank/verify_mail?Email = johndoe45@gmail.com\''),
(6, 'CodeHank', 'stevewonder', 'BasicNotification', 'AllService', 'AllService', '2019-01-17 11:47:18', 0, 'Congratulations stevewonder on becoming our most recent codehank member, we hope you get the best out of our services while visiting various community depending on your stack. However, it\'s important you verify your email address as unverified email address will not receive full priviledges. &amp;lt;a href=\'https://localhost/codehank/verify_mail?Email = steve45@gmail.com\''),
(7, 'CodeHank', 'becky', 'BasicNotification', 'AllService', 'AllService', '2019-01-17 11:47:58', 0, 'Congratulations becky on becoming our most recent codehank member, we hope you get the best out of our services while visiting various community depending on your stack. However, it\'s important you verify your email address as unverified email address will not receive full priviledges. &amp;lt;a href=\'https://localhost/codehank/verify_mail?Email = becca45@gmail.com\''),
(8, 'CodeHank', 'bukky', 'BasicNotification', 'AllService', 'AllService', '2019-01-17 11:54:38', 0, 'Congratulations bukky on becoming our most recent codehank member, we hope you get the best out of our services while visiting various community depending on your stack. However, it\'s important you verify your email address as unverified email address will not receive full priviledges. &amp;lt;a href=\'https://localhost/codehank/verify_mail?Email = bukunmi21@gmail.com\'');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `student` text NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `community` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `videotutorials`
--

CREATE TABLE `videotutorials` (
  `id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `videoPath` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `type` text NOT NULL,
  `body` text NOT NULL,
  `community` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `webcustomers`
--

CREATE TABLE `webcustomers` (
  `id` int(11) NOT NULL,
  `application` text NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webcustomers`
--

INSERT INTO `webcustomers` (`id`, `application`, `url`) VALUES
(1, 'Codehank', 'http://localhost/codehank/home'),
(2, 'Codehank', 'http://localhost/codehank/'),
(3, 'Codehank', 'http://localhost/codehank/login'),
(4, 'Codehank', 'http://localhost/codehank/login/index'),
(5, 'Codehank', 'http://localhost/codehank/signup'),
(6, 'Codehank', 'http://localhost/codehank/signup/index'),
(7, 'Codehank', 'http://localhost/codehank/notifications');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `community`
--
ALTER TABLE `community`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videotutorials`
--
ALTER TABLE `videotutorials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webcustomers`
--
ALTER TABLE `webcustomers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `community`
--
ALTER TABLE `community`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videotutorials`
--
ALTER TABLE `videotutorials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webcustomers`
--
ALTER TABLE `webcustomers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
