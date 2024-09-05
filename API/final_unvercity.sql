-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 06:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_unvercity`
--

-- --------------------------------------------------------

--
-- Table structure for table `catgries`
--

CREATE TABLE `catgries` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `catgries`
--

INSERT INTO `catgries` (`cat_id`, `cat_name`) VALUES
(1, 'أصل ثابت'),
(2, 'أصل عقاري'),
(3, 'أصل نقدي');

-- --------------------------------------------------------

--
-- Table structure for table `death`
--

CREATE TABLE `death` (
  `death_id` int(11) NOT NULL,
  `death_Name` varchar(100) NOT NULL,
  `death_Sex` tinyint(4) NOT NULL COMMENT '1 == male 0==famale'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `death`
--

INSERT INTO `death` (`death_id`, `death_Name`, `death_Sex`) VALUES
(17, 'محمد', 0),
(18, 'حنان', 0),
(19, 'محمود', 0),
(20, 'هه', 0),
(21, 'ا', 0),
(22, 'قت', 0),
(23, 'djjfj', 0),
(24, 'ة٨اخغى', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inheritance`
--

CREATE TABLE `inheritance` (
  `Inh_id` int(11) NOT NULL,
  `Inh_name` varchar(100) NOT NULL,
  `Inh_name_death` int(11) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inheritance`
--

INSERT INTO `inheritance` (`Inh_id`, `Inh_name`, `Inh_name_death`, `type`) VALUES
(1, '', 19, '0'),
(2, 'علغب', 20, '0'),
(3, 'اهلهاهتخاهاها', 21, '0'),
(4, 'اهلهاهتخاهاها', 21, 'أبن عم شقيق'),
(5, 'اهلهاهتخاهاها', 21, 'بنت الأبن'),
(6, 'اهلهاهتخاهاها', 21, 'بنت الأبن'),
(7, 'اهلهاهتخاهاها', 21, 'بنت الأبن'),
(8, 'اهلهاهتخاهاها', 21, 'بنت الأبن'),
(9, 'اهلهاهتخاهاها', 21, 'بنت الأبن'),
(10, 'اهلهاهتخاهاهرخغعا', 21, 'أخ لأب'),
(11, 'اهلهاهتخاهاهرخغعا', 21, 'أخ لأب'),
(12, '٤هلهلهلخل', 21, 'أخ لأب'),
(13, '٧ج٧٧٧٧٧', 21, 'أخ لأب'),
(14, 'اقتقتف', 22, 'ام'),
(15, 'ة٨غة٨غى', 22, 'أخ شقيق'),
(16, 'فنمغغن', 22, 'أخ او خت لأم'),
(17, 'لنغنغنغن', 22, 'أخ لأب'),
(18, 'فتفصنغن', 22, 'أبن أخ شقيق'),
(19, '٥نصعم', 22, 'أبن أخ شقيق'),
(20, 'ظتققعمقع', 22, 'أبن أخ شقيق'),
(21, 'fatamh', 23, ''),
(22, 'ool', 23, 'ابن'),
(23, '66', 23, 'أخ او خت لأم'),
(24, 'loo', 23, 'أخ لأب'),
(25, 'hbjfjf', 23, 'زوجه'),
(26, 'ufufu', 23, 'عم شقيق'),
(27, 'محمد', 23, 'أخ لأب'),
(28, 'ختىحعى', 23, '');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_cat` int(11) NOT NULL,
  `item_death` int(11) NOT NULL,
  `item_price` float NOT NULL,
  `item_iadl` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `item_cat`, `item_death`, `item_price`, `item_iadl`) VALUES
(47, 'فاين', 1, 19, 250, 'صاحب البقاله'),
(48, 'شطه', 3, 19, 160, 'يييي'),
(49, 'كتخا', 2, 19, 686, 'عرع'),
(50, '٨فر٨', 2, 19, 6868, 'غغغغغغ'),
(51, '٨غر', 3, 19, 68, 'عععععععع'),
(52, 'اسكندر', 3, 19, 2558, 'اسكندر'),
(56, 'ل٧ ٧ا', 1, 19, 53, 'غى'),
(57, 'car', 2, 23, 500, ''),
(58, 'gg', 3, 23, 500, 'y'),
(59, 'حعىعحىتح', 3, 23, 8383870, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catgries`
--
ALTER TABLE `catgries`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `death`
--
ALTER TABLE `death`
  ADD PRIMARY KEY (`death_id`);

--
-- Indexes for table `inheritance`
--
ALTER TABLE `inheritance`
  ADD PRIMARY KEY (`Inh_id`),
  ADD KEY `Inh_name_death` (`Inh_name_death`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_cat` (`item_cat`),
  ADD KEY `item_death` (`item_death`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catgries`
--
ALTER TABLE `catgries`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `death`
--
ALTER TABLE `death`
  MODIFY `death_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `inheritance`
--
ALTER TABLE `inheritance`
  MODIFY `Inh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inheritance`
--
ALTER TABLE `inheritance`
  ADD CONSTRAINT `inheritance_ibfk_1` FOREIGN KEY (`Inh_name_death`) REFERENCES `death` (`death_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`item_cat`) REFERENCES `catgries` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`item_death`) REFERENCES `death` (`death_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
