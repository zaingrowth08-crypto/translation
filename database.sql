CREATE DATABASE IF NOT EXISTS linguatranslate;
USE linguatranslate;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source_lang` varchar(10) NOT NULL,
  `target_lang` varchar(10) NOT NULL,
  `source_text` text NOT NULL,
  `translated_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `translations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert default languages
INSERT IGNORE INTO `languages` (`code`, `name`) VALUES
('en', 'English'),
('ur', 'Urdu'),
('ar', 'Arabic'),
('fr', 'French'),
('es', 'Spanish'),
('zh', 'Chinese'),
('de', 'German'),
('hi', 'Hindi'),
('it', 'Italian'),
('ja', 'Japanese'),
('ko', 'Korean'),
('ru', 'Russian'),
('pt', 'Portuguese'),
('tr', 'Turkish');
