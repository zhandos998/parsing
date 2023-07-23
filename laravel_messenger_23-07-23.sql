-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 23 2023 г., 16:46
-- Версия сервера: 10.5.11-MariaDB
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel_messenger`
--

-- --------------------------------------------------------

--
-- Структура таблицы `contacts_json`
--

CREATE TABLE `contacts_json` (
  `id` int(11) NOT NULL,
  `telegram` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contacts_json`
--

INSERT INTO `contacts_json` (`id`, `telegram`, `instagram`, `facebook`, `whatsapp`, `updated_at`) VALUES
(1, '[{\"href\": \"#-1545847705\", \"subtitle\": \"Nickolai: Интересуют поставки ...\", \"user_name\": \"🅱️ Biznes KZ СНГ 2.0 | СДЕЛКИ | чат N°1 по крупному бизнесу\", \"message_time\": \"19:27\", \"unread\": \"73\"}, {\"href\": \"#1234060895\", \"subtitle\": \"1. Анкеталарды қарау.\n2. Менің...\", \"user_name\": \"Дайвинчик | Leomatch bot\", \"message_time\": \"18:56\", \"unread\": null}, {\"href\": \"#5713591254\", \"subtitle\": \"нууу\", \"user_name\": \"🤍\", \"message_time\": \"16:29\", \"unread\": null}, {\"href\": \"#1279131129\", \"subtitle\": \"фото бар ма ?\", \"user_name\": \"Аяяу\", \"message_time\": \"Wed\", \"unread\": null}, {\"href\": \"#964125216\", \"subtitle\": \" Телефон в Telegram не совпада...\", \"user_name\": \"Weblancer\", \"message_time\": \"Jul 16\", \"unread\": null}, {\"href\": \"#5487072704\", \"subtitle\": \"\", \"user_name\": \"Deleted Account\", \"message_time\": \"Jul 15\", \"unread\": null}, {\"href\": \"#1743362870\", \"subtitle\": \"Привет\", \"user_name\": \"..\", \"message_time\": \"Jul 15\", \"unread\": null}, {\"href\": \"#6301048387\", \"subtitle\": \"Deleted Account joined Telegra...\", \"user_name\": \"Deleted Account\", \"message_time\": \"Jul 15\", \"unread\": null}, {\"href\": \"#6146750375\", \"subtitle\": \"айтамын\", \"user_name\": \"Жанар Бактияркызы\", \"message_time\": \"Jul 14\", \"unread\": null}, {\"href\": \"#6201016897\", \"subtitle\": \"Как ты\", \"user_name\": \"💗\", \"message_time\": \"Jul 14\", \"unread\": null}, {\"href\": \"#1782807959\", \"subtitle\": \"калайсын?\", \"user_name\": \"Айгерим Молдаш\", \"message_time\": \"Jul 14\", \"unread\": null}, {\"href\": \"#5103219864\", \"subtitle\": \"гоша Гаухар ма ?\", \"user_name\": \"Gosha\", \"message_time\": \"Jul 13\", \"unread\": null}, {\"href\": \"#1416302269\", \"subtitle\": \"hi\", \"user_name\": \"Гүлдана Ният қызы 2004ж\", \"message_time\": \"Jul 11\", \"unread\": null}, {\"href\": \"#994278659\", \"subtitle\": \"Как жизнь?\", \"user_name\": \"Дильназ Мейрамбекова\", \"message_time\": \"Jul 10\", \"unread\": null}, {\"href\": \"#6128462158\", \"subtitle\": \"Ducati Kazakhstan joined Teleg...\", \"user_name\": \"Ducati Kazakhstan\", \"message_time\": \"Jun 17\", \"unread\": null}, {\"href\": \"#1001280573\", \"subtitle\": \"Отырыкшы\", \"user_name\": \"Айко\", \"message_time\": \"May 8\", \"unread\": null}, {\"href\": \"#-1573908436\", \"subtitle\": \"Grant  left the group\", \"user_name\": \"ASM | Support chat\", \"message_time\": \"Mar 26\", \"unread\": null}, {\"href\": \"#777000\", \"subtitle\": \"Включите облачный пароль\nЯн, с...\", \"user_name\": \"Telegram\", \"message_time\": \"Mar 25\", \"unread\": \"1\"}, {\"href\": \"#2120597770\", \"subtitle\": \" Sticker\", \"user_name\": \"Liarnika💋\", \"message_time\": \"Feb 20\", \"unread\": null}, {\"href\": \"#640685342\", \"subtitle\": \" Sticker\", \"user_name\": \"🫦\", \"message_time\": \"Feb 20\", \"unread\": null}, {\"href\": \"#947309382\", \"subtitle\": \"Привет\", \"user_name\": \"Эльвира\", \"message_time\": \"Feb 19\", \"unread\": null}, {\"href\": \"#5925374675\", \"subtitle\": \"Привет\", \"user_name\": \"салем\", \"message_time\": \"Feb 19\", \"unread\": null}, {\"href\": \"#5479991568\", \"subtitle\": \"Привет\", \"user_name\": \"toomseerr🦦\", \"message_time\": \"Feb 19\", \"unread\": null}, {\"href\": \"#1164532154\", \"subtitle\": \"Привет\", \"user_name\": \"Darya Shevchuk\", \"message_time\": \"Feb 19\", \"unread\": null}, {\"href\": \"#881467935\", \"subtitle\": \"Welcome to (https://coinmatics...\", \"user_name\": \"CTT Copy Trading\", \"message_time\": \"Jan 10\", \"unread\": null}, {\"href\": \"#5733467012\", \"subtitle\": \"\", \"user_name\": \"Нурсулу\", \"message_time\": \"Jan 10\", \"unread\": null}, {\"href\": \"#5937807673\", \"subtitle\": \"Асель Ату Студ joined Telegram\", \"user_name\": \"Асель Ату Студ\", \"message_time\": \"12/31/2022\", \"unread\": null}, {\"href\": \"#2091091254\", \"subtitle\": \"Kuralai, 22, Тараз – Insta:  _...\", \"user_name\": \"Saved Messages\", \"message_time\": \"11/11/2022\", \"unread\": null}, {\"href\": \"#1621164406\", \"subtitle\": \"окей\", \"user_name\": \"inspiration man\", \"message_time\": \"08/26/2022\", \"unread\": null}, {\"href\": \"#2102292669\", \"subtitle\": \"Спасибо Снимать\nоформление под...\", \"user_name\": \"MyHome\", \"message_time\": \"03/13/2022\", \"unread\": null}]', NULL, NULL, NULL, '2023-07-20 21:04:19');

