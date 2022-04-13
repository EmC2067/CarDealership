-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 13, 2022 at 03:53 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cardealership`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `AdminID` int(6) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Password` varchar(30) NOT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Email`, `Password`) VALUES
(123, 'J_Smit@Cardealer.co.uk', 'smitthewit123'),
(2352, 'E_Ratakoski@Cardealership.co.uk', 'AdminAtDealer'),
(852305, 'A_Bowski@Cardealership.co.uk', 'Bowski56329');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `CustomerID` int(5) NOT NULL AUTO_INCREMENT,
  `Forename` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Town` varchar(30) NOT NULL,
  `Postcode` varchar(10) NOT NULL,
  `Telephone` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `Forename`, `Surname`, `Address`, `Town`, `Postcode`, `Telephone`, `Email`, `Password`) VALUES
(1, 'John', 'Watkins', '5 Avenue Road', 'Magherafelt', 'BT44 7BC', '02358473853', 'J-Watkins@gmail.co.uk', 'Jwatsindahouse'),
(2, 'Ava', 'Smith', '22 Brownhill Road', 'Cookstown', 'BT47 2NJ', '02856283741', 'Ava_Smith@gmail.com', 'AS57203'),
(3, 'Charlotte', 'Robertson', '67 Smit Avenue', 'Limavady', 'BT47 6BN', '02846583523', 'C_Rob523@gmail.com', 'RobBob5238'),
(4, 'Oliver', 'Stewart', '16 Queens Road', 'Belfast', 'BT37 8NC', '02846157831', 'O_Stewart@iCloud.co.uk', 'SO573Mail'),
(5, 'Liam', 'Sinclair', '17 Ballygowan Road', 'Draperstown', 'BT75 8HB', '02817238509', 'Sinclair_L@gmail.co.uk', 'Sin576234'),
(6, 'Sarah', 'Williams', '4 Brown Drive', 'Derry/Londonderry', 'BT57 8NS', '02857366843', 'Williams_8573@gmail.com', 'Will7412!'),
(7, 'Jack', 'Akerman', '17 Blackburn Lane', 'Maghera', 'BT57 9HN', '02864732387', 'Aker-J@gmail.com', 'jAk748!!'),
(8, 'Grace', 'Addison', '33 kings Road', 'Belfast', 'BT74 71N', '02864394710', 'Addy-Grace@iCloud.co.uk', 'gRaCe8485$');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `OrderID` int(5) NOT NULL,
  `CustomerID` int(5) NOT NULL,
  `StockID` varchar(5) NOT NULL,
  `OrderDate` date NOT NULL,
  `Quantity` int(2) NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `StockID` (`StockID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `CustomerID`, `StockID`, `OrderDate`, `Quantity`, `Total`) VALUES
(23574, 3, 'S0007', '2022-01-29', 1, '12100'),
(28135, 6, 'S0004', '2022-02-22', 1, '9500'),
(41245, 8, 'S0003', '2022-02-01', 1, '16500'),
(43234, 4, 'S0008', '2022-02-16', 1, '6500'),
(52643, 1, 'S0019', '2022-03-02', 1, '21000'),
(56463, 5, 'S0005', '2022-02-05', 1, '20500'),
(74634, 2, 'S0012', '2022-02-13', 1, '20000'),
(94556, 7, 'S0002', '2022-03-06', 1, '3500');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `PaymentID` int(5) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(5) NOT NULL,
  `CardNumber` int(20) NOT NULL,
  `Expiration` varchar(5) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=95724 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `CustomerID`, `CardNumber`, `Expiration`) VALUES
(23943, 1, 2019346273, '08-23'),
(30752, 7, 1462735235, '07-22'),
(31027, 2, 1656273472, '02-24'),
(53523, 6, 2142412424, '08-22'),
(75273, 5, 1753848637, '11-23'),
(84536, 3, 1461324654, '05-22'),
(94534, 4, 1856237583, '07-23'),
(95723, 8, 1284723055, '10-23');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `ReviewID` int(4) NOT NULL,
  `CustomerID` int(5) NOT NULL,
  `Review` text NOT NULL,
  `StockID` varchar(5) NOT NULL,
  `Rating` int(1) NOT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `StockID` (`StockID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`ReviewID`, `CustomerID`, `Review`, `StockID`, `Rating`) VALUES
