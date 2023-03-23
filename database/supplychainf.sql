-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2023 年 03 月 23 日 13:15
-- 伺服器版本： 10.4.22-MariaDB
-- PHP 版本： 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `supplychainf`
--

-- --------------------------------------------------------

--
-- 資料表結構 `bank`
--

CREATE TABLE `bank` (
  `total_balance` int(11) NOT NULL,
  `total_amt_lent` int(11) NOT NULL,
  `loan_loss_reserves` int(11) NOT NULL,
  `deliquency_rate` double NOT NULL,
  `outstanding_request` int(11) NOT NULL,
  `num_loans` int(11) NOT NULL,
  `pct_appr` double NOT NULL,
  `default_rate` double NOT NULL,
  `bank_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `company`
--

CREATE TABLE `company` (
  `industry` varchar(99) NOT NULL,
  `upstream` varchar(99) NOT NULL,
  `downstream` varchar(99) NOT NULL,
  `revenue` int(11) NOT NULL,
  `orders` int(11) NOT NULL,
  `customers` int(11) NOT NULL,
  `credit_rating` varchar(99) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `loan`
--

CREATE TABLE `loan` (
  `borrower_company_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `loan_amt` int(11) NOT NULL,
  `repayment_amt` int(11) NOT NULL,
  `due_date` datetime NOT NULL,
  `term` int(11) NOT NULL,
  `interest_rate` double NOT NULL,
  `result` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `user_info`
--

CREATE TABLE `user_info` (
  `user_type` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `pswd` varchar(999) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(40) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `user_info`
--

INSERT INTO `user_info` (`user_type`, `user_name`, `pswd`, `email`, `address`, `telephone`, `user_id`) VALUES
(1, 'johndoe', '$2y$10$AXxNW.JWXSRlnq2tmDC.1uqGhDLAD7UrgEj5F3tcTHs.0T11gAaUG', 'johndoe@example.com', '123 Main St', '555-123-4567', 1);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- 資料表索引 `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- 資料表索引 `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`borrower_company_id`);

--
-- 資料表索引 `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
