-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 22 2017 г., 16:24
-- Версия сервера: 10.1.26-MariaDB
-- Версия PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `djerelo_base`
--

-- --------------------------------------------------------

--
-- Структура таблицы `appointment_`
--

CREATE TABLE `appointment_` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `arrival_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `departure_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `appointmant_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `feetback`
--

CREATE TABLE `feetback` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `feetback` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `category_ru` varchar(255) DEFAULT NULL,
  `category_ua` varchar(255) DEFAULT NULL,
  `category_en` varchar(255) DEFAULT NULL,
  `type_ru` varchar(255) DEFAULT NULL,
  `type_ua` varchar(255) DEFAULT NULL,
  `type_en` varchar(255) DEFAULT NULL,
  `short_description_ru` varchar(1000) DEFAULT NULL,
  `short_description_ua` varchar(255) DEFAULT NULL,
  `short_description_en` varchar(255) DEFAULT NULL,
  `full_description_ru` text,
  `full_description_ua` text,
  `full_description_en` text,
  `people_quontaty` int(2) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `category_ru`, `category_ua`, `category_en`, `type_ru`, `type_ua`, `type_en`, `short_description_ru`, `short_description_ua`, `short_description_en`, `full_description_ru`, `full_description_ua`, `full_description_en`, `people_quontaty`, `img`) VALUES
(167, 'test', 'Люкс', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, '10', 'test342', 'test2', 'test', 'test', 'test', 'test', 'test', 'testte', 'test', 'test', 'test', 'test', 1, 'Lighthouse.jpg'),
(172, '10', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'testte', 'test', 'test', 'test', 'test', 1, 'Lighthouse.jpg'),
(173, '123', 'gggdsdggdsgdsa', 'gsdgdssdgdsgdgsdgs', 'sdggsdgdsdsgdsg', 'sadfsggsdsdg', 'sgsdgdsfdsdsfdsf', 'gsdgdsdsgdsfgsdfdsf', 'asdfgggg', 'asdfghgh', 'asdfghhh', 'asdfgggg', 'asdfsdfsdffgfgfd', 'safdsdfasfddsfds', 2, NULL),
(174, '1', 'test', 'test', '10', 'test', 'sgsdgdsfdsdsfdsf', 'test', 'test', 'test', 'ttt', 'tttsdf', 'ffdd', 'sdff', 3, '1506071520Penguins.jpg'),
(175, '2', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 1, '1506072444Jellyfish.jpg'),
(176, '23', 'test', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `room_images`
--

CREATE TABLE `room_images` (
  `id` int(11) NOT NULL,
  `primary_image` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', '$2y$10$IPnWOTDLZybLDF85tTUlJugPvHw30fQFi3Z6YhR.FNvfN2bAAOLgC', NULL, '2017-09-19 04:59:16', '2017-09-19 04:59:16');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `appointment_`
--
ALTER TABLE `appointment_`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Индексы таблицы `feetback`
--
ALTER TABLE `feetback`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `appointment_`
--
ALTER TABLE `appointment_`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `feetback`
--
ALTER TABLE `feetback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;
--
-- AUTO_INCREMENT для таблицы `room_images`
--
ALTER TABLE `room_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `appointment_`
--
ALTER TABLE `appointment_`
  ADD CONSTRAINT `appointment__ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Ограничения внешнего ключа таблицы `room_images`
--
ALTER TABLE `room_images`
  ADD CONSTRAINT `room_images_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