-- --------------------------------------------------------

--
-- Структура таблицы `send_links`
--

CREATE TABLE `send_links` (
  `user_id` int(11) NOT NULL,
  `link` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `send_links`
--

INSERT INTO `send_links` (`user_id`, `link`, `data`, `updated_at`) VALUES
(1, '#5713591254', '[{\"who\": 0, \"date\": \"Today\", \"time\": \"\", \"content\": \"\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"\", \"content\": \"\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:12:04\", \"content\": \"турмадым ол жакта\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:18:14\", \"content\": \"могу ли я\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:18:30\", \"content\": \"попросить у тебя твои фотки ?)\"}, {\"who\": 1, \"date\": \"Today\", \"time\": \"20 July 2023, 16:18:46\", \"content\": \"кандай\"}, {\"who\": 1, \"date\": \"Today\", \"time\": \"20 July 2023, 16:18:49\", \"content\": \"голый фотома\"}, {\"who\": 1, \"date\": \"Today\", \"time\": \"20 July 2023, 16:18:51\", \"content\": \"депщ\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:18:57\", \"content\": \"😂\n\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:19:04\", \"content\": \"иногда осылай куасын\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:19:15\", \"content\": \"иногда иманын кайда дейсын\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:19:20\", \"content\": \"шатастырасын сен кыз\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:20:17\", \"content\": \"кстати сен менен сурадын гой девственниксын ба деп\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:20:28\", \"content\": \"сен озын кандайсын ?\"}, {\"who\": 1, \"date\": \"Today\", \"time\": \"20 July 2023, 16:21:03\", \"content\": \"алы даже саусак кырмеген😌😌\"}, {\"who\": 1, \"date\": \"Today\", \"time\": \"20 July 2023, 16:21:05\", \"content\": \"😂\n😂\n😂\n\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:21:27\", \"content\": \"блииин\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:21:37\", \"content\": \"калай сойлесемын мен сенымен\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:21:44\", \"content\": \"екы ортада журсын сен\"}, {\"who\": 1, \"date\": \"Today\", \"time\": \"20 July 2023, 16:21:59\", \"content\": \"😂\n😂\n😂\n\"}, {\"who\": 1, \"date\": \"Today\", \"time\": \"20 July 2023, 16:22:06\", \"content\": \"иногда иман иногда иван\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:22:23\", \"content\": \"пххх\"}, {\"who\": 0, \"date\": \"Today\", \"time\": \"20 July 2023, 16:22:45\", \"content\": \"иногда хиджаб\nиногда латекс деш)\"}, {\"who\": 1, \"date\": \"Today\", \"time\": \"20 July 2023, 16:29:53\", \"content\": \"нууу\"}]', '2023-07-20 17:39:11');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `contacts_json`
--
ALTER TABLE `contacts_json`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `send_links`
--
ALTER TABLE `send_links`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `contacts_json`
--
ALTER TABLE `contacts_json`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