(1001, 1, 'Amazingly good running car, no issues and drives like a dream', 'S0019', 9),
(1002, 8, 'Great car for the price. drives like it should and extremely comfortable', 'S0003', 7),
(1003, 7, 'Does what its needed for and for the price paid I couldn\'t ask for anything more', 'S0002', 8),
(1004, 5, 'Great customer service and the car is exactly as advertised ', 'S0005', 9),
(1005, 6, 'Great car, few minor interior issues but to be expected with price and age ', 'S0004', 7);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `StockID` varchar(5) NOT NULL,
  `Make` varchar(20) NOT NULL,
  `Model` varchar(20) NOT NULL,
  `StockCondition` varchar(5) NOT NULL,
  `Colour` varchar(15) NOT NULL,
  `Transmission` varchar(15) NOT NULL,
  `Mileage` int(200) NOT NULL,
  `FuelType` varchar(15) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`StockID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`StockID`, `Make`, `Model`, `StockCondition`, `Colour`, `Transmission`, `Mileage`, `FuelType`, `Price`) VALUES
('S0001', 'Ford', 'Fiesta', 'Used', 'White', 'Manual', 58974, 'Petrol', '9500'),
('S0002', 'Renault', 'Megane', 'Used', 'blue', 'Manual', 130344, 'diesel', '3500'),
('S0003', 'ford', 'Focus', 'New', 'red', 'Manual', 0, 'diesel', '16500'),
('S0004', 'BMW', '320D', 'Used', 'black', 'Automatic', 74032, 'diesel', '9500'),
('S0005', 'Audi', 'A3', 'new', 'grey', 'Manual', 0, 'diesel', '20500'),
('S0006', 'Audi', 'a4', 'Used', 'black', 'Manual', 60432, 'diesel', '10500'),
('S0007', 'Renault', 'Megane', 'new', 'blue', 'Manual', 0, 'diesel', '12100'),
('S0008', 'Audi', 'a3', 'Used', 'blue', 'Automatic', 90232, 'diesel', '6500'),
('S0009', 'Ford', 'Fiesta', 'Used', 'grey', 'Manual', 78974, 'Petrol', '7535'),
('S0010', 'Ford', 'Mustang', 'New', 'Blue', 'Manual', 0, 'Petrol', '32500'),
('S0011', 'Honda', 'Civiv typeR', 'Used', 'White', 'Manual', 38994, 'Petrol', '14275'),
('S0012', 'Honda', 'civic', 'new', 'Grey', 'Manual', 0, 'Petrol', '20000'),
('S0013', 'Ford', 'Transit', 'Used', 'White', 'Manual', 158974, 'Petrol', '9500'),
('S0014', 'Skoda', 'Octavia', 'Used', 'Grey', 'Manual', 28974, 'Diesel', '10500'),
('S0015', 'Skoda', 'Fabia', 'New', 'White', 'Manual', 0, 'Petrol', '12500'),
('S0016', 'Ford', 'Fiesta', 'Used', 'black', 'Manual', 12344, 'Petrol', '12000'),
('S0017', 'Ford', 'Mondeo', 'New', 'Silver', 'Manual', 0, 'Petrol', '15500'),
('S0018', 'BMW', 'M4', 'Used', 'Black', 'Automatic', 84574, 'Diesel', '9000'),
('S0019', 'BMW', 'X5', 'New', 'White', 'Manual', 0, 'Diesel', '21000'),
('S0020', 'Ford', 'Fiesta', 'Used', 'Black', 'Manual', 78974, 'Petrol', '6500');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`StockID`) REFERENCES `stock` (`StockID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`StockID`) REFERENCES `stock` (`StockID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
