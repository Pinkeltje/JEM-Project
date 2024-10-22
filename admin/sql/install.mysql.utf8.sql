CREATE TABLE IF NOT EXISTS `#__jem_events` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `locid` int(11) unsigned NOT NULL DEFAULT '0',
  `dates` date NULL DEFAULT NULL,
  `enddates` date NULL DEFAULT NULL,
  `times` time NULL DEFAULT NULL,
  `endtimes` time NULL DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `modified` datetime NULL DEFAULT NULL,
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `version` int(11) unsigned NOT NULL DEFAULT '0',
  `author_ip` varchar(39) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `introtext` mediumtext NOT NULL,
  `meta_keywords` varchar(200) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `recurrence_first_id` int(11) NOT NULL DEFAULT '0',
  `recurrence_number` int(2) NOT NULL DEFAULT '0',
  `recurrence_type` int(2) NOT NULL DEFAULT '0',
  `recurrence_counter` int(11) NOT NULL DEFAULT '0',
  `recurrence_limit` int(11) NOT NULL DEFAULT '0',
  `recurrence_limit_date` date NULL DEFAULT NULL,
  `recurrence_byday` varchar(20) NULL DEFAULT NULL,
  `datimage` varchar(100) NOT NULL DEFAULT '',
  `checked_out` int(11) UNSIGNED NULL DEFAULT NULL,
  `checked_out_time` datetime NULL DEFAULT NULL,
  `registra` tinyint(1) NOT NULL DEFAULT '0',
  `registra_from` VARCHAR(19) NOT NULL DEFAULT '0',
  `registra_until` VARCHAR(19) NOT NULL DEFAULT '0',
  `unregistra` tinyint(1) NOT NULL DEFAULT '0',
  `unregistra_until` VARCHAR(7) NOT NULL DEFAULT '0',
  `maxplaces` int(11) NOT NULL DEFAULT '0',
  `minbookeduser` int(11) NOT NULL DEFAULT 1,
  `maxbookeduser` int(11) NOT NULL DEFAULT 1,
  `reservedplaces`  int(11) NOT NULL DEFAULT 0,
  `waitinglist` tinyint(1) NOT NULL DEFAULT '0',
  `requestanswer` tinyint(1) NOT NULL DEFAULT '0',
  `seriesbooking` int(1) NOT NULL DEFAULT '0',
  `singlebooking` int(1) NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `contactid` int(10) NOT NULL DEFAULT '0',
  `custom1` varchar(200) NOT NULL DEFAULT '',
  `custom2` varchar(200) NOT NULL DEFAULT '',
  `custom3` varchar(100) NOT NULL DEFAULT '',
  `custom4` varchar(100) NOT NULL DEFAULT '',
  `custom5` varchar(100) NOT NULL DEFAULT '',
  `custom6` varchar(100) NOT NULL DEFAULT '',
  `custom7` varchar(100) NOT NULL DEFAULT '',
  `custom8` varchar(100) NOT NULL DEFAULT '',
  `custom9` varchar(100) NOT NULL DEFAULT '',
  `custom10` varchar(100) NOT NULL DEFAULT '',
  `fulltext` mediumtext NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attribs` varchar(5120) NOT NULL DEFAULT '',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_venue` (`locid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_pubstate` (`published`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE TABLE IF NOT EXISTS `#__jem_venues` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `venue` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(200)  NOT NULL DEFAULT '',
  `street` varchar(50) DEFAULT NULL,
  `postalCode` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  `locdescription` mediumtext DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `locimage` varchar(100) NOT NULL DEFAULT '',
  `map` tinyint(4) NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `author_ip` varchar(39) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NULL DEFAULT NULL,
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `version` int(11) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NULL DEFAULT NULL,
  `checked_out_time` datetime NULL DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NULL DEFAULT NULL,
  `publish_down` datetime NULL DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `custom1` varchar(200) NOT NULL DEFAULT '',
  `custom2` varchar(200) NOT NULL DEFAULT '',
  `custom3` varchar(100) NOT NULL DEFAULT '',
  `custom4` varchar(100) NOT NULL DEFAULT '',
  `custom5` varchar(100) NOT NULL DEFAULT '',
  `custom6` varchar(100) NOT NULL DEFAULT '',
  `custom7` varchar(100) NOT NULL DEFAULT '',
  `custom8` varchar(100) NOT NULL DEFAULT '',
  `custom9` varchar(100) NOT NULL DEFAULT '',
  `custom10` varchar(100) NOT NULL DEFAULT '',
  `attribs` varchar(5120) DEFAULT NULL,
  `language` char(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_pubstate` (`published`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE TABLE IF NOT EXISTS `#__jem_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `catname` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(100) NOT NULL DEFAULT '',
  `description` mediumtext DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `image` varchar(100) NOT NULL DEFAULT '',
  `color` varchar(20) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NULL DEFAULT NULL,
  `checked_out_time` datetime NULL DEFAULT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `groupid` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '1',
  `language` varchar(7) DEFAULT NULL,
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `path` varchar(255) DEFAULT NULL,
  `metadata` varchar(2048) DEFAULT NULL,
  `modified_time` datetime NULL DEFAULT NULL,
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(200) DEFAULT NULL,
  `emailacljl` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE TABLE IF NOT EXISTS `#__jem_cats_event_relations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `itemid` int(11) NOT NULL DEFAULT '0',
  `ordering` tinyint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category event relation` (`catid`,`itemid`),
  KEY `catid` (`catid`),
  KEY `itemid` (`itemid`)
) ENGINE=MyISAM CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE TABLE IF NOT EXISTS `#__jem_register` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `event` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `places` int(11) NOT NULL DEFAULT '1', 
  `uregdate` varchar(50) NOT NULL DEFAULT '',
  `uip` varchar(15) NOT NULL DEFAULT '',
  `waiting` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '1',
  `comment` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_event` (`uid`,`event`),
  KEY `idx_event` (`event`),
  KEY `idx_event_status` (`event`,`status`),
  KEY `idx_user` (`uid`)
) ENGINE=MyISAM CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE TABLE IF NOT EXISTS `#__jem_groups` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(150) NOT NULL DEFAULT '',
  `description` mediumtext DEFAULT NULL,
  `checked_out` int(11) UNSIGNED NULL DEFAULT NULL,
  `checked_out_time` datetime NULL DEFAULT NULL,
  `addvenue` int(11) NOT NULL,
  `addevent` int(11) NOT NULL,
  `publishvenue` int(11) NOT NULL,
  `editvenue` int(11) NOT NULL,
  `publishevent` int(11) NOT NULL,
  `editevent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE TABLE IF NOT EXISTS `#__jem_groupmembers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `member` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_group` (`group_id`),
  KEY `idx_user` (`member`)
) ENGINE=MyISAM CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE TABLE IF NOT EXISTS `#__jem_config` (
  `keyname` varchar(100) NOT NULL,
  `value` text,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'rfu',
  PRIMARY KEY (`keyname`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE TABLE IF NOT EXISTS `#__jem_attachments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `frontend` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `added` datetime NULL DEFAULT NULL,
  `added_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

CREATE TABLE IF NOT EXISTS `#__jem_countries` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `continent` varchar(2) NOT NULL,
  `iso2` varchar(2) NOT NULL,
  `iso3` varchar(3) NOT NULL,
  `un` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iso2` (`iso2`)
) ENGINE=MyISAM CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;

INSERT IGNORE INTO #__jem_config (`keyname`, `value`) VALUES
('oldevent', '2'),
('minus', '1'),
('showtime', '1'),
('showtitle', '1'),
('showlocate', '1'),
('showcity', '1'),
('tablewidth', ''),
('datewidth', '20%'),
('datemode', '1'),
('titlewidth', '20%'),
('locationwidth', '15%'),
('citywidth', '15%'),
('formatdate', 'D, j. F Y'),
('formatShortDate', 'd.m.y'),
('formattime', 'H:i'),
('formathour', 'H'),
('timename', 'h'),
('showdetails', '1'),
('showlinkvenue', '1'),
('delivereventsyes', '-2'),
('datdesclimit', '1000'),
('autopubl', '-2'),
('deliverlocsyes', '-2'),
('autopublocate', '-2'),
('showcat', '1'),
('catfrowidth', '15%'),
('image_filetypes', 'jpg,gif,png,webp'),
('sizelimit', '100'),
('imagehight', '100'),
('imagewidth', '100'),
('gddisabled', '1'),
('imageenabled', '1'),
('attachmentenabled', '0'),
('frontendpublish','0'),
('catlinklist', '1'),
('showfroregistra', '2'),
('showfrounregistra', '2'),
('eventedit', '-2'),
('eventowner', '0'),
('venueedit', '-2'),
('venueowner', '0'),
('lightbox', '1'),
('meta_keywords', '[title], [a_name], [categories], [times]'),
('meta_description', 'The event titled [title] starts on [dates]!'),
('showstate', '1'),
('showeventimage', '0'),
('statewidth', '15%'),
('storeip', '0'),
('lastupdate', '0'),
('tableeventimagewidth', '10%'),
('display_num', '10'),
('discatheader', '1'),
('showatte', '0'),
('attewidth', '10%'),
('weekdaystart', '1'),
('ical_tz', '1'),
('attachments_path', 'media/com_jem/attachments'),
('attachments_maxsize', '1000'),
('attachments_types', 'txt,pdf,jpg,jpeg,gif,png,zip,tar.gz'),
('recurrence_anticipation_day', '3'),
('recurrence_anticipation_week', '12'),
('recurrence_anticipation_month', '60'),
('recurrence_anticipation_year', '180'),
('ical_max_items', '100'),
('defaultCountry', ''),
('flagicons_path', 'media/com_jem/images/flags/w20-png/'),
('csv_separator', ';'),
('csv_delimiter', '"'),
('csv_bom', '1'),
('globalattribs', ''),
('css', '{"css_backend_usecustom":"0","css_backend_customfile":"","css_calendar_usecustom":"0","css_calendar_customfile":"","css_colorpicker_usecustom":"0","css_colorpicker_customfile":"","css_geostyle_usecustom":"0","css_geostyle_customfile":"","css_googlemap_usecustom":"0","css_googlemap_customfile":"","css_jem_usecustom":"0","css_jem_customfile":"","css_print_usecustom":"0","css_print_customfile":"","css_color_bg_filter":"","css_color_bg_h2":"","css_color_bg_jem":"","css_color_bg_table_th":"","css_color_bg_table_td":"","css_color_bg_table_tr_entry2":"","css_color_bg_table_tr_hover":"","css_color_bg_table_tr_featured":"","css_color_border_filter":"","css_color_border_h2":"","css_color_border_table_th":"","css_color_border_table_td":"","css_color_font_h2":"","css_color_font_table_th":"","css_color_font_table_td":"","css_color_font_table_td_a":""}'),
('regallowcomments', '0'),
('regallowinvitation', '0'),
('layoutstyle', '1'),
('useiconfont', '1'),
('flyer', '0');

INSERT IGNORE INTO `#__jem_countries` (`id`, `continent`, `iso2`, `iso3`, `un`, `name`) VALUES
(1, 'AS', 'AF', 'AFG', 4, 'Afghanistan'),
(2, 'EU', 'AX', 'ALA', 248, 'Aland Islands'),
(3, 'EU', 'AL', 'ALB', 8, 'Albania'),
(4, 'AF', 'DZ', 'DZA', 12, 'Algeria'),
(5, 'OC', 'AS', 'ASM', 16, 'American Samoa'),
(6, 'EU', 'AD', 'AND', 20, 'Andorra'),
(7, 'AF', 'AO', 'AGO', 24, 'Angola'),
(8, 'NA', 'AI', 'AIA', 660, 'Anguilla'),
(9, 'AN', 'AQ', 'ATA', 10, 'Antarctica'),
(10, 'NA', 'AG', 'ATG', 28, 'Antigua and Barbuda'),
(11, 'SA', 'AR', 'ARG', 32, 'Argentina'),
(12, 'AS', 'AM', 'ARM', 51, 'Armenia'),
(13, 'NA', 'AW', 'ABW', 533, 'Aruba'),
(14, 'OC', 'AU', 'AUS', 36, 'Australia'),
(15, 'EU', 'AT', 'AUT', 40, 'Austria'),
(16, 'AS', 'AZ', 'AZE', 31, 'Azerbaijan'),
(17, 'NA', 'BS', 'BHS', 44, 'Bahamas'),
(18, 'AS', 'BH', 'BHR', 48, 'Bahrain'),
(19, 'AS', 'BD', 'BGD', 50, 'Bangladesh'),
(20, 'NA', 'BB', 'BRB', 52, 'Barbados'),
(21, 'EU', 'BY', 'BLR', 112, 'Belarus'),
(22, 'EU', 'BE', 'BEL', 56, 'Belgium'),
(23, 'NA', 'BZ', 'BLZ', 84, 'Belize'),
(24, 'AF', 'BJ', 'BEN', 204, 'Benin'),
(25, 'NA', 'BM', 'BMU', 60, 'Bermuda'),
(26, 'AS', 'BT', 'BTN', 64, 'Bhutan'),
(27, 'SA', 'BO', 'BOL', 68, 'Bolivia'),
(28, 'EU', 'BA', 'BIH', 70, 'Bosnia and Herzegovina'),
(29, 'AF', 'BW', 'BWA', 72, 'Botswana'),
(30, 'AN', 'BV', 'BVT', 74, 'Bouvet Island'),
(31, 'SA', 'BR', 'BRA', 76, 'Brazil'),
(32, 'AS', 'IO', 'IOT', 86, 'British Indian Ocean Territory'),
(33, 'NA', 'VG', 'VGB', 92, 'Virgin Islands (British), British Virgin Islands'),
(34, 'AS', 'BN', 'BRN', 96, 'Brunei Darussalam'),
(35, 'EU', 'BG', 'BGR', 100, 'Bulgaria'),
(36, 'AF', 'BF', 'BFA', 854, 'Burkina Faso'),
(37, 'AF', 'BI', 'BDI', 108, 'Burundi'),
(38, 'AS', 'KH', 'KHM', 116, 'Cambodia'),
(39, 'AF', 'CM', 'CMR', 120, 'Cameroon'),
(40, 'NA', 'CA', 'CAN', 124, 'Canada'),
(41, 'AF', 'CV', 'CPV', 132, 'Cape Verde'),
(42, 'NA', 'KY', 'CYM', 136, 'Cayman Islands'),
(43, 'AF', 'CF', 'CAF', 140, 'Central African Republic'),
(44, 'AF', 'TD', 'TCD', 148, 'Chad'),
(45, 'SA', 'CL', 'CHL', 152, 'Chile'),
(46, 'AS', 'CN', 'CHN', 156, 'China'),
(47, 'AS', 'CX', 'CXR', 162, 'Christmas Island'),
(48, 'AS', 'CC', 'CCK', 166, 'Cocos (Keeling) Islands'),
(49, 'SA', 'CO', 'COL', 170, 'Colombia'),
(50, 'AF', 'KM', 'COM', 174, 'Comoros (the)'),
(51, 'AF', 'CD', 'COD', 180, 'Congo (the Democratic Republic'),
(52, 'AF', 'CG', 'COG', 178, 'Congo'),
(53, 'OC', 'CK', 'COK', 184, 'Cook Islands '),
(54, 'NA', 'CR', 'CRI', 188, 'Costa Rica'),
(55, 'AF', 'CI', 'CIV', 384, 'Cote d''Ivoire (Ivory Coast), Republic of'),
(56, 'EU', 'HR', 'HRV', 191, 'Croatia'),
(57, 'NA', 'CU', 'CUB', 192, 'Cuba'),
(58, 'AS', 'CY', 'CYP', 196, 'Cyprus'),
(59, 'EU', 'CZ', 'CZE', 203, 'Czechia'),
(60, 'EU', 'DK', 'DNK', 208, 'Denmark'),
(61, 'AF', 'DJ', 'DJI', 262, 'Djibouti'),
(62, 'NA', 'DM', 'DMA', 212, 'Dominica'),
(63, 'NA', 'DO', 'DOM', 214, 'Dominican Republic'),
(64, 'SA', 'EC', 'ECU', 218, 'Ecuador'),
(65, 'AF', 'EG', 'EGY', 818, 'Egypt'),
(66, 'NA', 'SV', 'SLV', 222, 'El Salvador'),
(67, 'AF', 'GQ', 'GNQ', 226, 'Equatorial Guinea'),
(68, 'AF', 'ER', 'ERI', 232, 'Eritrea'),
(69, 'EU', 'EE', 'EST', 233, 'Estonia'),
(70, 'AF', 'ET', 'ETH', 231, 'Ethiopia'),
(71, 'EU', 'FO', 'FRO', 234, 'Faroe Islands'),
(72, 'SA', 'FK', 'FLK', 238, 'Falkland Islands [Malvinas]'),
(73, 'OC', 'FJ', 'FJI', 242, 'Fiji'),
(74, 'EU', 'FI', 'FIN', 246, 'Finland'),
(75, 'EU', 'FR', 'FRA', 250, 'France'),
(76, 'SA', 'GF', 'GUF', 254, 'French Guiana'),
(77, 'OC', 'PF', 'PYF', 258, 'French Polynesia'),
(78, 'AN', 'TF', 'ATF', 260, 'French Southern Territories'),
(79, 'AF', 'GA', 'GAB', 266, 'Gabon'),
(80, 'AF', 'GM', 'GMB', 270, 'Gambia'),
(81, 'AS', 'GE', 'GEO', 268, 'Georgia'),
(82, 'EU', 'DE', 'DEU', 276, 'Germany'),
(83, 'AF', 'GH', 'GHA', 288, 'Ghana'),
(84, 'EU', 'GI', 'GIB', 292, 'Gibraltar'),
(85, 'EU', 'GR', 'GRC', 300, 'Greece'),
(86, 'NA', 'GL', 'GRL', 304, 'Greenland'),
(87, 'NA', 'GD', 'GRD', 308, 'Grenada'),
(88, 'NA', 'GP', 'GLP', 312, 'Guadeloupe'),
(89, 'OC', 'GU', 'GUM', 316, 'Guam'),
(90, 'NA', 'GT', 'GTM', 320, 'Guatemala'),
(91, 'EU', 'GG', 'GGY', 831, 'Guernsey'),
(92, 'AF', 'GN', 'GIN', 324, 'Guinea'),
(93, 'AF', 'GW', 'GNB', 624, 'Guinea-Bissau'),
(94, 'SA', 'GY', 'GUY', 328, 'Guyana'),
(95, 'NA', 'HT', 'HTI', 332, 'Haiti'),
(96, 'AN', 'HM', 'HMD', 334, 'Heard Island and McDonald Isla'),
(97, 'EU', 'VA', 'VAT', 336, 'Vatican City'),
(98, 'NA', 'HN', 'HND', 340, 'Honduras'),
(99, 'AS', 'HK', 'HKG', 344, 'Hong Kong'),
(100, 'EU', 'HU', 'HUN', 348, 'Hungary'),
(101, 'EU', 'IS', 'ISL', 352, 'Iceland'),
(102, 'AS', 'IN', 'IND', 356, 'India'),
(103, 'AS', 'ID', 'IDN', 360, 'Indonesia'),
(104, 'AS', 'IR', 'IRN', 364, 'Iran'),
(105, 'AS', 'IQ', 'IRQ', 368, 'Iraq'),
(106, 'EU', 'IE', 'IRL', 372, 'Ireland'),
(107, 'EU', 'IM', 'IMN', 833, 'Isle of Man'),
(108, 'AS', 'IL', 'ISR', 376, 'Israel'),
(109, 'EU', 'IT', 'ITA', 380, 'Italy'),
(110, 'NA', 'JM', 'JAM', 388, 'Jamaica'),
(111, 'AS', 'JP', 'JPN', 392, 'Japan'),
(112, 'EU', 'JE', 'JEY', 832, 'Jersey'),
(113, 'AS', 'JO', 'JOR', 400, 'Jordan'),
(114, 'AS', 'KZ', 'KAZ', 398, 'Kazakhstan'),
(115, 'AF', 'KE', 'KEN', 404, 'Kenya'),
(116, 'OC', 'KI', 'KIR', 296, 'Kiribati'),
(117, 'AS', 'KP', 'PRK', 408, 'North Korea'),
(118, 'AS', 'KR', 'KOR', 410, 'South Korea'),
(119, 'AS', 'KW', 'KWT', 414, 'Kuwait'),
(120, 'AS', 'KG', 'KGZ', 417, 'Kyrgyzstan'),
(121, 'AS', 'LA', 'LAO', 418, 'Laos'),
(122, 'EU', 'LV', 'LVA', 428, 'Latvia'),
(123, 'AS', 'LB', 'LBN', 422, 'Lebanon'),
(124, 'AF', 'LS', 'LSO', 426, 'Lesotho'),
(125, 'AF', 'LR', 'LBR', 430, 'Liberia'),
(126, 'AF', 'LY', 'LBY', 434, 'Libya'),
(127, 'EU', 'LI', 'LIE', 438, 'Liechtenstein'),
(128, 'EU', 'LT', 'LTU', 440, 'Lithuania'),
(129, 'EU', 'LU', 'LUX', 442, 'Luxembourg'),
(130, 'AS', 'MO', 'MAC', 446, 'Macao'),
(131, 'EU', 'MK', 'MKD', 807, 'Macedonia'),
(132, 'AF', 'MG', 'MDG', 450, 'Madagascar'),
(133, 'AF', 'MW', 'MWI', 454, 'Malawi'),
(134, 'AS', 'MY', 'MYS', 458, 'Malaysia'),
(135, 'AS', 'MV', 'MDV', 462, 'Maldives'),
(136, 'AF', 'ML', 'MLI', 466, 'Mali'),
(137, 'EU', 'MT', 'MLT', 470, 'Malta'),
(138, 'OC', 'MH', 'MHL', 584, 'Marshall Islands'),
(139, 'NA', 'MQ', 'MTQ', 474, 'Martinique'),
(140, 'AF', 'MR', 'MRT', 478, 'Mauritania'),
(141, 'AF', 'MU', 'MUS', 480, 'Mauritius'),
(142, 'AF', 'YT', 'MYT', 175, 'Mayotte'),
(143, 'NA', 'MX', 'MEX', 484, 'Mexico'),
(144, 'OC', 'FM', 'FSM', 583, 'Micronesia'),
(145, 'EU', 'MD', 'MDA', 498, 'Moldova'),
(146, 'EU', 'MC', 'MCO', 492, 'Monaco'),
(147, 'AS', 'MN', 'MNG', 496, 'Mongolia'),
(148, 'EU', 'ME', 'MNE', 499, 'Montenegro'),
(149, 'NA', 'MS', 'MSR', 500, 'Montserrat'),
(150, 'AF', 'MA', 'MAR', 504, 'Morocco'),
(151, 'AF', 'MZ', 'MOZ', 508, 'Mozambique'),
(152, 'AS', 'MM', 'MMR', 104, 'Myanmar (Burma)'),
(153, 'AF', 'NA', 'NAM', 516, 'Namibia'),
(154, 'OC', 'NR', 'NRU', 520, 'Nauru'),
(155, 'AS', 'NP', 'NPL', 524, 'Nepal'),
(157, 'EU', 'NL', 'NLD', 528, 'Netherlands'),
(158, 'OC', 'NC', 'NCL', 540, 'New Caledonia'),
(159, 'OC', 'NZ', 'NZL', 554, 'New Zealand'),
(160, 'NA', 'NI', 'NIC', 558, 'Nicaragua'),
(161, 'AF', 'NE', 'NER', 562, 'Niger'),
(162, 'AF', 'NG', 'NGA', 566, 'Nigeria'),
(163, 'OC', 'NU', 'NIU', 570, 'Niue'),
(164, 'OC', 'NF', 'NFK', 574, 'Norfolk Island'),
(165, 'OC', 'MP', 'MNP', 580, 'Northern Mariana Islands'),
(166, 'EU', 'NO', 'NOR', 578, 'Norway'),
(167, 'AS', 'OM', 'OMN', 512, 'Oman'),
(168, 'AS', 'PK', 'PAK', 586, 'Pakistan'),
(169, 'OC', 'PW', 'PLW', 585, 'Palau'),
(170, 'AS', 'PS', 'PSE', 275, 'Palestine'),
(171, 'NA', 'PA', 'PAN', 591, 'Panama'),
(172, 'OC', 'PG', 'PNG', 598, 'Papua New Guinea'),
(173, 'SA', 'PY', 'PRY', 600, 'Paraguay'),
(174, 'SA', 'PE', 'PER', 604, 'Peru'),
(175, 'AS', 'PH', 'PHL', 608, 'Philippines'),
(176, 'OC', 'PN', 'PCN', 612, 'Pitcairn'),
(177, 'EU', 'PL', 'POL', 616, 'Poland'),
(178, 'EU', 'PT', 'PRT', 620, 'Portugal'),
(179, 'NA', 'PR', 'PRI', 630, 'Puerto Rico'),
(180, 'AS', 'QA', 'QAT', 634, 'Qatar'),
(181, 'AF', 'RE', 'REU', 638, 'Reunion'),
(182, 'EU', 'RO', 'ROU', 642, 'Romania'),
(183, 'EU', 'RU', 'RUS', 643, 'Russia'),
(184, 'AF', 'RW', 'RWA', 646, 'Rwanda'),
(185, 'NA', 'BL', 'BLM', 652, 'Saint Barthelemy'),
(186, 'AF', 'SH', 'SHN', 654, 'Saint Helena, Ascension and Tristan da Cunha'),
(187, 'NA', 'KN', 'KNA', 659, 'Saint Kitts and Nevis'),
(188, 'NA', 'LC', 'LCA', 662, 'Saint Lucia'),
(189, 'NA', 'MF', 'MAF', 663, 'Saint Martin'),
(190, 'NA', 'PM', 'SPM', 666, 'Saint Pierre and Miquelon'),
(191, 'NA', 'VC', 'VCT', 670, 'Saint Vincent and the Grenadines'),
(192, 'OC', 'WS', 'WSM', 882, 'Samoa'),
(193, 'EU', 'SM', 'SMR', 674, 'San Marino'),
(194, 'AF', 'ST', 'STP', 678, 'Sao Tome and Principe'),
(195, 'AS', 'SA', 'SAU', 682, 'Saudi Arabia'),
(196, 'AF', 'SN', 'SEN', 686, 'Senegal'),
(197, 'EU', 'RS', 'SRB', 688, 'Serbia'),
(198, 'AF', 'SC', 'SYC', 690, 'Seychelles'),
(199, 'AF', 'SL', 'SLE', 694, 'Sierra Leone'),
(200, 'AS', 'SG', 'SGP', 702, 'Singapore'),
(201, 'EU', 'SK', 'SVK', 703, 'Slovakia'),
(202, 'EU', 'SI', 'SVN', 705, 'Slovenia'),
(203, 'OC', 'SB', 'SLB', 90, 'Solomon Islands'),
(204, 'AF', 'SO', 'SOM', 706, 'Somalia'),
(205, 'AF', 'ZA', 'ZAF', 710, 'South Africa'),
(206, 'AN', 'GS', 'SGS', 239, 'South Georgia and the South Sandwich Islands'),
(207, 'EU', 'ES', 'ESP', 724, 'Spain'),
(208, 'AS', 'LK', 'LKA', 144, 'Sri Lanka'),
(209, 'AF', 'SD', 'SDN', 736, 'Sudan'),
(210, 'SA', 'SR', 'SUR', 740, 'Suriname'),
(211, 'EU', 'SJ', 'SJM', 744, 'Svalbard and Jan Mayen'),
(212, 'AF', 'SZ', 'SWZ', 748, 'Swaziland'),
(213, 'EU', 'SE', 'SWE', 752, 'Sweden'),
(214, 'EU', 'CH', 'CHE', 756, 'Switzerland'),
(215, 'AS', 'SY', 'SYR', 760, 'Syria'),
(216, 'AS', 'TW', 'TWN', 158, 'Taiwan'),
(217, 'AS', 'TJ', 'TJK', 762, 'Tajikistan'),
(218, 'AF', 'TZ', 'TZA', 834, 'Tanzania'),
(219, 'AS', 'TH', 'THA', 764, 'Thailand'),
(220, 'AS', 'TL', 'TLS', 626, 'Timor-Leste'),
(221, 'AF', 'TG', 'TGO', 768, 'Togo'),
(222, 'OC', 'TK', 'TKL', 772, 'Tokelau'),
(223, 'OC', 'TO', 'TON', 776, 'Tonga'),
(224, 'NA', 'TT', 'TTO', 780, 'Trinidad and Tobago'),
(225, 'AF', 'TN', 'TUN', 788, 'Tunisia'),
(226, 'AS', 'TR', 'TUR', 792, 'Turkey'),
(227, 'AS', 'TM', 'TKM', 795, 'Turkmenistan'),
(228, 'NA', 'TC', 'TCA', 796, 'Turks and Caicos Islands'),
(229, 'OC', 'TV', 'TUV', 798, 'Tuvalu'),
(230, 'AF', 'UG', 'UGA', 800, 'Uganda'),
(231, 'EU', 'UA', 'UKR', 804, 'Ukraine'),
(232, 'AS', 'AE', 'ARE', 784, 'United Arab Emirates'),
(233, 'EU', 'GB', 'GBR', 826, 'United Kingdom'),
(234, 'NA', 'US', 'USA', 840, 'United States'),
(235, 'OC', 'UM', 'UMI', 581, 'United States Minor Outlying Islands'),
(236, 'NA', 'VI', 'VIR', 850, 'Virgin Islands (US)'),
(237, 'SA', 'UY', 'URY', 858, 'Uruguay'),
(238, 'AS', 'UZ', 'UZB', 860, 'Uzbekistan'),
(239, 'OC', 'VU', 'VUT', 548, 'Vanuatu'),
(240, 'SA', 'VE', 'VEN', 862, 'Venezuela'),
(241, 'AS', 'VN', 'VNM', 704, 'Vietnam'),
(242, 'OC', 'WF', 'WLF', 876, 'Wallis and Futuna'),
(243, 'AF', 'EH', 'ESH', 732, 'Western Sahara'),
(244, 'AS', 'YE', 'YEM', 887, 'Yemen'),
(245, 'AF', 'ZM', 'ZMB', 894, 'Zambia'),
(246, 'AF', 'ZW', 'ZWE', 716, 'Zimbabwe'),
(247, 'NA', 'BQ', 'BES', 535, 'Bonaire, Sint Eustatius and Saba'),
(248, 'NA', 'CW', 'CUW', 531, 'Curacao'),
(249, 'NA', 'SX', 'SXM', 534, 'Sint Maarten'),
(250, 'AF', 'SS', 'SSD', 728, 'South Sudan'),
(251, 'EU', 'XK', 'XKX', '688', 'Kosovo');

INSERT IGNORE INTO `#__jem_categories` (`id`, `parent_id`, `lft`, `rgt`, `level`, `catname`, `alias`, `access`, `published`, `created_time` ) VALUES
(1, 0, 0, 1, 0, 'root', 'root', 1, 1, now());

