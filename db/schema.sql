-- Schema for QR Landing App
CREATE TABLE IF NOT EXISTS `settings` (
  `key` VARCHAR(191) NOT NULL,
  `value` TEXT NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `scans` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` VARCHAR(45) DEFAULT NULL,
  `user_agent` TEXT DEFAULT NULL,
  `referrer` TEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Default landing message
INSERT INTO `settings` (`key`, `value`) VALUES
('landing_message', 'Hallo! Scanne erfolgreich. Passe diese Nachricht im Adminbereich an.');