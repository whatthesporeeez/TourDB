-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 16 2021 г., 18:59
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mvd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `criminals`
--

CREATE TABLE `criminals` (
  `case_number` int NOT NULL,
  `fio` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` text NOT NULL,
  `adres` text NOT NULL,
  `cod_type_of_crime` int NOT NULL,
  `cod_victim` int NOT NULL,
  `condition` text NOT NULL,
  `code_employee` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `criminals`
--

INSERT INTO `criminals` (`case_number`, `fio`, `date_of_birth`, `gender`, `adres`, `cod_type_of_crime`, `cod_victim`, `condition`, `code_employee`) VALUES
(1, 'Васлиий Укралов', '1999-12-09', 'муж', 'ул Воров', 1, 1, 'yes', 9),
(2, 'Кирилл Зеленый', '1992-12-09', 'муж', 'ул Убийц', 2, 4, 'yes', 1),
(3, 'Андрей Угонов', '1991-12-24', 'муж', 'ул Антонов', 4, 2, 'yes', 6),
(4, 'Антон Мошенников', '1989-12-24', 'муж', 'Ул Мошенников', 5, 3, 'yes', 1),
(5, 'Андрей Иванов', '1993-12-24', 'муж', 'ул Андреев', 3, 4, 'yes', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `cod_employee` int NOT NULL,
  `fio` text NOT NULL,
  `age` int NOT NULL,
  `gender` text NOT NULL,
  `adres` text NOT NULL,
  `phone` int NOT NULL,
  `passport` int NOT NULL,
  `cod_position` int NOT NULL,
  `cod_rank` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `employee`
--

INSERT INTO `employee` (`cod_employee`, `fio`, `age`, `gender`, `adres`, `phone`, `passport`, `cod_position`, `cod_rank`) VALUES
(1, 'Василий Петрушкин', 25, 'муж', 'Ул Петрушкиных', 5235234, 5234123, 1, 1),
(2, 'Геннадий Горин ', 54, 'муж', 'Ул Геннадиев', 4123521, 6343521, 5, 5),
(3, 'Павел Грешков', 21, 'муж', 'ул Павлов', 543121, 123543, 3, 3),
(4, 'Валерий Чубриков', 35, 'муж', 'Ул Чубриков', 532123, 656451, 4, 4),
(5, 'Семен Лукавин', 53, 'муж', 'ул Лукавинов', 231451, 5324123, 2, 2),
(6, 'Павел Дятлов', 25, 'муж', 'ул Дятлов', 231546, 312354, 3, 3),
(7, 'Анатолий Чекушкин', 54, 'муж', 'Ул Чекушки', 2315632, 2342342, 5, 5),
(8, 'Алексей Обманщиков', 26, 'муж', 'Ул Обманщиков', 864123, 789614, 1, 1),
(9, 'Василий Мошенников', 72, 'муж', 'ул Мошенников', 32141, 34251, 5, 5),
(10, 'Семен Врунов', 23, 'муж', 'ул Врунов', 21435432, 4532145, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `positions`
--

CREATE TABLE `positions` (
  `cod_position` int NOT NULL,
  `name_position` text NOT NULL,
  `oklad` int NOT NULL,
  `responsibilities` text NOT NULL,
  `requirements` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `positions`
--

INSERT INTO `positions` (`cod_position`, `name_position`, `oklad`, `responsibilities`, `requirements`) VALUES
(1, 'рядовой полиции', 100, 'Быть рядовым', 'Иметь образование рядового '),
(2, 'сержант полиции', 200, 'Быть сержантом полиции', 'Иметь образование сержанта полиции'),
(3, 'старший сержант', 300, 'Управлять машиной', 'Иметь образование старшего сержанта'),
(4, 'старшина полиции', 400, 'Быть старшиной', 'Иметь образование старшины'),
(5, 'старший прапорщик', 500, 'Быть прапорщиком в законе', 'Иметь образование прапорщика');

-- --------------------------------------------------------

--
-- Структура таблицы `ranks`
--

CREATE TABLE `ranks` (
  `cod_rank` int NOT NULL,
  `name_rank` text NOT NULL,
  `allowance` int NOT NULL,
  `responsibilities` text NOT NULL,
  `requirements` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `ranks`
--

INSERT INTO `ranks` (`cod_rank`, `name_rank`, `allowance`, `responsibilities`, `requirements`) VALUES
(1, 'Первый ранг', 100, 'Быть первым рангом', 'Быть первым рангом'),
(2, 'второй ранг', 200, 'Быть вторым рангом', 'Иметь образование второго ранга'),
(3, 'третий ранг', 300, 'Управлять машиной', 'Иметь образование третьего ранга'),
(4, 'четвертый ранг', 400, 'Быть четвертым рангом', 'Иметь образование четвёртого ранга '),
(5, 'Пятый ранг', 500, 'Ничего не делать', 'Иметь образование пятого ранга');

-- --------------------------------------------------------

--
-- Структура таблицы `types_of_crimes`
--

CREATE TABLE `types_of_crimes` (
  `cod_type_of_crime` int NOT NULL,
  `name_crime` text NOT NULL,
  `Article` int NOT NULL,
  `punishment` text NOT NULL,
  `Term` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `types_of_crimes`
--

INSERT INTO `types_of_crimes` (`cod_type_of_crime`, `name_crime`, `Article`, `punishment`, `Term`) VALUES
(1, 'Грабеж', 1, 'тюрьма', 5),
(2, 'Убийство', 2, 'Тюрьма', 10),
(3, 'Взятка', 3, 'Тюрьма', 50),
(4, 'Угон', 4, 'Тюрьма', 5),
(5, 'Мошенничество', 5, 'Тюрьма', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `victims`
--

CREATE TABLE `victims` (
  `cod_victims` int NOT NULL,
  `fio` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` text NOT NULL,
  `adres` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `victims`
--

INSERT INTO `victims` (`cod_victims`, `fio`, `date_of_birth`, `gender`, `adres`) VALUES
(1, 'Андрей Зеленов', '1999-12-09', 'муж', 'Ул Зеленовых'),
(2, 'Боб Физиков', '1992-12-09', 'муж', 'Ул Физиков'),
(3, 'Семен Васильев', '1991-12-24', 'муж', 'ул Старая'),
(4, 'Андрей Иванов', '1989-12-24', 'муж', 'ул Андреев'),
(5, 'Кирилл Семенов', '1993-12-24', 'муж', 'Ул Семенов');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `criminals`
--
ALTER TABLE `criminals`
  ADD PRIMARY KEY (`case_number`),
  ADD KEY `cod_type_of_crime` (`cod_type_of_crime`,`cod_victim`,`code_employee`),
  ADD KEY `cod_victim` (`cod_victim`),
  ADD KEY `code_employee` (`code_employee`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`cod_employee`),
  ADD KEY `cod_position` (`cod_position`,`cod_rank`),
  ADD KEY `cod_rank` (`cod_rank`);

--
-- Индексы таблицы `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`cod_position`);

--
-- Индексы таблицы `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`cod_rank`);

