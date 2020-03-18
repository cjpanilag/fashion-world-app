-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2020 at 08:38 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fashion-world-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`post_id`, `user_id`) VALUES
(5, 1),
(7, 1),
(7, 9),
(8, 1),
(11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_30_103247_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `posted_by` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `posted_by`, `title`, `body`, `image`, `created_at`, `updated_at`) VALUES
(5, 1, 'Test title 1', 'Test body 1', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAABmJLR0QA/wD/AP+gvaeTAAADj0lEQVR4nO2bP28TMRjGH1+6MVXqwFdg6cKQgJIO/SMYGOCbkBYJVjYKlPabwIAECBWhNhLXgaVLvgJSKjExVcQstYjS5M722X4b5/lJmRLfnZ6f7fPrugAhhBBCCCGEEEIIIYQQQnJHST/ATaVz0H0OhVdNr1PuDiozLpreIFfKvcE+NF7Evg8FVJBCAgXUEFsCBVgQUwIFWBJLwlIJaB/11ttHvXXf9rqlPgH4E/CRlkdA+6i3rsb6WI31sY8E0x7ArZDPtRQCJsJbA7CmtP7eftu969k+KNkLmBmexqpq4auNhJjhA5kLqAzPQkLs8IGMBViFVyHBJXyt/V/MWQpw6rkzJDj2/BFa6r7vEnXFp9FNxmva+C9hByvq0iV8Xajts6en5wDOOwdduG7gZTUCGs3ZGquqwGeH9hcT4QPwK9ayERDohblm2X6kC7U1Gb7BVYKIgKYV6azrxV6tTHCt50/jIiG5gKYV6bzrwXLauPr4cjGv509zJeFl3e+S/kXsWlgKv/Vf7Jw9G/wMcr1qRrpQ20qrS+jxNwC3HW83quv5PiQTMDcsTwk+4ZvwOocbdxwlRAkfSCSgNixHCU3CNzhIiBY+kECAdViWEkKEb7CQEDV8ILIA59VJjYSQ4RsqJEQPH4gowHtpOEdCjPANMyQkCR+IJKDxunxKQszwDRMSWqnCByIICFgUXehCbQGA4/aA1Tp9FqYuSRU+EFhAhIrUFE3Rw/fl0fvHuur7j08+VGYcbDfUoyKFxW9tRYqEH4IgWxEec/QWVLEB4FeA28/dGFsEGgvwfUGW/ZMhVLGJZhKSrVZi0WgKaro6Kfsnw87hxmbMvZmmc3RsvEdAqKWh50hY+J5v8BIQel3uKCGb8AEPAbGKIksJWYUPOAqIXZHWSMgufMBBQIrtAGCuhCzDBywFpArfMCUh2/ABSwFK4yE8j2r4UvZPhrpQD3IOH7CsA8r+6evOQVfVHDoK3lNzDt5g/Q6oOWqR9TQRE6dKuNwb7M84fpdV+KkrZ+c6YGokZBW+BF57QeXeYP/eu954XODLou2/3zS8N+N+7J6+Cfkgy0rw4+m59dDYZHM6elGhAGEoQBjxf1Fa9ncGR4AwFCAMBQhT+w5Y9jk6NhwBwlCAMBQgDAUIQwHCUIAwFCAMBQhDAcJQgDAUIAwFCEMBwlCAMBQgDAUIQwHCUIAwFEAIIYQQQgghifkH8Xahsh+ShzEAAAAASUVORK5CYII=', '2020-01-10 05:24:20', '2020-01-10 05:24:20'),
(7, 3, 'Test title 3', 'Test Title body', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAABmJLR0QA/wD/AP+gvaeTAAADq0lEQVR4nO3bv0/UcBjH8efbI6fmklscLnHyBl2OKxoGIHGR6YyTcVMn/gD8NTDaTc3B9WA2MTG4+CMRE6LGBAMiLYMxoDfogpOJ65kgUejjgoagcL322z6t/bxG6LVf7h2gD/1CBAAAAAAAkCJVd7y/6o73S68jDEN6AUGZy/YwsTGn2JivOvYZ6fUElcoAVce+SB4/U0RFIioo4qd9S/aI9LqCSF0A021cVsT3iCi/48M9rPiO6UxYQssKTEkvwDdm1ec2bzLxWIcjp1YH21dJWV4s6wopFQEqLSufaxfvEtEFny953N5oX/p82tqIcl06JD6AuVIv0HruERHVunoh09who+fc8uBoO5qV6ZHoAL1us2QwzxJx0FvN97mtn7V3p8a+aF2YRokNYC7Xy+TlXhDRsZCnWlMG11YGrn/ydV2nwft9fnXomtb3LJF3QVV3vJ+8nEPh33wiojJ7aqn6xh7ScC7tEhfg94BFRCWNpz2sDH6ZxIEtUQF2DVi6JXJgS0yAPQYs3RI3sMkHYFZ9jn2LmJoxrUcRqRum05gktsS/ftEFVFpW3nTtaR/TbRRGTbf44Ogr66DAtf8QC2Cu1Au5dnGG/E+3UThfPFCcHXCnovid44tIgF63WaL1nnnqdrqNgqLh77y5eHLx9hGZy8dM44Cl25oyuMae+rjfQakexDQPWLqV2VMLcV80tgARDVi6xb62WAJEPGClWuQBYhqwUiu6APEPWKnUE8VJKy0rn3Ptuyx7j58K2gOYK/UCtQM8wcoorT8aEjVgRaTXbWq9U9IWwFyulw32FkI8PkwFgz3nhDupbY7REmDHgHVcx/kSruzx1mtdWyJDB0jJgKVbSbExby41Qv+oDRUg4wNWgRTNVJcaoe70AgfAgEVERHmlaLrqTAR+ntH9X/b8bxHMmkBbIrsKEGCLYKYo4vubxW8jrYr1w/9rfNreIviQiBK3tSNRutwS6SuAhi2CGaPeekqd/TB45WvHIzsdsP0E6zll4x5fJ19bIve9C8rYgKVbmT210Glg2zNARgcs3Uqd/oftnwEyPmDpVlDET/Ya2P4KgAErEnsObKG3WHTaT/+/C7tNBY8KhSGAMAQQhgDCEEAYAghDAGGRbMwKQ/f2792SNrfgO0AYAghDAGEIIAwBhCGAMAQQhgDCEEAYAghDAGEIIAwBhCGAMAQQhgDCEEAYAghDAGEIIAwBhCGAMAQQhgDCEEAYAghDAAAAAAAAAAAAgJj8AkXOPxZGfYk4AAAAAElFTkSuQmCC', '2020-01-11 20:22:57', '2020-01-11 21:09:12'),
(8, 3, 'Test Title 4', 'test Body 4', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAQAAACSoYmJAAAAAmJLR0QA/4ePzL8AAACtSURBVHja7dZBDoMgEEDRWXl8OSleoS6a7m1whmLfd2dC8kyEIUKSpOK22OOI18BzxB5bLboNgT9Pq0X3W9Ad+pm/x5IbUZJqDrgJh2BLByeMm16G7n+OXvL3WHIjvstGpwQ9A33l/cja2z4SGhr6x9DZRx409EX0t/sHejq68siDhjbG3T2McWhjHNpEhDbGoU1EaHcPaBMR2t0Det27x11roaGhn4SWJEnK6gS7D/ymbnVt4QAAAABJRU5ErkJggg==', '2020-01-11 20:53:42', '2020-01-11 20:53:42'),
(10, 1, 'GabGab', 'gab gab', 'data:image/png;base64,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', '2020-01-14 02:05:51', '2020-01-14 02:06:33'),
(11, 1, 'asdasd', '1231qwde', 'data:image/png;base64,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', '2020-01-14 02:29:51', '2020-01-14 02:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `image`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Carl Jeffrie Panilag', 'cjpanilag@gmail.com', 'data:image/png;base64,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', '2019-12-26 18:57:20', '$2y$10$fu33NIv6Pa86pq5u93hCb.ff1BLSfgZOB/Rr2tEpglFiD1BOYZty6', 'kOdIFVVX3y', '2019-12-26 18:57:20', '2019-12-26 18:57:20'),
(3, 'Irish Mae Molato', 'irishmolato@gmail.com', 'data:image/png;base64,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', '2019-12-29 01:45:19', '$2y$10$Rr6EFG7JjciP73AhPjLen.VYsFfrEepR5alJ/yLaMfGpYChYXEpnS', 'iOfinTRYeN', '2019-12-29 01:45:19', '2019-12-29 01:45:19'),
(4, 'T\'Challa', 'blackpanther@gmail.com', '', '2019-12-29 05:19:28', '$2y$10$IS2Y2rqQxH05l0qBJjs/ceOU9jkCQErdBVIW8wzBwN0PntnCU5clS', 'Gtb6E6uUof', '2019-12-29 05:19:28', '2019-12-29 05:19:28'),
(5, 'Tony Stark', 'ironman@gmail.com', '', '2019-12-29 05:24:39', '$2y$10$FqLruBEq5KwaSMqja5le2.6P93wD.6R4hIRBVgZ6G1rEMIuhrtVk6', '6CURigJicK', '2019-12-29 05:24:39', '2019-12-29 05:24:39'),
(6, 'Natasha Romanova', 'blackwidow@gmail.com', '', '2019-12-29 05:27:27', '$2y$10$oic.c/0bUtzzkjCva0QLruJNrlP5qxSNeq6tQbT69fcF/LF5V0xey', '7dKVyQMOK6', '2019-12-29 05:27:27', '2019-12-29 05:27:27'),
(7, 'Clinton Francis Barton', 'hawkeye@gmail.com', 'data:image/png;base64,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', '2019-12-29 05:34:14', '$2y$10$Wf7egK2NfQYyQZIRDvalNesXvTaaWbbUSdPc/x.xCmE5N2iHt1Fya', 'VJBRL1ItxN', '2019-12-29 05:34:14', '2019-12-29 05:34:14'),
(8, 'Rey Palpatine', 'reypalpatine@gmail.com', '', '2019-12-29 05:43:15', '$2y$10$D4NihHEjT05wfiWzPWwAjuhAPT8ebYvDRinaeV57A/XD4LRS4/ec.', 'DFQWzkFLM8', '2019-12-29 05:43:15', '2019-12-29 05:43:15'),
(9, 'Ben Solo', 'kayloren@gmail.com', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAA0CAQAAABvcdNgAAAAAmJLR0QA/4ePzL8AAAJtSURBVFjDtdc9aFNRFMDxf5Ia0E2xfu1F29Rah1IQxEn8ABdxcOggBbXWbzFCKQ24qdSm4iCim9Vg6iBK6JCaOAiCpQ4qtS3SqRZRCtGmQSXpdYkhzfvIve/ed+70Dpf3g+Tdc84FlYhwkTgjjBDnAhF8iDA9zCFq1hw9hE0yrcxYkP9rhlZTzAGWHBmBIM8hE8wOcq6MQLDETl0mxFRdRiD4TIMedEKKEQi69aBpaeiLDtMkzQgEzd6hs0rQZe/QPSXooXfomRL0wjv0Wgl66x3KKEFvvEPPlaCUd2hYCbrrHTqpBPV6hyJKkEZhDTAvzSwQ0ClCcWloWK+o7pKGdut2pHEpJo127JOC9mIgknWZBEZiGz9cme9sxVAcoeTIlDiMwbjiR7uzj1lbJkfQNPTUFhrHeKRsoTHz0KAtdBMf4lzNDL7Meb1CWh1hunhHZ/lpPVEy5MmTIcqGcraTlxzVub5sJsYCAsHjquxtBIKhqkwCgeAbMRrVkUbu8LvyIxUrU2hH+eiW2FPOtFCs7CswxEZ5pIEoP2v+9CQAASYqmfflEzRas/MXfayRYdqYtPm6VmgHjq3KHQfaWbHZ/YGOekwXBYdSkyXIx5o7UZCsw+4/nHZjBuo0a+uA5bb/hvM5ce86RYnM6nXNjmmq+spMrb92d6YnxhmH3vvVF2jeCuV8gXJWaNEXaNEKTfoCTVihXl+gM1YoKDG/qa5R+4kiRB/LxpAC/YSci9AmYnzSRqa5zhaZCt7MJR4x5TI2CtsKP0uCq7Spt7+1bGc/3fRzi/skSZEmzSuypEkzRpIHDDLAKQ7Swjq3V/0Dii7M6HMBZ04AAAAASUVORK5CYII=', '2019-12-29 05:44:44', '$2y$10$RGsq/w12qe5pfkKo6UnqluK6AMs14OFFjDsbncEjksj6oVxilD7My', 'NSM2Fl61Hm', '2019-12-29 05:44:44', '2019-12-29 05:44:44'),
(10, 'Anakin Skywalker', 'darthvader@gmail.com', '', '2019-12-29 05:47:54', '$2y$10$IQi0tkjoIUG1qt1Uz70aCu76Yco6lzwRftxQSU2oF.9ChZwDsx56e', 'B0f4psmR4m', '2019-12-29 05:47:54', '2019-12-29 05:47:54'),
(11, 'Seth Moraga', 'moraga@gmail.com', 'data:image/png;base64,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', '2020-01-13 22:53:27', '$2y$10$hc/oYlW8pQUooYAB7DyIX.RO8wgVltkfzCUA64KOBuOdMZySzQLg2', 'xyAQVkkMI3', '2020-01-13 22:53:27', '2020-01-13 22:53:27'),
(12, 'Seth Moraga', 'moraga@gmail.com', NULL, '2020-01-13 22:53:27', '$2y$10$v/BlGLyRzf9ekEM75MdAD.xDQ4ReF2xeNxcEhktJP3.aQHNipi0Mq', '126aC5O5TK', '2020-01-13 22:53:27', '2020-01-13 22:53:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_posted_by_foreign` (`posted_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_posted_by_foreign` FOREIGN KEY (`posted_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