--
-- Индексы таблицы `types_of_crimes`
--
ALTER TABLE `types_of_crimes`
  ADD PRIMARY KEY (`cod_type_of_crime`);

--
-- Индексы таблицы `victims`
--
ALTER TABLE `victims`
  ADD PRIMARY KEY (`cod_victims`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `criminals`
--
ALTER TABLE `criminals`
  MODIFY `case_number` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `employee`
--
ALTER TABLE `employee`
  MODIFY `cod_employee` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `positions`
--
ALTER TABLE `positions`
  MODIFY `cod_position` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `ranks`
--
ALTER TABLE `ranks`
  MODIFY `cod_rank` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `types_of_crimes`
--
ALTER TABLE `types_of_crimes`
  MODIFY `cod_type_of_crime` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `victims`
--
ALTER TABLE `victims`
  MODIFY `cod_victims` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `criminals`
--
ALTER TABLE `criminals`
  ADD CONSTRAINT `criminals_ibfk_1` FOREIGN KEY (`cod_type_of_crime`) REFERENCES `types_of_crimes` (`cod_type_of_crime`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `criminals_ibfk_2` FOREIGN KEY (`cod_victim`) REFERENCES `victims` (`cod_victims`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `criminals_ibfk_3` FOREIGN KEY (`code_employee`) REFERENCES `employee` (`cod_employee`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`cod_position`) REFERENCES `positions` (`cod_position`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`cod_rank`) REFERENCES `ranks` (`cod_rank`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
