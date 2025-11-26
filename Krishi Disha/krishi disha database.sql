CREATE DATABASE IF NOT EXISTS krishidisha;
USE krishidisha;
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(200) NOT NULL,
    email VARCHAR(150),
    fullname VARCHAR(150)
);
CREATE TABLE crops (
    id INT AUTO_INCREMENT PRIMARY KEY,
    slug VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(100),
    namekn VARCHAR(100),
    seasons VARCHAR(100),
    seasonskn VARCHAR(100),
    durationdays INT,
    durationcategory VARCHAR(50),
    durationcategorykn VARCHAR(50),
    sowingwindow VARCHAR(100),
    sowingwindowkn VARCHAR(100),
    harvestwindow VARCHAR(100),
    harvestwindowkn VARCHAR(100),
    irrigation VARCHAR(250),
    irrigationkn VARCHAR(250),
    soilphmin DECIMAL(3,1),
    soilphmax DECIMAL(3,1),
    fertilizerbaseline VARCHAR(250),
    fertilizerbaselinekn VARCHAR(250),
    info TEXT,
    infokn TEXT,
    cultivationguide_climate VARCHAR(100),
    cultivationguide_soil VARCHAR(100),
    cultivationguide_seedrate VARCHAR(100),
    cultivationguide_spacing VARCHAR(50),
    cultivationguide_yield VARCHAR(50),
    cultivationguidekn_climate VARCHAR(100),
    cultivationguidekn_soil VARCHAR(100),
    cultivationguidekn_seedrate VARCHAR(100),
    cultivationguidekn_spacing VARCHAR(50),
    cultivationguidekn_yield VARCHAR(50)
);
CREATE TABLE fertilizers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    namekn VARCHAR(100),
    npk VARCHAR(50),
    use_info TEXT,
    usekn TEXT,
    when_info VARCHAR(100),
    whenkn VARCHAR(100),
    where_info VARCHAR(100),
    wherekn VARCHAR(100),
    notes TEXT,
    noteskn TEXT
);
INSERT INTO crops (
    slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
    sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
    irrigation, irrigationkn, soilphmin, soilphmax,
    fertilizerbaseline, fertilizerbaselinekn, info, infokn,
    cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
    cultivationguide_spacing, cultivationguide_yield,
    cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
    cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
(
    'rice', 'Rice', 'ಬತ್ತ', 'Rainy', 'ಮಳೆಗಾಲ', 120, 'Long', 'ದೀರ್ಘ',
    'June–July', 'ಜೂನ್–ಜುಲೈ', 'Oct–Nov', 'ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್',
    'Irrigated (requires standing water in early stages)', 'ನೀರಾವರಿ (ಆರಂಭಿಕ ಹಂತಗಳಲ್ಲಿ ನಿಲ್ಲುವ ನೀರಿನ ಅಗತ್ಯ)', 5.0, 7.5,
    'Urea + DAP + MOP', 'ಯೂರಿಯಾ + ಡಿಎಪಿ + ಎಂಒಪಿ',
    'Thrives in warm, humid climate with abundant water. Best in clayey loam soils.',
    'ಬತ್ತ ಬಿಸಿ, ತೇವಾಂಶಯುಕ್ತ ಹವಾಮಾನದಲ್ಲಿ ಉತ್ತಮವಾಗಿ ಬೆಳೆಯುತ್ತದೆ. ಮಿಶ್ರಿತ ಮಣ್ಣಿನಲ್ಲಿ ಉತ್ತಮ.',
    'Warm, humid', 'Clayey loam', '60–80 kg/ha', '20x15 cm', '4–6 tons/ha',
    'ಬಿಸಿ, ತೇವಾಂಶಯುಕ್ತ', 'ಮಿಶ್ರಿತ ಮಣ್ಣು', '60–80 ಕೆಜಿ/ಹೆಕ್ಟೇರ್', '20x15 ಸೆಂ', '4–6 ಟನ್/ಹೆಕ್ಟೇರ್'
),
(
    'wheat', 'Wheat', 'ಗೋಧಿ', 'Winter', 'ಚಳಿಗಾಲ', 110, 'Medium', 'ಮಧ್ಯಮ',
    'Nov–Dec', 'ನವೆಂಬರ್–ಡಿಸೆಂಬರ್', 'March–April', 'ಮಾರ್ಚ್–ಏಪ್ರಿಲ್',
    'Irrigated (critical at crown root initiation)', 'ನೀರಾವರಿ (ಮೂಲ ಬೇರು ಆರಂಭದಲ್ಲಿ ನಿರ್ಣಾಯಕ)', 6.0, 7.5,
    'NPK (Nitrogen heavy), Zn if deficient', 'ಎನ್‌ಪಿಕೆ (ನೈಟ್ರೋಜನ್ ಹೆಚ್ಚು), ಜಿಂಕ್ ಕೊರತೆಯಿದ್ದರೆ',
    'Prefers cool climate and well-drained loam soils.',
    'ಗೋಧಿ ತಂಪಾದ ಹವಾಮಾನ ಮತ್ತು ನೀರು ಹರಿಯುವ ಮಿಶ್ರಿತ ಮಣ್ಣನ್ನು ಇಷ್ಟಪಡುತ್ತದೆ.',
    'Cool climate, 20°C ideal', 'Loamy, well-drained', '100–120 kg/ha', '20x5 cm', '3–4 tons/ha',
    'ತಂಪು ಹವಾಮಾನ, 20°C ಸೂಕ್ತ', 'ಲೋಮಿ, ನೀರು ಹರಿಯುವ ಮಣ್ಣು', '100–120 ಕೆಜಿ/ಹೆಕ್ಟೇರ್', '20x5 ಸೆಂ', '3–4 ಟನ್/ಹೆಕ್ಟೇರ್'
),
(
    'maize', 'Maize (Corn)', 'ಮೆಕ್ಕೆಜೋಳ', 'Rainy,Winter,Summer', 'ಮಳೆಗಾಲ,ಚಳಿಗಾಲ,ಬೇಸಿಗೆಗಾಲ',
    100, 'Medium', 'ಮಧ್ಯಮ',
    'June–July / Oct–Nov / Feb–March', 'ಜೂನ್–ಜುಲೈ / ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್ / ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
    '100–110 days after sowing', 'ಬಿತ್ತನೆ ನಂತರ 100–110 ದಿನಗಳು',
    'Rainfed or Irrigated', 'ಮಳೆಯಾಧಾರಿತ ಅಥವಾ ನೀರಾವರಿ', 5.5, 7.5,
    'Nitrogen-rich basal + top dressing', 'ನೈಟ್ರೋಜನ್ ಸಮೃದ್ಧ ಮೂಲ + ಮೇಲಿನ ಡ್ರೆಸ್ಸಿಂಗ್',
    'Grows well in well-drained soils with moderate rainfall.',
    'ಮಧ್ಯಮ ಮಳೆಯೊಂದಿಗೆ ನೀರು ಹರಿಯುವ ಮಣ್ಣಿನಲ್ಲಿ ಉತ್ತಮವಾಗಿ ಬೆಳೆಯುತ್ತದೆ.',
    'Warm, moderate rainfall', 'Well-drained loam', '15–20 kg/ha', '60x25 cm', '4–5 tons/ha',
    'ಬಿಸಿ, ಮಧ್ಯಮ ಮಳೆಯೊಂದಿಗೆ', 'ನೀರು ಹರಿಯುವ ಲೋಮಿ ಮಣ್ಣು', '15–20 ಕೆಜಿ/ಹೆಕ್ಟೇರ್', '60x25 ಸೆಂ', '4–5 ಟನ್/ಹೆಕ್ಟೇರ್'
),
(
    'sorghum', 'Sorghum (Jowar)', 'ಜೋಳ', 'Rainy,Winter', 'ಮಳೆಗಾಲ,ಚಳಿಗಾಲ',
    95, 'Medium', 'ಮಧ್ಯಮ',
    'June–July / Sep–Oct', 'ಜೂನ್–ಜುಲೈ / ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
    'Sept–Nov / Jan–Feb', 'ಸೆಪ್ಟೆಂಬರ್–ನವೆಂಬರ್ / ಜನವರಿ–ಫೆಬ್ರವರಿ',
    'Rainfed (drought tolerant)', 'ಮಳೆಯಾಧಾರಿತ (ಬೇಸಿಗೆಗೆ ತಾಳುವ ಶಕ್ತಿ)', 5.5, 8.0,
    'Balanced NPK; responds well to FYM', 'ಸಮತೋಲನ ಎನ್‌ಪಿಕೆ; ಎಫ್‌ವೈಎಂಗೆ ಉತ್ತಮ ಪ್ರತಿಕ್ರಿಯೆ',
    'Hardy cereal suitable for low rainfall regions.',
    'ಕಡಿಮೆ ಮಳೆಯ ಪ್ರದೇಶಗಳಿಗೆ ಸೂಕ್ತವಾದ ಬಲಿಷ್ಠ ಧಾನ್ಯ.',
    'Semi-arid, drought tolerant', 'Sandy loam', '10–12 kg/ha', '45x15 cm', '2–3 tons/ha',
    'ಅರ್ಧ ಬಿಸಿಲು, ಬಿಸಿಲಿಗೆ ತಾಳುವ ಶಕ್ತಿ', 'ಮರಳು ಮಿಶ್ರಿತ ಲೋಮಿ ಮಣ್ಣು', '10–12 ಕೆಜಿ/ಹೆಕ್ಟೇರ್', '45x15 ಸೆಂ', '2–3 ಟನ್/ಹೆಕ್ಟೇರ್'
),
(
    'tomato', 'Tomato', 'ಟೊಮೇಟೊ', 'Rainy,Winter,Summer', 'ಮಳೆಯಗಾಲ,ಚಳಿಗಾಲ,ಬೇಸಿಗೆ',
    90, 'Medium', 'ಮಧ್ಯಮ ಅವಧಿ',
    'June to July', 'ಜೂನ್ ರಿಂದ ಜುಲೈ',
    'September to October', 'ಸೆಪ್ಟೆಂಬರ್ ರಿಂದ ಅಕ್ಟೋಬರ್',
    'Irrigated (moderate, avoid waterlogging)', 'ನೀರಾವರಿ (ಮಿತವಾಗಿ, ನೀರಿನ ನಿಲ್ಲುವಿಕೆ ತಪ್ಪಿಸಿ)', 6.0, 7.0,
    'NPK 12:32:16 at 50kg/acre + FYM', 'ಎನ್‌ಪಿಕೆ 12:32:16 ಪ್ರತಿ ಎಕರೆಗೆ 50 ಕೆಜಿ + ಎಫ್‌ವೈಎಂ',
    'Tomatoes grow best in well-drained loamy soil with moderate irrigation. Avoid excess nitrogen.',
    'ಟೊಮೇಟೊಗಳು ನೀರು ಹರಿಯುವ ಲೋಮಿ ಮಣ್ಣಿನಲ್ಲಿ ಉತ್ತಮವಾಗಿ ಬೆಳೆಯುತ್ತವೆ. ಹೆಚ್ಚು ನೈಟ್ರೋಜನ್ ತಪ್ಪಿಸಿ.',
    'Warm, moderate rainfall', 'Well-drained loam', '250–300 g/acre', '60x45 cm', '10–12 tons/ha',
    'ಬಿಸಿ, ಮಧ್ಯಮ ಮಳೆಯೊಂದಿಗೆ', 'ನೀರು ಹರಿಯುವ ಲೋಮಿ ಮಣ್ಣು', '250–300 ಗ್ರಾಂ/ಎಕರೆ', '60x45 ಸೆಂ', '10–12 ಟನ್/ಹೆಕ್ಟೇರ್'
);
INSERT INTO fertilizers (
    name, namekn, npk, use_info, usekn, when_info, whenkn, where_info, wherekn, notes, noteskn
) VALUES
(
    'Urea', 'ಯೂರಿಯಾ', '46-0-0',
    'Primary nitrogen source; promotes leafy growth.', 'ಪ್ರಾಥಮಿಕ ನೈಟ್ರೋಜನ್ ಮೂಲ; ಎಲೆಗಳ ಬೆಳವಣಿಗೆಗೆ ಸಹಾಯ.',
    'Basal and top dressing (split doses).', 'ಮೂಲ ಮತ್ತು ಮೇಲಿನ ಡ್ರೆಸ್ಸಿಂಗ್ (ವಿಭಜಿತ ಪ್ರಮಾಣ).',
    'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.',
    'Avoid standing water contact; mix into soil.', 'ನಿಲ್ಲುವ ನೀರಿನ ಸಂಪರ್ಕ ತಪ್ಪಿಸಿ; ಮಣ್ಣಿನಲ್ಲಿ ಸೇರಿಸಿ.'
),
(
    'DAP', 'ಡಿಎಪಿ', '18-46-0',
    'Provides phosphorus for root development; some nitrogen.', 'ಬೆರಳುಗಳ ಬೆಳವಣಿಗೆಗೆ ಫಾಸ್ಫರಸ್; ಸ್ವಲ್ಪ ನೈಟ್ರೋಜನ್.',
    'Apply at sowing/transplanting as basal.', 'ಬಿತ್ತನೆ/ಮರುನಾಟದ ಸಮಯದಲ್ಲಿ ಮೂಲ ಅನ್ವಯ.',
    'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.',
    'Do not mix directly with urea; maintain spacing.', 'ಯೂರಿಯಾ ಜೊತೆಗೆ ನೇರವಾಗಿ ಮಿಶ್ರಣ ಮಾಡಬೇಡಿ; ಅಂತರ ಕಾಯ್ದುಕೊಳ್ಳಿ.'
),
(
    'MOP (Muriate of Potash)', 'ಎಂಒಪಿ (ಪೊಟಾಶ್‌ನ ಮ್ಯೂರಿಯೇಟ್)', '0-0-60',
    'Potassium for disease resistance and grain filling.', 'ರೋಗ ನಿರೋಧಕತೆ ಮತ್ತು ಧಾನ್ಯ ತುಂಬುವಿಕೆಗೆ ಪೊಟಾಶಿಯಂ.',
    'Basal or early growth stages.', 'ಮೂಲ ಅಥವಾ ಪ್ರಾರಂಭಿಕ ಬೆಳವಣಿಗೆ ಹಂತಗಳಲ್ಲಿ.',
    'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.',
    'Useful in sandy soils with low potassium.', 'ಕೆ ಕಡಿಮೆ ಇರುವ ಮರಳು ಮಣ್ಣಿನಲ್ಲಿ ಉಪಯುಕ್ತ.'
),
(
    'NPK Complex', 'ಎನ್‌ಪಿಕೆ ಕಾಂಪ್ಲೆಕ್ಸ್', 'Various (e.g., 10-26-26, 17-17-17)',
    'Balanced nutrients when soil test is unavailable.', 'ಮಣ್ಣು ಪರೀಕ್ಷೆ ಲಭ್ಯವಿಲ್ಲದಿದ್ದರೆ ಸಮತೋಲನ ಪೋಷಕಾಂಶ.',
    'Basal; adjust based on crop stage.', 'ಮೂಲ; ಬೆಳೆ ಹಂತದ ಆಧಾರದ ಮೇಲೆ ಹೊಂದಿಸಿ.',
    'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.',
    'Choose grade based on crop requirement.', 'ಬೆಳೆ ಅಗತ್ಯದ ಆಧಾರದ ಮೇಲೆ ಗ್ರೇಡ್ ಆಯ್ಕೆಮಾಡಿ.'
),
(
    'Lime / Dolomite', 'ಚೂನಾ / ಡೋಲೊಮೈಟ್', '-',
    'Neutralizes acidic soil; provides calcium/magnesium.', 'ಆಮ್ಲೀಯ ಮಣ್ಣನ್ನು ನ್ಯೂಟ್ರಲೈಸ್ ಮಾಡುತ್ತದೆ; ಕ್ಯಾಲ್ಸಿಯಂ/ಮ್ಯಾಗ್ನೀಷಿಯಂ ಒದಗಿಸುತ್ತದೆ.',
    'Before sowing or during off-season.', 'ಬಿತ್ತನೆಗೂ ಮುನ್ನ ಅಥವಾ ಋತುವಿನ ಹೊರಗಾಗಿರುವ ಸಮಯದಲ್ಲಿ.',
    'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.',
    'Apply based on soil pH test; avoid overuse.', 'ಮಣ್ಣಿನ ಪಿಎಚ್ ಪರೀಕ್ಷೆಯ ಆಧಾರದ ಮೇಲೆ ಅನ್ವಯಿಸಿ; ಹೆಚ್ಚು ಬಳಸಬೇಡಿ.'
),
(
    'FYM / Compost', 'ಎಫ್‌ವೈಎಂ / ಕಂಪೋಸ್ಟ್', 'Various',
    'Improves soil structure and moisture retention.', 'ಮಣ್ಣಿನ ರಚನೆ ಮತ್ತು ತೇವಾಂಶ ಹಿಡಿದಿಡುವ ಸಾಮರ್ಥ್ಯವನ್ನು ಸುಧಾರಿಸುತ್ತದೆ.',
    'Apply before sowing as basal.', 'ಬಿತ್ತನೆಗೂ ಮುನ್ನ ಮೂಲವಾಗಿ.',
    'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.',
    'Enhances microbial activity and long-term fertility.', 'ಜೈವಿಕ ಚಟುವಟಿಕೆ ಮತ್ತು ದೀರ್ಘಕಾಲಿಕ ಫಲವತ್ತತೆ ಹೆಚ್ಚಿಸುತ್ತದೆ.'
);
USE krishidisha;

-- Store sensor + recommendation
USE krishidisha;
CREATE TABLE IF NOT EXISTS sensor_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL,
    npk VARCHAR(50),
    moisture DECIMAL(5,2),
    temperature DECIMAL(5,2),
    ph DECIMAL(3,1),
    recommendation TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
USE krishidisha;
ALTER TABLE sensor_data
    DROP COLUMN npk,
    ADD COLUMN nitrogen DECIMAL(5,2) AFTER email,
    ADD COLUMN phosphorus DECIMAL(5,2) AFTER nitrogen,
    ADD COLUMN potassium DECIMAL(5,2) AFTER phosphorus;
USE krishidisha;
ALTER TABLE crops
  ADD COLUMN nitrogen_req_min DECIMAL(5,2) DEFAULT 0,
  ADD COLUMN nitrogen_req_max DECIMAL(5,2) DEFAULT 999,
  ADD COLUMN phosphorus_req_min DECIMAL(5,2) DEFAULT 0,
  ADD COLUMN phosphorus_req_max DECIMAL(5,2) DEFAULT 999,
  ADD COLUMN potassium_req_min DECIMAL(5,2) DEFAULT 0,
  ADD COLUMN potassium_req_max DECIMAL(5,2) DEFAULT 999,
  ADD COLUMN moisture_req_min DECIMAL(5,2) DEFAULT 0,
  ADD COLUMN moisture_req_max DECIMAL(5,2) DEFAULT 100,
  ADD COLUMN temp_req_min DECIMAL(5,2) DEFAULT -10,
  ADD COLUMN temp_req_max DECIMAL(5,2) DEFAULT 60;

USE krishidisha;
DROP TABLE IF EXISTS crops;
USE krishidisha;
CREATE TABLE crops (
    slug VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    namekn VARCHAR(100),
    seasons VARCHAR(100),
    seasonskn VARCHAR(100),
    durationdays INT,
    durationcategory VARCHAR(50),
    durationcategorykn VARCHAR(50),
    sowingwindow VARCHAR(100),
    sowingwindowkn VARCHAR(100),
    harvestwindow VARCHAR(100),
    harvestwindowkn VARCHAR(100),
    irrigation VARCHAR(255),
    irrigationkn VARCHAR(255),
    soilphmin DECIMAL(3,1),
    soilphmax DECIMAL(3,1),
    fertilizerbaseline VARCHAR(255),
    fertilizerbaselinekn VARCHAR(255),
    info TEXT,
    infokn TEXT,
    cultivationguide_climate VARCHAR(255),
    cultivationguide_soil VARCHAR(255),
    cultivationguide_seedrate VARCHAR(255),
    cultivationguide_spacing VARCHAR(255),
    cultivationguide_yield VARCHAR(255),
    cultivationguidekn_climate VARCHAR(255),
    cultivationguidekn_soil VARCHAR(255),
    cultivationguidekn_seedrate VARCHAR(255),
    cultivationguidekn_spacing VARCHAR(255),
    cultivationguidekn_yield VARCHAR(255)
);


USE krishidisha;

INSERT INTO crops (
  slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
  sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
  irrigation, irrigationkn, soilphmin, soilphmax,
  fertilizerbaseline, fertilizerbaselinekn, info, infokn,
  cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
  cultivationguide_spacing, cultivationguide_yield,
  cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
  cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
('paddy','Paddy (Rice)','ಬತ್ತ','Kharif','ಖರಿಫ್',120,'Long','ದೀರ್ಘ','June–July','ಜೂನ್–ಜುಲೈ','Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್',
'Irrigated (standing water early stages)','ನೀರಾವರಿ (ಆರಂಭದಲ್ಲಿ ನಿಲ್ಲುವ ನೀರು ಅಗತ್ಯ)',5.0,7.5,'Urea + DAP + MOP','ಯೂರಿಯಾ + ಡಿಎಪಿ + ಎಂಒಪಿ',
'Warm humid crop requiring waterlogged condition at start.','ಬಿಸಿ ತೇವಾಂಶಯುಕ್ತ ಹವಾಮಾನದಲ್ಲಿ ಬೆಳೆಯುವ ಬೆಳೆ.',
'Warm humid','Clayey loam','60–80 kg/ha','20x15 cm','4–6 t/ha',
'ಬಿಸಿ ತೇವಾಂಶ','ಮಿಶ್ರ ಮಣ್ಣು','60–80 ಕೆಜಿ/ಹೆ','20x15 ಸೆಂ','4–6 ಟನ್/ಹೆ'),

('ragi','Finger Millet (Ragi)','ರಾಗಿ','Kharif','ಖರಿಫ್',110,'Medium','ಮಧ್ಯಮ','June–July','ಜೂನ್–ಜುಲೈ','Oct–Nov','ಅಕ್ಟೋ–ನವೆಂ',
'Rainfed or light irrigation','ಮಳೆಯಾಧಾರಿತ ಅಥವಾ ಲಘು ನೀರಾವರಿ',5.5,7.0,'NPK 15:15:15 + FYM','ಎನ್‌ಪಿಕೆ 15:15:15 + ಎಫ್‌ವೈಎಂ',
'Drought-tolerant staple suited for dry belts.','ಒಣ ಪ್ರದೇಶಗಳಲ್ಲಿ ಬೆಳೆಯುವ ಧಾನ್ಯ.',
'Semi-arid','Red loam','8–10 kg/ha','22x7.5 cm','2–3 t/ha',
'ಅರ್ಧ ಒಣ','ಕೆಂಪು ಮಣ್ಣು','8–10 ಕೆಜಿ/ಹೆ','22x7.5 ಸೆಂ','2–3 ಟನ್/ಹೆ'),

('jowar','Sorghum (Jowar)','ಜೋಳ','Kharif,Rabi','ಖರಿಫ್,ರಬೀ',95,'Medium','ಮಧ್ಯಮ','June–July','ಜೂನ್–ಜುಲೈ','Sept–Nov','ಸೆಪ್ಟೆಂಬರ್–ನವೆಂಬರ್',
'Rainfed','ಮಳೆಯಾಧಾರಿತ',5.5,8.0,'Balanced NPK','ಸಮತೋಲನ ಎನ್‌ಪಿಕೆ',
'Hardy cereal for low rainfall zones.','ಕಡಿಮೆ ಮಳೆಯ ಪ್ರದೇಶಗಳಿಗೆ ಸೂಕ್ತ.',
'Semi-arid','Sandy loam','10–12 kg/ha','45x15 cm','2–3 t/ha',
'ಅರ್ಧ ಬಿಸಿಲು','ಮರಳು ಲೋಮಿ','10–12 ಕೆಜಿ/ಹೆ','45x15 ಸೆಂ','2–3 ಟನ್/ಹೆ'),

('maize','Maize (Corn)','ಮೆಕ್ಕೆಜೋಳ','Kharif,Rabi','ಖರಿಫ್,ರಬೀ',100,'Medium','ಮಧ್ಯಮ',
'June–July','ಜೂನ್–ಜುಲೈ','Oct–Nov','ಅಕ್ಟೋ–ನವೆಂ',
'Irrigated / Rainfed','ನೀರಾವರಿ / ಮಳೆಯಾಧಾರಿತ',5.5,7.5,'Nitrogen-rich + top dressing','ನೈಟ್ರೋಜನ್ ಸಮೃದ್ಧ + ಮೇಲಿನ ಡ್ರೆಸ್ಸಿಂಗ್',
'Popular dual-season cereal; needs good drainage.','ಎರಡು ಋತುಗಳಲ್ಲಿ ಬೆಳೆಯುವ ಧಾನ್ಯ; ನೀರು ಹರಿಯುವ ಮಣ್ಣು ಅಗತ್ಯ.',
'Warm moderate rain','Loam well-drained','15–20 kg/ha','60x25 cm','4–5 t/ha',
'ಬಿಸಿ ಮಧ್ಯಮ ಮಳೆ','ಲೋಮಿ ಮಣ್ಣು','15–20 ಕೆಜಿ/ಹೆ','60x25 ಸೆಂ','4–5 ಟನ್/ಹೆ'),

('wheat','Wheat','ಗೋಧಿ','Rabi','ರಬೀ',110,'Medium','ಮಧ್ಯಮ','Nov–Dec','ನವೆಂ–ಡಿಸೆಂ','Mar–Apr','ಮಾರ್ಚ್–ಏಪ್ರಿಲ್',
'Irrigated (critical at CRI)','ನೀರಾವರಿ (ಮೂಲ ಬೇರು ಹಂತ)',6.0,7.5,'NPK heavy + Zn','ಎನ್‌ಪಿಕೆ ಹೆಚ್ಚು + ಜಿಂಕ್',
'Cool season grain preferring loamy soil.','ತಂಪು ಹವಾಮಾನದಲ್ಲಿ ಬೆಳೆಯುವ ಧಾನ್ಯ.',
'Cool 20°C','Loamy well drained','100–120 kg/ha','20x5 cm','3–4 t/ha',
'ತಂಪು ಹವಾಮಾನ','ಲೋಮಿ ಮಣ್ಣು','100–120 ಕೆಜಿ/ಹೆ','20x5 ಸೆಂ','3–4 ಟನ್/ಹೆ'),

('bajra','Pearl Millet (Bajra)','ಸಜ್ಜೆ','Kharif','ಖರಿಫ್',85,'Short','ಕಡಿಮೆ','June–July','ಜೂನ್–ಜುಲೈ','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,7.5,'FYM + NPK 10:26:26','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 10:26:26',
'Tolerant to heat and drought.','ಬಿಸಿಲು ಮತ್ತು ಒಣತನ ತಾಳುವಿಕೆ.',
'Hot semi-arid','Sandy loam','4–5 kg/ha','45x15 cm','1.5–2 t/ha',
'ಬಿಸಿ ಒಣ','ಮರಳು ಮಣ್ಣು','4–5 ಕೆಜಿ/ಹೆ','45x15 ಸೆಂ','1.5–2 ಟನ್/ಹೆ'),

('tur','Pigeon Pea (Tur)','ತೊಗರಿ','Kharif','ಖರಿಫ್',160,'Long','ದೀರ್ಘ','June–July','ಜೂನ್–ಜುಲೈ','Dec–Jan','ಡಿಸೆಂ–ಜನ',
'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,7.5,'Rhizobium + DAP','ರೈಜೋಬಿಯಮ್ + ಡಿಎಪಿ',
'Deep-rooted pulse suiting red soil.','ಕೆಂಪು ಮಣ್ಣಿಗೆ ಸೂಕ್ತ ಆಳ ಬೇರು ಬೇಳೆ.',
'Tropical','Red loam','8–10 kg/ha','90x20 cm','1–1.5 t/ha',
'ಉಷ್ಣ','ಕೆಂಪು ಮಣ್ಣು','8–10 ಕೆಜಿ/ಹೆ','90x20 ಸೆಂ','1–1.5 ಟನ್/ಹೆ'),

('moong','Green Gram (Moong)','ಹಸಿರು ಕಡಲೆ','Kharif,Rabi','ಖರಿಫ್,ರಬೀ',70,'Short','ಕಡಿಮೆ',
'June–July','ಜೂನ್–ಜುಲೈ','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,7.5,'Rhizobium + NPK','ರೈಜೋಬಿಯಮ್ + ಎನ್‌ಪಿಕೆ',
'Quick pulse for short seasons.','ಕಡಿಮೆ ಋತುವಿನ ಬೇಳೆ.',
'Tropical','Light loam','8–10 kg/ha','30x10 cm','0.6–1 t/ha',
'ಉಷ್ಣ','ಲಘು ಮಣ್ಣು','8–10 ಕೆಜಿ/ಹೆ','30x10 ಸೆಂ','0.6–1 ಟನ್/ಹೆ'),

('urad','Black Gram (Urad)','ಉದ್ದಿನ ಬೇಳೆ','Kharif','ಖರಿಫ್',80,'Short','ಕಡಿಮೆ','June–July','ಜೂನ್–ಜುಲೈ','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,7.5,'Rhizobium + NPK','ರೈಜೋಬಿಯಮ್ + ಎನ್‌ಪಿಕೆ',
'Dry pulse for mixed cropping.','ಮಿಶ್ರ ಬೆಳೆ ಒಣ ಬೇಳೆ.',
'Tropical','Light loam','8–10 kg/ha','30x10 cm','0.8–1 t/ha',
'ಉಷ್ಣ','ಲಘು ಮಣ್ಣು','8–10 ಕೆಜಿ/ಹೆ','30x10 ಸೆಂ','0.8–1 ಟನ್/ಹೆ'),

('gram','Chickpea (Bengal Gram)','ಕಡಲೆ','Rabi','ರಬೀ',120,'Medium','ಮಧ್ಯಮ','Oct–Nov','ಅಕ್ಟೋ–ನವೆಂ','Feb–Mar','ಫೆಬ್ರ–ಮಾರ್ಚ್',
'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,8.0,'Rhizobium + DAP','ರೈಜೋಬಿಯಮ್ + ಡಿಎಪಿ',
'Main pulse in central dry zones.','ಮಧ್ಯ ಒಣ ಪ್ರದೇಶದ ಮುಖ್ಯ ಬೇಳೆ.',
'Cool dry','Black cotton soil','80 kg/ha','30x10 cm','1–1.5 t/ha',
'ತಂಪು ಒಣ','ಕಪ್ಪು ಮಣ್ಣು','80 ಕೆಜಿ/ಹೆ','30x10 ಸೆಂ','1–1.5 ಟನ್/ಹೆ'),

('groundnut','Groundnut','ಕಡಲೆಕಾಯಿ','Kharif,Rabi','ಖರಿಫ್,ರಬೀ',115,'Medium','ಮಧ್ಯಮ',
'June–July','ಜೂನ್–ಜುಲೈ','Oct–Nov','ಅಕ್ಟೋ–ನವೆಂ',
'Rainfed/Irrigated','ಮಳೆಯಾಧಾರಿತ/ನೀರಾವರಿ',6.0,7.0,'Gypsum + NPK 15:15:15','ಜಿಪ್ಸಮ್ + ಎನ್‌ಪಿಕೆ 15:15:15',
'Oilseed legume requiring well-drained soil.','ನೀರು ಹರಿಯುವ ಮಣ್ಣಿಗೆ ಅನುಗುಣವಾದ ಎಣ್ಣೆ ಬೇಳೆ.',
'Warm','Sandy loam','100 kg/ha','30x10 cm','1.2–2 t/ha',
'ಬಿಸಿ','ಮರಳು ಲೋಮಿ','100 ಕೆಜಿ/ಹೆ','30x10 ಸೆಂ','1.2–2 ಟನ್/ಹೆ'),

('sunflower','Sunflower','ಸೂರ್ಯಮುಖಿ','Rabi','ರಬೀ',95,'Medium','ಮಧ್ಯಮ','Nov–Dec','ನವೆಂ–ಡಿಸೆಂ','Feb–Mar','ಫೆಬ್ರ–ಮಾರ್ಚ್',
'Irrigated','ನೀರಾವರಿ',6.0,7.5,'NPK 20:20:20 + Zn','ಎನ್‌ಪಿಕೆ 20:20:20 + ಜಿಂಕ್',
'Oilseed for dry zones with moderate water.','ಒಣ ಪ್ರದೇಶದಲ್ಲಿ ಮಿತ ನೀರಾವರಿ ಬೆಳೆ.',
'Cool dry','Loam','6–8 kg/ha','45x30 cm','1.2–1.5 t/ha',
'ತಂಪು ಒಣ','ಲೋಮಿ','6–8 ಕೆಜಿ/ಹೆ','45x30 ಸೆಂ','1.2–1.5 ಟನ್/ಹೆ'),

('cotton','Cotton','ಹತ್ತಿ','Kharif','ಖರಿಫ್',160,'Long','ದೀರ್ಘ','June–July','ಜೂನ್–ಜುಲೈ','Nov–Dec','ನವೆಂಬರ್–ಡಿಸೆಂ',
'Rainfed/Irrigated','ಮಳೆಯಾಧಾರಿತ/ನೀರಾವರಿ',6.0,8.0,'NPK + FYM','ಎನ್‌ಪಿಕೆ + ಎಫ್‌ವೈಎಂ',
'Cash crop for black soils of north Karnataka.','ಉತ್ತರ ಕರ್ನಾಟಕದ ಕಪ್ಪು ಮಣ್ಣಿನಲ್ಲಿ ಮುಖ್ಯ ಹಣ ಬೆಳೆ.',
'Warm dry','Black cotton soil','15–20 kg/ha','90x45 cm','1.5–2 t/ha',
'ಬಿಸಿ ಒಣ','ಕಪ್ಪು ಮಣ್ಣು','15–20 ಕೆಜಿ/ಹೆ','90x45 ಸೆಂ','1.5–2 ಟನ್/ಹೆ'),

('sugarcane','Sugarcane','ಕಬ್ಬು','Annual','ವಾರ್ಷಿಕ',330,'Very Long','ಬಹು ದೀರ್ಘ',
'Jan–Mar','ಜನ–ಮಾರ್ಚ್','Dec–Jan','ಡಿಸೆಂ–ಜನ',
'Irrigated','ನೀರಾವರಿ',6.0,7.5,'FYM + Urea + MOP','ಎಫ್‌ವೈಎಂ + ಯೂರಿಯಾ + ಎಂಒಪಿ',
'Commercial cash crop needing abundant water.','ಹಣ ಬೆಳೆ; ಹೆಚ್ಚು ನೀರಾವರಿ ಅಗತ್ಯ.',
'Tropical','Alluvial soil','75 000 setts/ha','90x60 cm','80–100 t/ha',
'ಉಷ್ಣ','ಆಲ್ಯುವಿಯಲ್ ಮಣ್ಣು','75 000 ನೆಟ್ಟು','90x60 ಸೆಂ','80–100 ಟನ್/ಹೆ'),

('banana','Banana','ಬಾಳೆ','Year Round','ವರ್ಷಪೂರ್ತಿ',330,'Very Long','ಬಹು ದೀರ್ಘ',
'Any time','ಯಾವ ಸಮಯದಲ್ಲಾದರೂ','After 11 months','11 ತಿಂಗಳ ನಂತರ',
'Irrigated','ನೀರಾವರಿ',5.5,7.5,'FYM + NPK + micronutrients','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ + ಸೂಕ್ಷ್ಮಾಂಶಗಳು',
'Commercial fruit requiring warm humid climate.','ಬಿಸಿ ತೇವಾಂಶ ಹವಾಮಾನದಲ್ಲಿ ಬೆಳೆಯುವ ಹಣ್ಣು ಬೆಳೆ.',
'Warm humid','Rich loam','1800 suckers/ha','1.8x1.5 m','40–50 t/ha',
'ಬಿಸಿ ತೇವಾಂಶ','ಸಮೃದ್ಧ ಮಣ್ಣು','1800 ನೆಟ್ಟು/ಹೆ','1.8x1.5 ಮೀ','40–50 ಟನ್/ಹೆ'),

('mango','Mango','ಮಾವಿನ ಹಣ್ಣು','Summer','ಬೇಸಿಗೆ',365,'Very Long','ಬಹು ದೀರ್ಘ',
'June–July','ಜೂನ್–ಜುಲೈ','Apr–May','ಏಪ್ರಿಲ್–ಮೇ',
'Rainfed/Irrigated','ಮಳೆಯಾಧಾರಿತ/ನೀರಾವರಿ',5.5,7.5,'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
'Tropical fruit tree requiring dry spell before flowering.','ಹೂ ಬರುವ ಮೊದಲು ಒಣ ಕಾಲ ಅಗತ್ಯ.',
'Tropical','Well-drained loam','1 sapling/10 m²','10x10 m','8–12 t/ha',
'ಉಷ್ಣ','ಲೋಮಿ ಮಣ್ಣು','1 ನೆಟ್ಟು/10 ಮೀ²','10x10 ಮೀ','8–12 ಟನ್/ಹೆ'),

('coffee','Coffee','ಕಾಫಿ','Perennial','ದೀರ್ಘಕಾಲಿಕ',730,'Very Long','ಬಹು ದೀರ್ಘ',
'June–July','ಜೂನ್–ಜುಲೈ','Dec–Mar','ಡಿಸೆಂ–ಮಾರ್ಚ್',
'Irrigated shade-grown','ನೀರಾವರಿ ನೇರಳೆ ನಡುವೆ',6.0,6.5,'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
'Plantation crop in hill zones (Western Ghats).','ಪರ್ವತ ಪ್ರದೇಶಗಳಲ್ಲಿ ಬೆಳೆಯುವ ಬೆಳೆ.',
'Cool humid','Loamy forest soil','5000 plants/ha','2x2 m','1–1.5 t/ha',
'ತಂಪು ತೇವ','ಅರಣ್ಯ ಲೋಮಿ ಮಣ್ಣು','5000 ನೆಟ್ಟು','2x2 ಮೀ','1–1.5 ಟನ್/ಹೆ'),

('coconut','Coconut','ತೆಂಗು','Perennial','ದೀರ್ಘಕಾಲಿಕ',3650,'Very Long','ಬಹು ದೀರ್ಘ',
'Any time','ಯಾವ ಸಮಯದಲ್ಲಾದರೂ','Throughout year','ಸಂಪೂರ್ಣ ವರ್ಷ',
'Irrigated','ನೀರಾವರಿ',5.0,8.0,'FYM + NPK + micronutrients','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ + ಸೂಕ್ಷ್ಮಾಂಶಗಳು',
'Tropical tree needing coastal humidity.','ಕರಾವಳಿ ತೇವಾಂಶದಲ್ಲಿ ಬೆಳೆಯುವ ಬೆಳೆ.',
'Tropical','Sandy loam','180 palms/ha','8x8 m','60–80 nuts/palm/year',
'ಉಷ್ಣ','ಮರಳು ಲೋಮಿ','180 ನೆಟ್ಟು','8x8 ಮೀ','60–80 ಕಾಯಿ/ಹೆ');

-- (Total: 20 entries shown; full dataset can be expanded to 50+ crops)

USE krishidisha;
INSERT INTO crops (
  slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
  sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
  irrigation, irrigationkn, soilphmin, soilphmax,
  fertilizerbaseline, fertilizerbaselinekn, info, infokn,
  cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
  cultivationguide_spacing, cultivationguide_yield,
  cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
  cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
('tomato','Tomato','ಟೊಮಾಟೊ','Rabi,Kharif','ರಬೀ,ಖರಿಫ್',110,'Medium','ಮಧ್ಯಮ',
'June–July, Oct–Nov','ಜೂನ್–ಜುಲೈ, ಅಕ್ಟೋ–ನವೆಂ','Sept–Dec, Feb–Apr','ಸೆಪ್ಟೆಂಬರ್–ಡಿಸೆಂ, ಫೆಬ್ರ–ಏಪ್ರಿಲ್',
'Irrigated','ನೀರಾವರಿ',6.0,7.5,'FYM + NPK + micronutrients','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ + ಸೂಕ್ಷ್ಮಾಂಶಗಳು',
'Vegetable crop suitable for red loam soils.','ಕೆಂಪು ಮಣ್ಣಿನಲ್ಲಿ ಬೆಳೆಯುವ ತರಕಾರಿ ಬೆಳೆ.',
'Warm moderate','Red loam','250 g/ha','60x45 cm','25–30 t/ha',
'ಬಿಸಿ ಮಧ್ಯಮ','ಕೆಂಪು ಮಣ್ಣು','250 ಗ್ರಾಂ/ಹೆ','60x45 ಸೆಂ','25–30 ಟನ್/ಹೆ'),

('brinjal','Brinjal (Eggplant)','ಬದನೆಕಾಯಿ','Rabi,Kharif','ರಬೀ,ಖರಿಫ್',130,'Medium','ಮಧ್ಯಮ',
'June–July','ಜೂನ್–ಜುಲೈ','Oct–Jan','ಅಕ್ಟೋ–ಜನ',
'Irrigated','ನೀರಾವರಿ',6.0,7.5,'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
'Long-bearing vegetable crop for warm climate.','ಬಿಸಿ ಹವಾಮಾನಕ್ಕೆ ಸೂಕ್ತ ತರಕಾರಿ.',
'Warm humid','Loam','350 g/ha','60x60 cm','30–35 t/ha',
'ಬಿಸಿ ತೇವ','ಲೋಮಿ','350 ಗ್ರಾಂ/ಹೆ','60x60 ಸೆಂ','30–35 ಟನ್/ಹೆ'),

('onion','Onion','ಈರುಳ್ಳಿ','Rabi,Kharif','ರಬೀ,ಖರಿಫ್',120,'Medium','ಮಧ್ಯಮ',
'Oct–Nov','ಅಕ್ಟೋ–ನವೆಂ','Feb–Mar','ಫೆಬ್ರ–ಮಾರ್ಚ್',
'Irrigated','ನೀರಾವರಿ',6.0,7.5,'NPK + FYM','ಎನ್‌ಪಿಕೆ + ಎಫ್‌ವೈಎಂ',
'Commercial spice crop requiring dry harvest period.','ಒಣ ಕಾಲದಲ್ಲಿ ಕೊಯ್ಲು ಅಗತ್ಯವಿರುವ ಮಸಾಲೆ ಬೆಳೆ.',
'Cool dry','Loamy sandy','10 kg/ha','15x10 cm','15–20 t/ha',
'ತಂಪು ಒಣ','ಲೋಮಿ ಮರಳು','10 ಕೆಜಿ/ಹೆ','15x10 ಸೆಂ','15–20 ಟನ್/ಹೆ'),

('chilli','Chilli','ಮೆಣಸಿನಕಾಯಿ','Kharif,Rabi','ಖರಿಫ್,ರಬೀ',150,'Long','ದೀರ್ಘ',
'June–July','ಜೂನ್–ಜುಲೈ','Dec–Jan','ಡಿಸೆಂ–ಜನ',
'Irrigated','ನೀರಾವರಿ',6.0,7.5,'NPK + FYM','ಎನ್‌ಪಿಕೆ + ಎಫ್‌ವೈಎಂ',
'Major spice crop used across Karnataka.','ಕರ್ನಾಟಕದ ಪ್ರಮುಖ ಮಸಾಲೆ ಬೆಳೆ.',
'Warm dry','Red loam','1 kg/ha (seeds)','45x45 cm','10–12 t/ha (green)',
'ಬಿಸಿ ಒಣ','ಕೆಂಪು ಮಣ್ಣು','1 ಕೆಜಿ/ಹೆ (ಬೀಜ)','45x45 ಸೆಂ','10–12 ಟನ್/ಹೆ'),

('potato','Potato','ಆಲೂಗಡ್ಡೆ','Rabi','ರಬೀ',100,'Medium','ಮಧ್ಯಮ',
'Oct–Nov','ಅಕ್ಟೋ–ನವೆಂ','Jan–Feb','ಜನ–ಫೆಬ್ರ',
'Irrigated','ನೀರಾವರಿ',5.0,6.5,'NPK 10:26:26 + MOP','ಎನ್‌ಪಿಕೆ 10:26:26 + ಎಂಒಪಿ',
'Tuber crop for cool elevated zones.','ತಂಪು ಪ್ರದೇಶದಲ್ಲಿ ಬೆಳೆಯುವ ಕುಂಬಳ ಬೆಳೆ.',
'Cool','Sandy loam','2000 kg tubers/ha','60x20 cm','20–25 t/ha',
'ತಂಪು','ಮರಳು ಲೋಮಿ','2000 ಕೆಜಿ ಕುಂಬಳ','60x20 ಸೆಂ','20–25 ಟನ್/ಹೆ'),

('cabbage','Cabbage','ಎಲೆಕೋಸು','Rabi','ರಬೀ',90,'Short','ಕಡಿಮೆ',
'Oct–Nov','ಅಕ್ಟೋ–ನವೆಂ','Jan–Feb','ಜನ–ಫೆಬ್ರ',
'Irrigated','ನೀರಾವರಿ',6.0,7.5,'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
'Leafy vegetable for cool climates.','ತಂಪು ಹವಾಮಾನ ತರಕಾರಿ.',
'Cool moist','Loamy soil','500 g/ha','45x45 cm','20–25 t/ha',
'ತಂಪು ತೇವ','ಲೋಮಿ','500 ಗ್ರಾಂ/ಹೆ','45x45 ಸೆಂ','20–25 ಟನ್/ಹೆ'),

('cauliflower','Cauliflower','ಹೂಕೋಸು','Rabi','ರಬೀ',100,'Medium','ಮಧ್ಯಮ',
'Oct–Nov','ಅಕ್ಟೋ–ನವೆಂ','Feb–Mar','ಫೆಬ್ರ–ಮಾರ್ಚ್',
'Irrigated','ನೀರಾವರಿ',6.0,7.5,'NPK 15:15:15','ಎನ್‌ಪಿಕೆ 15:15:15',
'Preferred vegetable in uplands.','ಮೇಲ್ವೇಳು ಪ್ರದೇಶಕ್ಕೆ ಸೂಕ್ತ ತರಕಾರಿ.',
'Cool moist','Loamy soil','500 g/ha','45x45 cm','20–25 t/ha',
'ತಂಪು ತೇವ','ಲೋಮಿ','500 ಗ್ರಾಂ/ಹೆ','45x45 ಸೆಂ','20–25 ಟನ್/ಹೆ'),

('carrot','Carrot','ಗಜ್ಜರಿ','Rabi','ರಬೀ',90,'Short','ಕಡಿಮೆ',
'Oct–Nov','ಅಕ್ಟೋ–ನವೆಂ','Jan–Feb','ಜನ–ಫೆಬ್ರ',
'Irrigated','ನೀರಾವರಿ',6.0,7.0,'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
'Root vegetable suitable for cool zones.','ತಂಪು ಪ್ರದೇಶದಲ್ಲಿ ಬೆಳೆಯುವ ಬೇರು ತರಕಾರಿ.',
'Cool moist','Sandy loam','3–4 kg/ha','30x10 cm','15–20 t/ha',
'ತಂಪು ತೇವ','ಮರಳು ಲೋಮಿ','3–4 ಕೆಜಿ/ಹೆ','30x10 ಸೆಂ','15–20 ಟನ್/ಹೆ'),

('turmeric','Turmeric','ಅರಿಶಿನ','Kharif','ಖರಿಫ್',240,'Long','ದೀರ್ಘ',
'May–June','ಮೇ–ಜೂನ್','Jan–Feb','ಜನ–ಫೆಬ್ರ',
'Irrigated','ನೀರಾವರಿ',5.5,7.5,'FYM + NPK + micronutrients','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ + ಸೂಕ್ಷ್ಮಾಂಶಗಳು',
'Rhizome crop used as spice.','ಮಸಾಲೆಯಾಗಿ ಬಳಸುವ ಬೇರು ಬೆಳೆ.',
'Warm humid','Loam','2000 kg rhizomes/ha','45x20 cm','20–25 t/ha',
'ಬಿಸಿ ತೇವ','ಲೋಮಿ','2000 ಕೆಜಿ/ಹೆ','45x20 ಸೆಂ','20–25 ಟನ್/ಹೆ'),

('ginger','Ginger','ಶುಂಠಿ','Kharif','ಖರಿಫ್',210,'Long','ದೀರ್ಘ',
'May–June','ಮೇ–ಜೂನ್','Jan–Feb','ಜನ–ಫೆಬ್ರ',
'Irrigated','ನೀರಾವರಿ',5.5,6.5,'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
'Popular spice in Western Ghats.','ಪಶ್ಚಿಮ ಘಟ್ಟದ ಮುಖ್ಯ ಮಸಾಲೆ ಬೆಳೆ.',
'Warm humid','Loamy soil','1500 kg rhizomes/ha','30x20 cm','15–20 t/ha',
'ಬಿಸಿ ತೇವ','ಲೋಮಿ','1500 ಕೆಜಿ/ಹೆ','30x20 ಸೆಂ','15–20 ಟನ್/ಹೆ'),

('arecanut','Arecanut','ಅಡಿಕೆ','Perennial','ದೀರ್ಘಕಾಲಿಕ',3650,'Very Long','ಬಹು ದೀರ್ಘ',
'May–June','ಮೇ–ಜೂನ್','Year-round','ವರ್ಷಪೂರ್ತಿ',
'Irrigated','ನೀರಾವರಿ',5.5,7.0,'FYM + NPK + micronutrients','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ + ಸೂಕ್ಷ್ಮಾಂಶಗಳು',
'Plantation crop of Malnad region.','ಮಲ್ನಾಡಿನ ಪ್ರಮುಖ ಬೆಳೆ.',
'Tropical humid','Laterite soil','175 palms/ha','8x8 m','2–3 t nuts/ha',
'ಉಷ್ಣ ತೇವ','ಲೇಟರೈಟ್','175 ನೆಟ್ಟು','8x8 ಮೀ','2–3 ಟನ್/ಹೆ'),

('cardamom','Cardamom','ಏಲಕ್ಕಿ','Perennial','ದೀರ್ಘಕಾಲಿಕ',3650,'Very Long','ಬಹು ದೀರ್ಘ',
'June–July','ಜೂನ್–ಜುಲೈ','Throughout year','ವರ್ಷಪೂರ್ತಿ',
'Irrigated','ನೀರಾವರಿ',5.0,6.5,'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
'Spice crop under shade, Western Ghats.','ನೆರಳಿನಡಿ ಬೆಳೆಯುವ ಮಸಾಲೆ ಬೆಳೆ.',
'Cool humid','Forest loam','1500 plants/ha','2x2 m','0.3–0.5 t/ha',
'ತಂಪು ತೇವ','ಅರಣ್ಯ ಲೋಮಿ','1500 ನೆಟ್ಟು','2x2 ಮೀ','0.3–0.5 ಟನ್/ಹೆ'),

('pepper','Black Pepper','ಕರಿಮೆಣಸು','Perennial','ದೀರ್ಘಕಾಲಿಕ',3650,'Very Long','ಬಹು ದೀರ್ಘ',
'June–July','ಜೂನ್–ಜುಲೈ','Dec–Mar','ಡಿಸೆಂ–ಮಾರ್ಚ್',
'Irrigated','ನೀರಾವರಿ',5.0,6.0,'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
'Vine spice requiring support trees.','ಬೆಂಬಲ ಮರಗಳ ಅಗತ್ಯವಿರುವ ಮಸಾಲೆ ಬೆಳೆ.',
'Cool humid','Forest loam','1500 vines/ha','2x2 m','0.5–1 t/ha',
'ತಂಪು ತೇವ','ಅರಣ್ಯ ಲೋಮಿ','1500 ನೆಟ್ಟು','2x2 ಮೀ','0.5–1 ಟನ್/ಹೆ'),

('grapes','Grapes','ದ್ರಾಕ್ಷಿ','Rabi','ರಬೀ',180,'Long','ದೀರ್ಘ',
'Dec–Jan','ಡಿಸೆಂ–ಜನ','Apr–May','ಏಪ್ರಿಲ್–ಮೇ',
'Irrigated','ನೀರಾವರಿ',6.0,7.5,'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
'Vine fruit crop for northern districts.','ಉತ್ತರ ಜಿಲ್ಲೆಗಳಲ್ಲಿ ಬೆಳೆಯುವ ಹಣ್ಣು.',
'Warm dry','Sandy loam','2500 cuttings/ha','3x2 m','20–25 t/ha',
'ಬಿಸಿ ಒಣ','ಮರಳು ಲೋಮಿ','2500 ನೆಟ್ಟು','3x2 ಮೀ','20–25 ಟನ್/ಹೆ'),

('pomegranate','Pomegranate','ದಾಳಿಂಬೆ','Rabi','ರಬೀ',210,'Long','ದೀರ್ಘ',
'Jan–Feb','ಜನ–ಫೆಬ್ರ','Aug–Sept','ಆಗಸ್ಟ್–ಸೆಪ್ಟೆಂ',
'Irrigated','ನೀರಾವರಿ',6.0,7.5,'FYM + NPK + micronutrients','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ + ಸೂಕ್ಷ್ಮಾಂಶಗಳು',
'Dry zone fruit needing limited rain.','ಒಣ ಪ್ರದೇಶದ ಹಣ್ಣು ಬೆಳೆ.',
'Warm dry','Red loam','500 plants/ha','5x4 m','8–10 t/ಹೆ',
'ಬಿಸಿ ಒಣ','ಕೆಂಪು ಮಣ್ಣು','500 ನೆಟ್ಟು','5x4 ಮೀ','8–10 ಟನ್/ಹೆ');

-- Drop the old fertilizers table if it exists
DROP TABLE IF EXISTS fertilizers;

-- Recreate the fertilizers table
CREATE TABLE fertilizers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    namekn VARCHAR(100),
    npk VARCHAR(50),
    use_info TEXT,
    usekn TEXT,
    when_info VARCHAR(100),
    whenkn VARCHAR(100),
    where_info VARCHAR(100),
    wherekn VARCHAR(100),
    notes TEXT,
    noteskn TEXT
);
INSERT INTO fertilizers (name, namekn, npk, use_info, usekn, when_info, whenkn, where_info, wherekn, notes, noteskn) VALUES
('Urea', 'ಯೂರಿಯಾ', '46-0-0', 'Primary nitrogen source; promotes leafy growth.', 'ಪ್ರಾಥಮಿಕ ನೈಟ್ರೋಜನ್ ಮೂಲ; ಎಲೆಗಳ ಬೆಳವಣಿಗೆಗೆ ಸಹಾಯ.', 'Basal and top dressing (split doses).', 'ಮೂಲ ಮತ್ತು ಮೇಲಿನ ಡ್ರೆಸ್ಸಿಂಗ್ (ವಿಭಜಿತ ಪ್ರಮಾಣ).', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Avoid standing water contact; mix into soil.', 'ನಿಲ್ಲುವ ನೀರಿನ ಸಂಪರ್ಕ ತಪ್ಪಿಸಿ; ಮಣ್ಣಿನಲ್ಲಿ ಸೇರಿಸಿ.'),
('DAP', 'ಡಿಎಪಿ', '18-46-0', 'Provides phosphorus for root development; some nitrogen.', 'ಬೆರಳುಗಳ ಬೆಳವಣಿಗೆಗೆ ಫಾಸ್ಫರಸ್; ಸ್ವಲ್ಪ ನೈಟ್ರೋಜನ್.', 'Apply at sowing/transplanting as basal.', 'ಬಿತ್ತನೆ/ಮರುನಾಟದ ಸಮಯದಲ್ಲಿ ಮೂಲ ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Do not mix directly with urea; maintain spacing.', 'ಯೂರಿಯಾ ಜೊತೆಗೆ ನೇರವಾಗಿ ಮಿಶ್ರಣ ಮಾಡಬೇಡಿ; ಅಂತರ ಕಾಯ್ದುಕೊಳ್ಳಿ.'),
('MOP (Muriate of Potash)', 'ಎಂಒಪಿ', '0-0-60', 'Potassium for disease resistance and grain filling.', 'ರೋಗ ನಿರೋಧಕತೆ ಮತ್ತು ಧಾನ್ಯ ತುಂಬುವಿಕೆಗೆ ಪೊಟಾಶಿಯಂ.', 'Basal or early growth stages.', 'ಮೂಲ ಅಥವಾ ಪ್ರಾರಂಭಿಕ ಬೆಳವಣಿಗೆ ಹಂತಗಳಲ್ಲಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Useful in sandy soils with low potassium.', 'ಕೆ ಕಡಿಮೆ ಇರುವ ಮರಳು ಮಣ್ಣಿನಲ್ಲಿ ಉಪಯುಕ್ತ.'),
('NPK Complex', 'ಎನ್‌ಪಿಕೆ ಕಾಂಪ್ಲೆಕ್ಸ್', '10-26-26', 'Balanced nutrients when soil test is unavailable.', 'ಮಣ್ಣು ಪರೀಕ್ಷೆ ಲಭ್ಯವಿಲ್ಲದಿದ್ದರೆ ಸಮತೋಲನ ಪೋಷಕಾಂಶ.', 'Basal; adjust based on crop stage.', 'ಮೂಲ; ಬೆಳೆ ಹಂತದ ಆಧಾರದ ಮೇಲೆ ಹೊಂದಿಸಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Choose grade based on crop requirement.', 'ಬೆಳೆ ಅಗತ್ಯದ ಆಧಾರದ ಮೇಲೆ ಗ್ರೇಡ್ ಆಯ್ಕೆಮಾಡಿ.'),
('FYM / Compost', 'ಎಫ್‌ವೈಎಂ / ಕಂಪೋಸ್ಟ್', 'Various', 'Improves soil structure and moisture retention.', 'ಮಣ್ಣಿನ ರಚನೆ ಮತ್ತು ತೇವಾಂಶ ಹಿಡಿದಿಡುವ ಸಾಮರ್ಥ್ಯ ಸುಧಾರಿಸುತ್ತದೆ.', 'Apply before sowing as basal.', 'ಬಿತ್ತನೆಗೂ ಮುನ್ನ ಮೂಲವಾಗಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Enhances microbial activity and long-term fertility.', 'ಜೈವಿಕ ಚಟುವಟಿಕೆ ಮತ್ತು ದೀರ್ಘಕಾಲಿಕ ಫಲವತ್ತತೆ ಹೆಚ್ಚಿಸುತ್ತದೆ.'),
('Neem Cake', 'ನೀಮ್ ಕೇಕ್', '-', 'Acts as organic fertilizer and pest repellent.', 'ಸಂವೇದನಶೀಲ ಪರ್ಯಾಯ ಮತ್ತು ಕೀಟನಾಶಕವಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ.', 'Basal application before sowing.', 'ಬಿತ್ತನೆಗೂ ಮುನ್ನ ಮೂಲ ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Helps in improving soil health.', 'ಮಣ್ಣಿನ ಆರೋಗ್ಯ ಸುಧಾರಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.'),
('Gypsum', 'ಜಿಪ್ಸಮ್', '0-0-0+Ca+S', 'Provides calcium and sulfur for soil amendment.', 'ಮಣ್ಣಿನ ಸುಧಾರಣೆಗೆ ಕ್ಯಾಲ್ಸಿಯಂ ಮತ್ತು ಸುಲ್ಫರ್ ಒದಗಿಸುತ್ತದೆ.', 'Apply during land preparation.', 'ಮಣ್ಣು ತಯಾರಿಕೆಯಲ್ಲಿ ಅನ್ವಯಿಸಿ.', 'Apply to acidic soils.', 'ಆಮ್ಲೀಯ ಮಣ್ಣಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Avoid overuse; can cause salinity issues.', 'ಹೆಚ್ಚು ಬಳಕೆಯಾದರೆ ಉಪ್ಪಿನ ಸಮಸ್ಯೆ ಉಂಟಾಗಬಹುದು.'),
('Bone Meal', 'ಅಸ್ಥಿ ಮೆಣಸು', '3-15-0', 'Slow-release phosphorus for root development.', 'ಮೂಲ ಬೆಳವಣಿಗೆಗೆ ನಿಧಾನ-ಮುಗಿಯುವ ಫಾಸ್ಫರಸ್.', 'At sowing or transplanting.', 'ಬಿತ್ತನೆ ಅಥವಾ ಮರುನಾಟದ ಸಮಯದಲ್ಲಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Good for flowering plants.', 'ಹೂವುಗಳ ಬೆಳೆಯುವಿಕೆಗೆ ಉತ್ತಮ.'),
('Potash', 'ಪೊಟಾಶ್', '0-0-60', 'Potassium supplement for fruiting and grain filling.', 'ಹಣ್ಣು ಮತ್ತು ಧಾನ್ಯ ತುಂಬುವಿಕೆಗೆ ಪೊಟಾಶಿಯಂ ಪೂರೈಕೆ.', 'Early and mid growth stages.', 'ಪ್ರಾರಂಭಿಕ ಮತ್ತು ಮಧ್ಯ ಹಂತಗಳಲ್ಲಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Avoid overdose; can affect soil pH.', 'ಅತಿಯಾದ ಬಳಕೆ ಮಣ್ಣು ಪಿಎಚ್ ಮೇಲೆ ಪರಿಣಾಮ ಬೀರುತ್ತದೆ.'),
('Magnesium Sulphate', 'ಮ್ಯಾಗ್ನಿಷಿಯಂ ಸಲ್ಫೇಟ್', '0-0-0+Mg+S', 'Supplies magnesium for chlorophyll and enzyme activity.', 'ಕ್ಲೋರೋಫಿಲ್ ಮತ್ತು ಎನ್ಜೈಮ್ ಚಟುವಟಿಕೆಗೆ ಮ್ಯಾಗ್ನಿಷಿಯಂ ಒದಗಿಸುತ್ತದೆ.', 'Basal or foliar application.', 'ಮೂಲ ಅಥವಾ ಫೋಲಿಯರ್ ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Helps correct magnesium deficiency.', 'ಮ್ಯಾಗ್ನಿಷಿಯಂ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.'),
('Sulphate of Potash', 'ಪೊಟಾಶ್ ಸಲ್ಫೇಟ್', '0-0-50', 'Potassium supplement with low chloride content.', 'ಕ್ಲೋರೈಡ್ ಕಡಿಮೆ ಪ್ರಮಾಣದ ಪೊಟಾಶಿಯಂ ಪೂರೈಕೆ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'Apply to fruit and vegetable crops.', 'ಹಣ್ಣು ಮತ್ತು ತರಕಾರಿ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Enhances quality and shelf life of fruits.', 'ಹಣ್ಣುಗಳ ಗುಣಮಟ್ಟ ಮತ್ತು ಶೆಲ್ಫ್ ಲೈಫ್ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Ammonium Sulphate', 'ಅಮೋನಿಯಮ್ ಸಲ್ಫೇಟ್', '21-0-0+S', 'Nitrogen source with sulfur.', 'ಸಲ್ಫರ್ ಜೊತೆಗೆ ನೈಟ್ರೋಜನ್ ಮೂಲ.', 'Split doses during crop growth.', 'ಬೆಳೆ ಬೆಳವಣಿಗೆಯಲ್ಲಿ ವಿಭಜಿತ ಪ್ರಮಾಣದಲ್ಲಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Avoid foliar burn.', 'ಫೋಲಿಯರ್ ಬರ್ನ್ ತಪ್ಪಿಸಿ.'),
('Kelp Extract', 'ಕೆಲ್ಪ ಎಕ್ಸ್ಟ್ರಾಕ್ಟ್', 'Varies', 'Stimulates growth and improves stress tolerance.', 'ಬೆಳೆ ಬೆಳವಣಿಗೆ ಉತ್ತೇಜನ ಮತ್ತು ಒತ್ತಡ ಸಹನಶೀಲತೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Foliar spray during vegetative stage.', 'ಎಲೆ ಹಂತದಲ್ಲಿ ಫೋಲಿಯರ್ ಸ್ಫ್ರೇ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Improves root growth and soil microbes.', 'ಮೂಲ ಬೆಳವಣಿಗೆ ಮತ್ತು ಮಣ್ಣಿನ ಸೂಕ್ಷ್ಮಜೀವಿಗಳನ್ನು ಸುಧಾರಿಸುತ್ತದೆ.'),
('Seaweed Powder', 'ಸೀಪಡ್ ಪೌಡರ್', 'Varies', 'Organic growth enhancer.', 'ಜೈವಿಕ ಬೆಳವಣಿಗೆ ಹೆಚ್ಚಿಸುವಿಕೆ.', 'Basal or foliar.', 'ಮೂಲ ಅಥವಾ ಫೋಲಿಯರ್.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Enhances yield and quality.', 'ಫಸಲು ಮತ್ತು ಗುಣಮಟ್ಟ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Vermicompost', 'ವರ್ಮಿಕಂಪೋಸ್ಟ್', 'Varies', 'Enhances soil fertility and structure.', 'ಮಣ್ಣಿನ ಫಲವತ್ತತೆ ಮತ್ತು ರಚನೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Before sowing.', 'ಬಿತ್ತನೆಗೂ ಮುನ್ನ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Improves water retention.', 'ನೀರು ಹಿಡಿದಿಡುವ ಸಾಮರ್ಥ್ಯ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Rock Phosphate', 'ರಾಕ್ ಫಾಸ್ಫೇಟ್', '0-30-0', 'Slow-release phosphorus for long-term fertility.', 'ದೀರ್ಘಕಾಲಿಕ ಫಲವತ್ತತೆಗೆ ನಿಧಾನ-ಮುಗಿಯುವ ಫಾಸ್ಫರಸ್.', 'Basal during land preparation.', 'ಮಣ್ಣು ತಯಾರಿಕೆಯ ಸಂದರ್ಭದಲ್ಲಿ ಮೂಲ.', 'Apply to acidic soils.', 'ಆಮ್ಲೀಯ ಮಣ್ಣಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Avoid excessive use; may lower pH.', 'ಹೆಚ್ಚು ಬಳಕೆ ಪಿಎಚ್ ಕಡಿಮೆ ಮಾಡಬಹುದು.'),
('Calcium Nitrate', 'ಕ್ಯಾಲ್ಸಿಯಂ ನೈಟ್ರೇಟ್', '15-0-0+Ca', 'Supplies calcium and nitrogen for vegetative growth.', 'ಎಲೆ ಬೆಳವಣಿಗೆಗೆ ಕ್ಯಾಲ್ಸಿಯಂ ಮತ್ತು ನೈಟ್ರೋಜನ್ ಒದಗಿಸುತ್ತದೆ.', 'Split doses during crop growth.', 'ಬೆಳೆ ಬೆಳವಣಿಗೆಯಲ್ಲಿ ವಿಭಜಿತ ಪ್ರಮಾಣದಲ್ಲಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Avoid leaf burn.', 'ಎಲೆ ಬರ್ನ್ ತಪ್ಪಿಸಿ.'),
('Magnesium Oxide', 'ಮ್ಯಾಗ್ನಿಷಿಯಂ ಆಕ್ಸೈಡ್', '0-0-0+Mg', 'Corrects magnesium deficiency.', 'ಮ್ಯಾಗ್ನಿಷಿಯಂ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Apply during soil prep or crop growth.', 'ಮಣ್ಣು ತಯಾರಿಕೆ ಅಥವಾ ಬೆಳವಣಿಗೆಯಲ್ಲಿ ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Supplement with foliar magnesium if needed.', 'ಅಗತ್ಯವಿದ್ದರೆ ಫೋಲಿಯರ್ ಮ್ಯಾಗ್ನಿಷಿಯಂ ಪೂರೈಕೆ.'),
('Iron Sulphate', 'ಐರನ್ ಸಲ್ಫೇಟ್', '0-0-0+Fe', 'Corrects iron deficiency in plants.', 'ಸಸ್ಯಗಳಲ್ಲಿ ಲೋಹ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Basal application or foliar spray.', 'ಮೂಲ ಅನ್ವಯ ಅಥವಾ ಫೋಲಿಯರ್ ಸ್ಫ್ರೇ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Avoid overuse; can cause soil acidity.', 'ಹೆಚ್ಚು ಬಳಕೆ ಮಣ್ಣಿನ ಆಮ್ಲೀಯತೆಯನ್ನು ಹೆಚ್ಚಿಸುತ್ತದೆ.'),
('Zinc Sulphate', 'ಜಿಂಕ್ ಸಲ್ಫೇಟ್', '0-0-0+Zn', 'Corrects zinc deficiency.', 'ಜಿಂಕ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Basal or foliar application.', 'ಮೂಲ ಅಥವಾ ಫೋಲಿಯರ್ ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Enhances flowering and yield.', 'ಹೂವು ಮತ್ತು ಉತ್ಪಾದನೆ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Copper Sulphate', 'ಕಾಪರ್ ಸಲ್ಫೇಟ್', '0-0-0+Cu', 'Corrects copper deficiency.', 'ಕಾಪರ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Basal or foliar application.', 'ಮೂಲ ಅಥವಾ ಫೋಲಿಯರ್ ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Prevents leaf spots.', 'ಎಲೆ ದಪ್ಪಣೆಯನ್ನು ತಡೆಯುತ್ತದೆ.'),
('Manganese Sulphate', 'ಮ್ಯಾಂಗನೀಸ್ ಸಲ್ಫೇಟ್', '0-0-0+Mn', 'Corrects manganese deficiency.', 'ಮ್ಯಾಂಗನೀಸ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Basal or foliar application.', 'ಮೂಲ ಅಥವಾ ಫೋಲಿಯರ್ ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Improves chlorophyll content.', 'ಕ್ಲೋರೋಫಿಲ್ ಪ್ರಮಾಣ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Boron', 'ಬೋರೆನ್', '0-0-0+B', 'Corrects boron deficiency, important for flowering.', 'ಬೋರೆನ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ, ಹೂವುಗಾಗಿ ಮುಖ್ಯ.', 'Foliar spray during flowering.', 'ಹೂವು ಹಂತದಲ್ಲಿ ಫೋಲಿಯರ್ ಸ್ಫ್ರೇ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Do not overdose; toxic in high amount.', 'ಹೆಚ್ಚು ಬಳಕೆ ವಿಷಕಾರಿ.'),
('Molybdenum', 'ಮೋಲಿಬ್ಡೆನಮ್', '0-0-0+Mo', 'Corrects molybdenum deficiency.', 'ಮೋಲಿಬ್ಡೆನಮ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Basal or foliar.', 'ಮೂಲ ಅಥವಾ ಫೋಲಿಯರ್.', 'Apply to legumes primarily.', 'ಮುಖ್ಯವಾಗಿ ಕುರುವಕಾಳಿಗೆ ಅನ್ವಯ.', 'Essential for nitrogen fixation.', 'ನೈಟ್ರೋಜನ್ ಫಿಕ್ಸೇಶನ್‌ಗೆ ಅವಶ್ಯಕ.'),
('Magnesium Nitrate', 'ಮ್ಯಾಗ್ನಿಷಿಯಂ ನೈಟ್ರೇಟ್', '10-0-0+Mg', 'Nitrogen and magnesium source.', 'ನೈಟ್ರೋಜನ್ ಮತ್ತು ಮ್ಯಾಗ್ನಿಷಿಯಂ ಪೂರೈಕೆ.', 'Split doses during crop growth.', 'ಬೆಳೆ ಬೆಳವಣಿಗೆಯಲ್ಲಿ ವಿಭಜಿತ ಪ್ರಮಾಣದಲ್ಲಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Avoid foliar burn.', 'ಫೋಲಿಯರ್ ಬರ್ನ್ ತಪ್ಪಿಸಿ.');

USE krishidisha;

INSERT INTO fertilizers 
(name, namekn, npk, use_info, usekn, when_info, whenkn, where_info, wherekn, notes, noteskn) VALUES
('Gypsum', 'ಜಿಪ್ಸಮ್', '0-0-0+Ca+S', 'Supplies calcium and sulfur.', 'ಕ್ಯಾಲ್ಸಿಯಂ ಮತ್ತು ಸಲ್ಫರ್ ಪೂರೈಕೆ.', 'During soil prep or early growth.', 'ಮಣ್ಣು ತಯಾರಿಕೆ ಅಥವಾ ಬೆಳಗಿನ ಹಂತ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Improves soil structure.', 'ಮಣ್ಣು ರಚನೆ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Boron', 'ಬೋರಾನ್', '0-0-0+B', 'Micronutrient for fruit set and grain formation.', 'ಹಣ್ಣು ಹಂತ ಮತ್ತು ಧಾನ್ಯ ರೂಪಾಂತರಕ್ಕೆ ಮೈಕ್ರೋ ಪೋಷಕಾಂಶ.', 'Foliar spray or soil application.', 'ಎಲೆ ಅಥವಾ ಮಣ್ಣಿನಲ್ಲಿ ಅನ್ವಯ.', 'Apply to boron-deficient crops.', 'ಬೋರಾನ್ ಕೊರತೆ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Excess can be toxic.', 'ಅತಿಯಾದ ಪ್ರಮಾಣ ವಿಷಕಾರಕ.'),
('Zinc Sulphate', 'ಜಿಂಕ್ ಸಲ್ಫೇಟ್', '0-0-0+Zn', 'Corrects zinc deficiency.', 'ಜಿಂಕ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Soil or foliar application.', 'ಮಣ್ಣು ಅಥವಾ ಎಲೆ ಸ್ಫ್ರೇ.', 'Apply to zinc-deficient crops.', 'ಜಿಂಕ್ ಕೊರತೆ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Enhances chlorophyll formation.', 'ಕ್ಲೋರೋಫಿಲ್ ರಚನೆ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Copper Sulphate', 'ಕಾಪರ್ ಸಲ್ಫೇಟ್', '0-0-0+Cu', 'Corrects copper deficiency.', 'ಕಾಪರ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Soil or foliar application.', 'ಮಣ್ಣು ಅಥವಾ ಎಲೆ ಸ್ಫ್ರೇ.', 'Apply to copper-deficient crops.', 'ಕಾಪರ್ ಕೊರತೆ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Essential for enzyme activity.', 'ಎನ್ಜೈಮ್ ಚಟುವಟಿಕೆ ಅಗತ್ಯ.'),
('Manganese Sulphate', 'ಮ್ಯಾಂಗನೇಸ್ ಸಲ್ಫೇಟ್', '0-0-0+Mn', 'Corrects manganese deficiency.', 'ಮ್ಯಾಂಗನೇಸ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Soil or foliar application.', 'ಮಣ್ಣು ಅಥವಾ ಎಲೆ ಸ್ಫ್ರೇ.', 'Apply to manganese-deficient crops.', 'ಮ್ಯಾಂಗನೇಸ್ ಕೊರತೆ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Supports photosynthesis.', 'ಫೋಟೋಸಿಂಥೆಸಿಸ್ ಅನ್ನು ಬೆಂಬಲಿಸುತ್ತದೆ.'),
('Iron Chelate', 'ಐರನ್ ಚೀಲೆಟ್', '0-0-0+Fe', 'Corrects iron deficiency.', 'ಐರನ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Foliar spray or soil drench.', 'ಎಲೆ ಸ್ಫ್ರೇ ಅಥವಾ ಮಣ್ಣಿನಲ್ಲಿ.', 'Apply to iron-deficient crops.', 'ಐರನ್ ಕೊರತೆ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Prevents chlorosis.', 'ಕ್ಲೋರೋಸಿಸ್ ತಪ್ಪಿಸುತ್ತದೆ.'),
('Magnesium Sulphate', 'ಮ್ಯಾಗ್ನೇಶಿಯಂ ಸಲ್ಫೇಟ್', '0-0-0+Mg', 'Provides magnesium for photosynthesis.', 'ಫೋಟೋಸಿಂಥೆಸಿಸ್ಗೆ ಮ್ಯಾಗ್ನೇಶಿಯಂ ಪೂರೈಕೆ.', 'Soil application or foliar spray.', 'ಮಣ್ಣು ಅಥವಾ ಎಲೆ ಸ್ಫ್ರೇ.', 'Apply to magnesium-deficient soils.', 'ಮ್ಯಾಗ್ನೇಶಿಯಂ ಕೊರತೆಯ ಮಣ್ಣಿಗೆ ಅನ್ವಯ.', 'Enhances leaf greenness.', 'ಎಲೆ ಹಸಿತನ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Molybdenum', 'ಮೊಲಿಬ್ಡೆನಮ್', '0-0-0+Mo', 'Essential for nitrogen fixation.', 'ನೈಟ್ರೋಜನ್ ಫಿಕ್ಸೇಶನ್‌ಗೆ ಅಗತ್ಯ.', 'Seed treatment or foliar spray.', 'ಬಿತ್ತನೆ/ಎಲೆ ಸ್ಫ್ರೇ.', 'Apply to leguminous crops.', 'ಕಾಳುಮಿಳಿ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Excess may be toxic.', 'ಅತಿಯಾದ ಪ್ರಮಾಣ ವಿಷಕಾರಕ.'),
('Neem Cake', 'ನೀಮ್ ಕೇಕ್', '-', 'Organic pest control and soil amendment.', 'ಜೈವಿಕ ಕೀಟನಾಶಕ ಮತ್ತು ಮಣ್ಣು ಸುಧಾರಣೆ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Improves soil fertility.', 'ಮಣ್ಣು ಫಲವತ್ತೆ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Vermicompost', 'ವರ್ಮಿಕಾಂಪೋಸ್ಟ್', '-', 'Improves soil structure and microbial activity.', 'ಮಣ್ಣು ರಚನೆ ಮತ್ತು ಜೈವಿಕ ಚಟುವಟಿಕೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Basal application before sowing.', 'ಬಿತ್ತನೆಗೂ ಮುನ್ನ ಮೂಲ ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Enhances nutrient availability.', 'ಪೋಷಕಾಂಶ ಲಭ್ಯತೆ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Cow Dung Compost', 'ಹಸುವಿನ ತೇಳು/ಕಂಪೋಸ್ಟ್', '-', 'Organic fertilizer improving soil fertility.', 'ಮಣ್ಣು ಫಲವತ್ತೆ ಸುಧಾರಿಸುವ ಜೈವಿಕ ખાતು.', 'Before sowing.', 'ಬಿತ್ತನೆಗೂ ಮುನ್ನ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Boosts microbial activity.', 'ಜೈವಿಕ ಚಟುವಟಿಕೆ ಹೆಚ್ಚಿಸುತ್ತದೆ.'),
('Chicken Manure', 'ಕೋಳಿ ತೇಳು', '-', 'Rich in nitrogen.', 'ನೈಟ್ರೋಜನ್ ಸಮೃದ್ಧ.', 'Before planting or as basal.', 'ಬಿತ್ತನೆ/ಮೂಲ ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Do not overuse.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Biofertilizer Rhizobium', 'ಜೈವಿಕ ಖಾತು ರಿಜೋಬಿಯಮ್', '-', 'Nitrogen-fixing bacteria for legumes.', 'ಕಾಳುಮಿಳಿಗೆ ನೈಟ್ರೋಜನ್ ಪೂರೈಕೆ.', 'Seed treatment.', 'ಬಿತ್ತನೆ ಪ್ರಕ್ರಿಯೆ.', 'Apply to legume crops.', 'ಕಾಳುಮಿಳಿಗೆ ಅನ್ವಯ.', 'Enhances nodulation.', 'ನೋಡುಲೇಶನ್ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Biofertilizer Azospirillum', 'ಜೈವಿಕ ಖಾತು ಅಝೋಸ್ಪಿರಿಲ್ಲಮ್', '-', 'Nitrogen-fixer for cereals.', 'ಧಾನ್ಯಗಳಿಗೆ ನೈಟ್ರೋಜನ್ ಪೂರೈಕೆ.', 'Seed treatment or soil inoculation.', 'ಬಿತ್ತನೆ/ಮಣ್ಣು inoculate.', 'Apply to cereal crops.', 'ಧಾನ್ಯ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Promotes root growth.', 'ಮೂಲೆ ಬೆಳವಣಿಗೆಗೆ ಉತ್ತೇಜನ.'),
('Biofertilizer Phosphate Solubilizing Bacteria', 'ಜೈವಿಕ ಖಾತು ಫಾಸ್ಫೇಟ್ ಸೂಲ್ಬಿಲೈಸಿಂಗ್ ಬ್ಯಾಕ್ಟೀರಿಯಾ', '-', 'Makes phosphorus available to plants.', 'ಮಣ್ಣು ಫಾಸ್ಫರಸ್ ಲಭ್ಯತೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Soil application.', 'ಮಣ್ಣು ಅನ್ವಯ.', 'Apply to phosphorus-deficient soils.', 'ಫಾಸ್ಫರಸ್ ಕೊರತೆ ಮಣ್ಣಿಗೆ ಅನ್ವಯ.', 'Improves yield.', 'ಉತ್ಪಾದನೆ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Azotobacter', 'ಅಝೋಟೋಬ್ಯಾಕ್ಟರ್', '-', 'Free-living nitrogen-fixing bacteria.', 'ಸ್ವತಂತ್ರ ನೈಟ್ರೋಜನ್ ಫಿಕ್ಸರ್ ಬ್ಯಾಕ್ಟೀರಿಯಾ.', 'Soil inoculation.', 'ಮಣ್ಣು inoculate.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Enhances soil fertility.', 'ಮಣ್ಣು ಫಲವತ್ತೆ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Phosphobacteria', 'ಫಾಸ್ಫೋಬ್ಯಾಕ್ಟೀರಿಯಾ', '-', 'Solubilizes phosphate for plant uptake.', 'ಬೆಳೆ ಫಾಸ್ಫರಸ್ ಲಭ್ಯತೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Soil application.', 'ಮಣ್ಣು ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Boosts phosphorus availability.', 'ಫಾಸ್ಫರಸ್ ಲಭ್ಯತೆ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Compost Tea', 'ಕಂಪೋಸ್ಟ್ ಟೀ', '-', 'Liquid extract enhancing microbial activity.', 'ಜೈವಿಕ ಚಟುವಟಿಕೆ ಸುಧಾರಿಸುವ ದ್ರಾವಣ.', 'Foliar spray.', 'ಎಲೆ ಸ್ಫ್ರೇ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Improves nutrient uptake.', 'ಪೋಷಕಾಂಶ ಶೋಷಣೆ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Humic Acid', 'ಹ್ಯೂಮಿಕ್ ಆಸಿಡ್', '-', 'Improves soil structure and nutrient uptake.', 'ಮಣ್ಣು ರಚನೆ ಮತ್ತು ಪೋಷಕಾಂಶ ಶೋಷಣೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Soil application.', 'ಮಣ್ಣು ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Enhances root growth.', 'ಮೂಲೆ ಬೆಳವಣಿಗೆಗೆ ಉತ್ತೇಜನ.'),
('Fulvic Acid', 'ಫುಲ್ವಿಕ್ ಆಸಿಡ್', '-', 'Stimulates nutrient uptake.', 'ಪೋಷಕಾಂಶ ಶೋಷಣೆ ಉತ್ತೇಜಿಸುತ್ತದೆ.', 'Foliar or soil application.', 'ಎಲೆ ಅಥವಾ ಮಣ್ಣು ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Supports overall plant health.', 'ಬೆಳೆ ಆರೋಗ್ಯ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Seaweed Powder', 'ಸೀಪಡ್ ಪುಡಿ', '-', 'Enhances growth and stress tolerance.', 'ಬೆಳೆ ಬೆಳವಣಿಗೆ ಮತ್ತು ಒತ್ತಡ ತಾಳುವಿಕೆಗೆ ಉತ್ತೇಜನ.', 'Soil or foliar application.', 'ಮಣ್ಣು ಅಥವಾ ಎಲೆ ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Improves flowering and fruiting.', 'ಹೂವು ಮತ್ತು ಹಣ್ಣು ಬೆಳೆ ಸುಧಾರಿಸುತ್ತದೆ.'),
('Azadirachtin', 'ಅಝದಿರಕ್ತಿನ್', '-', 'Neem-based biopesticide.', 'ನೀಮ್ ಆಧಾರಿತ ಕೀಟನಾಶಕ.', 'Foliar spray.', 'ಎಲೆ ಸ್ಫ್ರೇ.', 'Apply to pest-prone crops.', 'ಕೀಟನಾಶಕ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Non-toxic to humans.', 'ಮಾನವರಿಗೆ ವಿಷಕಾರಕವಲ್ಲ.'),
('Bacillus Thuringiensis', 'ಬ್ಯಾಸಿಲಸ್ ಥುರಿಂಜಿಯನ್ಸಿಸ್', '-', 'Biological insecticide for caterpillars.', 'ಕ್ಯಾಟರ್ಪಿಲರ್‌ಗಳಿಗೆ ಜೈವಿಕ ಕೀಟನಾಶಕ.', 'Foliar spray.', 'ಎಲೆ ಸ್ಫ್ರೇ.', 'Apply to susceptible crops.', 'ಸಂವೇದನಶೀಲ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Safe for beneficial insects.', 'ಉಪಯುಕ್ತ ಕೀಟಗಳಿಗೆ ಸುರಕ್ಷಿತ.'),
('Trichoderma', 'ಟ್ರೈಕೊಡರ್ಮಾ', '-', 'Fungal biofungicide.', 'ಜೈವಿಕ ಫಂಗಿಸೈಡ್.', 'Soil or seed treatment.', 'ಮಣ್ಣು ಅಥವಾ ಬಿತ್ತನೆ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Controls root rot.', 'ಮೂಲ ರೋಟ್ ನಿಯಂತ್ರಿಸುತ್ತದೆ.'),
('Pseudomonas Fluorescens', 'ಪ್ಸುಡೋಮೊನಾಸ್ ಫ್ಲೋರೆಸೆನ್ಸ್', '-', 'Bacterial biofungicide.', 'ಬ್ಯಾಕ್ಟೀರಿಯಲ್ ಜೈವಿಕ ಫಂಗಿಸೈಡ್.', 'Soil application.', 'ಮಣ್ಣು ಅನ್ವಯ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯಿಸಬಹುದು.', 'Enhances disease resistance.', 'ರೋಗ ಪ್ರತಿರೋಧ ಶಕ್ತಿ ಸುಧಾರಿಸುತ್ತದೆ.');

INSERT INTO crops (
    slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
    sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
    irrigation, irrigationkn, soilphmin, soilphmax,
    fertilizerbaseline, fertilizerbaselinekn, info, infokn,
    cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
    cultivationguide_spacing, cultivationguide_yield,
    cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
    cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
('chickpea', 'Chickpea', 'ಕಬಳಿ ಬೇಳೆ', 'Rabi', 'ರಬೀ', 100, 'Medium', 'ಮಧ್ಯಮ',
 'Nov–Dec', 'ನವೆಂಬರ್–ಡಿಸೆಂಬರ್', 'Mar–Apr', 'ಮಾರ್ಚ್–ಏಪ್ರಿಲ್',
 'Rainfed / light irrigation', 'ಮಳೆಯಾಧಾರಿತ / ಲಘು ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 20:20:0', 'ಎನ್‌ಪಿಕೆ 20:20:0', 'Good source of protein; prefers cool climate.', 'ಪ್ರೋಟೀನ್ ಸಮೃದ್ಧ; ತಂಪಾದ ಹವಾಮಾನವನ್ನು ಇಷ್ಟಪಡುತ್ತದೆ.',
 'Cool season', 'Loamy soil', '80–100 kg/ha', '30x10 cm', '1–2 t/ha',
 'ತಂಪು ಹವಾಮಾನ', 'ಲೋಮಿ ಮಣ್ಣು', '80–100 ಕೆಜಿ/ಹೆ', '30x10 ಸೆಂ', '1–2 ಟನ್/ಹೆ'),

('cowpea', 'Cowpea', 'ಹೋಳಿ ಬೇಳೆ', 'Kharif', 'ಖರಿಫ್', 90, 'Short', 'ಸಣ್ಣ',
 'June–July', 'ಜೂನ್–ಜುಲೈ', 'Sept–Oct', 'ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Rainfed', 'ಮಳೆಯಾಧಾರಿತ', 6.0, 7.5,
 'NPK 15:15:15', 'ಎನ್‌ಪಿಕೆ 15:15:15', 'Drought tolerant; enriches soil with nitrogen.', 'ಬಿಸಿಲಿಗೆ ತಾಳುವ ಶಕ್ತಿ; ಮಣ್ಣಿನಲ್ಲಿ ನೈಟ್ರೋಜನ್ ಹೆಚ್ಚಿಸುತ್ತದೆ.',
 'Warm rainy', 'Sandy loam', '20–25 kg/ha', '30x15 cm', '1–1.5 t/ha',
 'ಬಿಸಿ ಮಳೆಗಾಲ', 'ಮರಳು ಲೋಮಿ', '20–25 ಕೆಜಿ/ಹೆ', '30x15 ಸೆಂ', '1–1.5 ಟನ್/ಹೆ'),

('greengram', 'Green Gram', 'ಹುರಿದ ಕಡಲೆ', 'Kharif', 'ಖರಿಫ್', 70, 'Short', 'ಸಣ್ಣ',
 'June–July', 'ಜೂನ್–ಜುಲೈ', 'Aug–Sept', 'ಆಗಸ್ಟ್–ಸೆಪ್ಟೆಂಬರ್',
 'Rainfed', 'ಮಳೆಯಾಧಾರಿತ', 6.0, 7.5,
 'NPK 10:20:10', 'ಎನ್‌ಪಿಕೆ 10:20:10', 'Quick growing pulse; improves soil fertility.', 'ವೇಗವಾಗಿ ಬೆಳೆಯುವ ಪಲ್ಸ್; ಮಣ್ಣಿನ ಫಲವತ್ತೆ ಹೆಚ್ಚಿಸುತ್ತದೆ.',
 'Warm rainy', 'Loamy soil', '20–30 kg/ha', '25x10 cm', '0.8–1.2 t/ha',
 'ಬಿಸಿ ಮಳೆಗಾಲ', 'ಲೋಮಿ ಮಣ್ಣು', '20–30 ಕೆಜಿ/ಹೆ', '25x10 ಸೆಂ', '0.8–1.2 ಟನ್/ಹೆ'),

('blackgram', 'Black Gram', 'ಉಳಿಬೇಳೆ', 'Kharif', 'ಖರಿಫ್', 80, 'Short', 'ಸಣ್ಣ',
 'June–July', 'ಜೂನ್–ಜುಲೈ', 'Aug–Sept', 'ಆಗಸ್ಟ್–ಸೆಪ್ಟೆಂಬರ್',
 'Rainfed', 'ಮಳೆಯಾಧಾರಿತ', 6.0, 7.5,
 'NPK 10:20:10', 'ಎನ್‌ಪಿಕೆ 10:20:10', 'Fast maturing pulse; nitrogen fixer.', 'ವೇಗವಾಗಿ ಬೆಳೆಯುವ ಪಲ್ಸ್; ನೈಟ್ರೋಜನ್ ಫಿಕ್ಸರ್.',
 'Warm rainy', 'Loamy soil', '25–30 kg/ha', '25x10 cm', '1–1.5 t/ha',
 'ಬಿಸಿ ಮಳೆಗಾಲ', 'ಲೋಮಿ ಮಣ್ಣು', '25–30 ಕೆಜಿ/ಹೆ', '25x10 ಸೆಂ', '1–1.5 ಟನ್/ಹೆ'),

('soybean', 'Soybean', 'ಸಾಯ್ ಬೀನ', 'Kharif', 'ಖರಿಫ್', 100, 'Medium', 'ಮಧ್ಯಮ',
 'June–July', 'ಜೂನ್–ಜುಲೈ', 'Oct–Nov', 'ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್',
 'Rainfed / light irrigation', 'ಮಳೆಯಾಧಾರಿತ / ಲಘು ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 20:20:0', 'ಎನ್‌ಪಿಕೆ 20:20:0', 'Protein-rich legume; suitable for rotation.', 'ಪ್ರೋಟೀನ್ ಸಮೃದ್ಧ ಧಾನ್ಯ; ಮಣ್ಣು ಉತ್ತಮ.', 
 'Warm rainy', 'Loamy soil', '50–60 kg/ha', '30x15 cm', '1.5–2 t/ha',
 'ಬಿಸಿ ಮಳೆಗಾಲ', 'ಲೋಮಿ ಮಣ್ಣು', '50–60 ಕೆಜಿ/ಹೆ', '30x15 ಸೆಂ', '1.5–2 ಟನ್/ಹೆ');

INSERT INTO fertilizers (name, namekn, npk, use_info, usekn, when_info, whenkn, where_info, wherekn, notes, noteskn) VALUES
('Zinc Sulphate', 'ಜಿಂಕ್ ಸಲ್ಪೇಟ್', '0-0-0+Zn', 'Corrects zinc deficiency.', 'ಜಿಂಕ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'During early growth.', 'ಪ್ರಾರಂಭ ಹಂತದಲ್ಲಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Avoid overdose.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Boron', 'ಬೋರಾನ್', '0-0-0+B', 'Boron supplement for fruit set.', 'ಹಣ್ಣು ಉತ್ಫಲಕ್ಕಾಗಿ ಬೋರಾನ್ ಪೂರೈಕೆ.', 'During flowering.', 'ಹೂವು ಹಂತದಲ್ಲಿ.', 'Apply to soil or foliar.', 'ಮಣ್ಣು ಅಥವಾ ಎಲೆ ಮೇಲ್ಭಾಗಕ್ಕೆ ಅನ್ವಯ.', 'Toxic in excess.', 'ಅತಿಯಾದ ಪ್ರಮಾಣ ಹಾನಿಕಾರಕ.'),
('Manganese Sulphate', 'ಮ್ಯಾಂಗನೀಸ್ ಸಲ್ಪೇಟ್', '0-0-0+Mn', 'Corrects manganese deficiency.', 'ಮ್ಯಾಂಗನೀಸ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Early growth stages.', 'ಆರಂಭ ಹಂತದಲ್ಲಿ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ.', 'Use as per soil test.', 'ಮಣ್ಣು ಪರೀಕ್ಷೆ ಆಧಾರಿತ ಬಳಕೆ.'),
('Copper Sulphate', 'ಕಾಪರ್ ಸಲ್ಪೇಟ್', '0-0-0+Cu', 'Corrects copper deficiency.', 'ಕಾಪರ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Early growth stages.', 'ಆರಂಭ ಹಂತದಲ್ಲಿ.', 'Apply to soil or foliar.', 'ಮಣ್ಣು ಅಥವಾ ಎಲೆ ಮೇಲ್ಭಾಗಕ್ಕೆ ಅನ್ವಯ.', 'Avoid overuse.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Magnesium Sulphate', 'ಮ್ಯಾಗ್ನೀಷಿಯಂ ಸಲ್ಪೇಟ್', '0-0-0+Mg', 'Corrects magnesium deficiency.', 'ಮ್ಯಾಗ್ನೀಷಿಯಂ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Early growth stages.', 'ಆರಂಭ ಹಂತದಲ್ಲಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Do not mix with phosphates.', 'ಫಾಸ್ಫೇಟ್ಗಳೊಂದಿಗೆ ಮಿಶ್ರಣ ಮಾಡಬೇಡಿ.'),
('Iron Chelate', 'ಐರನ್ ಚೀಲೆಟ್', '0-0-0+Fe', 'Corrects iron deficiency.', 'ಐರನ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Foliar spray.', 'ಎಲೆ ಮೇಲೆ ಸಿಂಪಡಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Sensitive to pH.', 'pH ಸಂವೇದನಶೀಲ.'),
('Molybdenum', 'ಮೊಲಿಬ್ಡಿನಮ್', '0-0-0+Mo', 'Essential micronutrient for legumes.', 'ಬೇಳೆಗಳಿಗೆ ಮುಖ್ಯ ಲಘುಪೋಷಕ.', 'Seed treatment or foliar.', 'ಬೀಜ ಚಿಕಿತ್ಸೆ ಅಥವಾ ಎಲೆ ಮೇಲ್ಭಾಗ.', 'Legumes only.', 'ಬೇಳೆಗಳಿಗೆ ಮಾತ್ರ.', 'Use in very small quantity.', 'ಚಿಕ್ಕ ಪ್ರಮಾಣದಲ್ಲಿ ಬಳಸಿ.'),
('Gypsum', 'ಜಿಪ್ಸಂ', '0-0-0+Ca', 'Corrects calcium deficiency and improves soil structure.', 'ಕ್ಯಾಲ್ಸಿಯಂ ಕೊರತೆ ಸರಿಪಡಿಸುತ್ತದೆ ಮತ್ತು ಮಣ್ಣು ರಚನೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops, especially alkaline soils.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ, ವಿಶೇಷವಾಗಿ ಅಲ್ಕಲೈನ್ ಮಣ್ಣು.', 'Do not overapply.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Neem Cake', 'ನೀಮ್ ಕೇಕ್', 'NPK varies', 'Organic fertilizer; pest repellent.', 'ಸಸ್ಯಹಾರ ಮತ್ತು ಹಾನಿಕರ ಕೀಟನಾಶಕ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Use as per crop requirement.', 'ಬೆಳೆ ಅವಶ್ಯಕತೆ ಆಧಾರಿತ ಬಳಸಿ.'),
('Vermicompost', 'ವರ್ಮಿಕಾಂಪೋಸ್ಟ್', 'NPK varies', 'Organic fertilizer improving soil health.', 'ಮಣ್ಣು ಆರೋಗ್ಯ ಸುಧಾರಿಸುತ್ತದೆ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Use sufficient quantity.', 'ಪ್ರಮಾಣಿತ ಪ್ರಮಾಣ ಬಳಸಿ.'),
('Compost', 'ಕಾಂಪೋಸ್ಟ್', 'NPK varies', 'Organic matter for soil enrichment.', 'ಮಣ್ಣು ಫಲವತ್ತೆಗೆ ಜೈವಿಕ ಪದಾರ್ಥ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Avoid contamination.', 'ಮಿಶ್ರಣವನ್ನು ತೊಡೆದು ಹಾಕಿ.'),
('Bone Meal', 'ಬೋನ್ ಮೀಲ್', 'NPK varies', 'Phosphorus-rich organic fertilizer.', 'ಫಾಸ್ಫರಸ್ ಸಮೃದ್ಧ ಜೈವಿಕ ಸಸ್ಯಹಾರ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'Root crops.', 'ಮೂಲ ತರಕಾರಿ.', 'Do not overuse.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Fish Emulsion', 'ಮೀನಿನ ಎಮಲ್ಶನ್', 'NPK varies', 'Liquid organic fertilizer.', 'ದ್ರವ ಜೈವಿಕ ಸಸ್ಯಹಾರ.', 'Foliar or soil.', 'ಎಲೆ ಅಥವಾ ಮಣ್ಣು.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Strong odor.', 'ದೇವನಾದ ವಾಸನೆ.'),
('Seaweed Extract Powder', 'ಸೀಪಡ್ ಎಕ್ಸ್ಟ್ರಾಕ್ಟ್ ಪುಡಿ', 'NPK varies', 'Enhances growth and stress tolerance.', 'ಬೆಳೆ ಬೆಳವಣಿಗೆ ಮತ್ತು ಒತ್ತಡ ತಾಳುವಿಕೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Foliar spray.', 'ಎಲೆ ಮೇಲ್ಭಾಗ ಸಿಂಪಡಿ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Use as per label.', 'ಲೇಬಲ್ ಆಧಾರಿತ ಬಳಸಿ.'),
('Humic Acid', 'ಹ್ಯೂಮಿಕ್ ಆಸಿಡ್', 'NPK varies', 'Improves soil structure and nutrient uptake.', 'ಮಣ್ಣು ರಚನೆ ಮತ್ತು ಪೋಷಕ ಅಂಶಗಳ ಶೋಷಣೆಯನ್ನು ಸುಧಾರಿಸುತ್ತದೆ.', 'Soil drench.', 'ಮಣ್ಣಿನಲ್ಲಿ ಹಾಕಿ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Avoid excessive use.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Potash-Magnesium Mix', 'ಪೊಟಾಶ್-ಮ್ಯಾಗ್ನೀಷಿಯಂ ಮಿಶ್ರಣ', '0-0-20+Mg', 'Potassium and magnesium source.', 'ಪೊಟಾಶ್ ಮತ್ತು ಮ್ಯಾಗ್ನೀಷಿಯಂ ಪೂರೈಕೆ.', 'Basal or top dressing.', 'ಮೂಲ ಅಥವಾ ಮೇಲಿನ ಡ್ರೆಸ್ಸಿಂಗ್.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Use as per soil test.', 'ಮಣ್ಣು ಪರೀಕ್ಷೆ ಆಧಾರಿತ ಬಳಸಿ.'),
('Kelp Meal', 'ಕೆಲ್ಪ್ ಮೀಲ್', 'NPK varies', 'Natural growth stimulant.', 'ಸಹಜ ಬೆಳವಣಿಗೆ ಉತ್ತೇಜಕ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Do not overdose.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Azospirillum', 'ಏಜೋಸ್ಪಿರಿಲ್ಲಮ್', 'NPK 0-0-0', 'Nitrogen-fixing bacteria for soil.', 'ಮಣ್ಣು ನೈಟ್ರೋಜನ್ ಫಿಕ್ಸಿಂಗ್ ಬ್ಯಾಕ್ಟೀರಿಯಾ.', 'Seed treatment.', 'ಬೀಜ ಚಿಕಿತ್ಸೆ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Handle carefully.', 'ಸಾವಧಾನಿ ವಹಿಸಿ.'),
('Phosphate Solubilizing Bacteria', 'ಫಾಸ್ಫೇಟ್ ಸೊಲ್ಯೂಬಿಲೈಸಿಂಗ್ ಬ್ಯಾಕ್ಟೀರಿಯಾ', '0-0-0', 'Enhances phosphorus availability.', 'ಫಾಸ್ಫರಸ್ ಲಭ್ಯತೆ ಹೆಚ್ಚಿಸುತ್ತದೆ.', 'Seed or soil application.', 'ಬೀಜ ಅಥವಾ ಮಣ್ಣು.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Follow instructions.', 'ಸೂಚನೆ ಪಾಲಿಸಿ.'),
('Potassium Humate', 'ಪೊಟಾಶ್ ಹ್ಯೂಮೇಟ್', '0-0-0+K', 'Improves potassium uptake.', 'ಪೊಟಾಶಿಯಂ ಶೋಷಣೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Soil application.', 'ಮಣ್ಣಿನಲ್ಲಿ ಹಾಕಿ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Do not overdose.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Silicon Solution', 'ಸಿಲಿಕಾನ್ ಸೊಲ್ಯೂಶನ್', '0-0-0+Si', 'Enhances stress tolerance and strengthens tissue.', 'ಒತ್ತಡ ತಾಳುವಿಕೆ ಮತ್ತು ಕೋಶ ಶಕ್ತಿ ಹೆಚ್ಚಿಸುತ್ತದೆ.', 'Foliar spray.', 'ಎಲೆ ಮೇಲ್ಭಾಗ ಸಿಂಪಡಿ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Use as per label.', 'ಲೇಬಲ್ ಆಧಾರಿತ ಬಳಸಿ.'),
('Seaweed Liquid Fertilizer', 'ಸೀಪಡ್ ಲಿಕ್ವಿಡ್ ಫರ್ಟಿಲೈಜರ್', 'NPK varies', 'Boosts growth and yield.', 'ಬೆಳೆ ಬೆಳವಣಿಗೆ ಮತ್ತು ಉತ್ಪಾದನೆ ಹೆಚ್ಚಿಸುತ್ತದೆ.', 'Foliar or soil.', 'ಎಲೆ ಅಥವಾ ಮಣ್ಣಿನಲ್ಲಿ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Follow instructions.', 'ಸೂಚನೆ ಪಾಲಿಸಿ.'),
('Rock Phosphate Powder', 'ರಾಕ್ ಫಾಸ್ಫೇಟ್ ಪುಡಿ', '0-30-0', 'Slow-release phosphorus.', 'ನಿಧಾನವಾಗಿ ಫಾಸ್ಫರಸ್ ಪೂರೈಕೆ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Do not overapply.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.');

INSERT INTO fertilizers (name, namekn, npk, use_info, usekn, when_info, whenkn, where_info, wherekn, notes, noteskn) VALUES
('Zinc Sulphate', 'ಜಿಂಕ್ ಸಲ್ಪೇಟ್', '0-0-0+Zn', 'Corrects zinc deficiency.', 'ಜಿಂಕ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'During early growth.', 'ಪ್ರಾರಂಭ ಹಂತದಲ್ಲಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Avoid overdose.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Boron', 'ಬೋರಾನ್', '0-0-0+B', 'Boron supplement for fruit set.', 'ಹಣ್ಣು ಉತ್ಫಲಕ್ಕಾಗಿ ಬೋರಾನ್ ಪೂರೈಕೆ.', 'During flowering.', 'ಹೂವು ಹಂತದಲ್ಲಿ.', 'Apply to soil or foliar.', 'ಮಣ್ಣು ಅಥವಾ ಎಲೆ ಮೇಲ್ಭಾಗಕ್ಕೆ ಅನ್ವಯ.', 'Toxic in excess.', 'ಅತಿಯಾದ ಪ್ರಮಾಣ ಹಾನಿಕಾರಕ.'),
('Manganese Sulphate', 'ಮ್ಯಾಂಗನೀಸ್ ಸಲ್ಪೇಟ್', '0-0-0+Mn', 'Corrects manganese deficiency.', 'ಮ್ಯಾಂಗನೀಸ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Early growth stages.', 'ಆರಂಭ ಹಂತದಲ್ಲಿ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ.', 'Use as per soil test.', 'ಮಣ್ಣು ಪರೀಕ್ಷೆ ಆಧಾರಿತ ಬಳಕೆ.'),
('Copper Sulphate', 'ಕಾಪರ್ ಸಲ್ಪೇಟ್', '0-0-0+Cu', 'Corrects copper deficiency.', 'ಕಾಪರ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Early growth stages.', 'ಆರಂಭ ಹಂತದಲ್ಲಿ.', 'Apply to soil or foliar.', 'ಮಣ್ಣು ಅಥವಾ ಎಲೆ ಮೇಲ್ಭಾಗಕ್ಕೆ ಅನ್ವಯ.', 'Avoid overuse.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Magnesium Sulphate', 'ಮ್ಯಾಗ್ನೀಷಿಯಂ ಸಲ್ಪೇಟ್', '0-0-0+Mg', 'Corrects magnesium deficiency.', 'ಮ್ಯಾಗ್ನೀಷಿಯಂ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Early growth stages.', 'ಆರಂಭ ಹಂತದಲ್ಲಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Do not mix with phosphates.', 'ಫಾಸ್ಫೇಟ್ಗಳೊಂದಿಗೆ ಮಿಶ್ರಣ ಮಾಡಬೇಡಿ.'),
('Iron Chelate', 'ಐರನ್ ಚೀಲೆಟ್', '0-0-0+Fe', 'Corrects iron deficiency.', 'ಐರನ್ ಕೊರತೆಯನ್ನು ಸರಿಪಡಿಸುತ್ತದೆ.', 'Foliar spray.', 'ಎಲೆ ಮೇಲೆ ಸಿಂಪಡಿ.', 'Apply to all crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Sensitive to pH.', 'pH ಸಂವೇದನಶೀಲ.'),
('Molybdenum', 'ಮೊಲಿಬ್ಡಿನಮ್', '0-0-0+Mo', 'Essential micronutrient for legumes.', 'ಬೇಳೆಗಳಿಗೆ ಮುಖ್ಯ ಲಘುಪೋಷಕ.', 'Seed treatment or foliar.', 'ಬೀಜ ಚಿಕಿತ್ಸೆ ಅಥವಾ ಎಲೆ ಮೇಲ್ಭಾಗ.', 'Legumes only.', 'ಬೇಳೆಗಳಿಗೆ ಮಾತ್ರ.', 'Use in very small quantity.', 'ಚಿಕ್ಕ ಪ್ರಮಾಣದಲ್ಲಿ ಬಳಸಿ.'),
('Gypsum', 'ಜಿಪ್ಸಂ', '0-0-0+Ca', 'Corrects calcium deficiency and improves soil structure.', 'ಕ್ಯಾಲ್ಸಿಯಂ ಕೊರತೆ ಸರಿಪಡಿಸುತ್ತದೆ ಮತ್ತು ಮಣ್ಣು ರಚನೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops, especially alkaline soils.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ, ವಿಶೇಷವಾಗಿ ಅಲ್ಕಲೈನ್ ಮಣ್ಣು.', 'Do not overapply.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Neem Cake', 'ನೀಮ್ ಕೇಕ್', 'NPK varies', 'Organic fertilizer; pest repellent.', 'ಸಸ್ಯಹಾರ ಮತ್ತು ಹಾನಿಕರ ಕೀಟನಾಶಕ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Use as per crop requirement.', 'ಬೆಳೆ ಅವಶ್ಯಕತೆ ಆಧಾರಿತ ಬಳಸಿ.'),
('Vermicompost', 'ವರ್ಮಿಕಾಂಪೋಸ್ಟ್', 'NPK varies', 'Organic fertilizer improving soil health.', 'ಮಣ್ಣು ಆರೋಗ್ಯ ಸುಧಾರಿಸುತ್ತದೆ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Use sufficient quantity.', 'ಪ್ರಮಾಣಿತ ಪ್ರಮಾಣ ಬಳಸಿ.'),
('Compost', 'ಕಾಂಪೋಸ್ಟ್', 'NPK varies', 'Organic matter for soil enrichment.', 'ಮಣ್ಣು ಫಲವತ್ತೆಗೆ ಜೈವಿಕ ಪದಾರ್ಥ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Avoid contamination.', 'ಮಿಶ್ರಣವನ್ನು ತೊಡೆದು ಹಾಕಿ.'),
('Bone Meal', 'ಬೋನ್ ಮೀಲ್', 'NPK varies', 'Phosphorus-rich organic fertilizer.', 'ಫಾಸ್ಫರಸ್ ಸಮೃದ್ಧ ಜೈವಿಕ ಸಸ್ಯಹಾರ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'Root crops.', 'ಮೂಲ ತರಕಾರಿ.', 'Do not overuse.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Fish Emulsion', 'ಮೀನಿನ ಎಮಲ್ಶನ್', 'NPK varies', 'Liquid organic fertilizer.', 'ದ್ರವ ಜೈವಿಕ ಸಸ್ಯಹಾರ.', 'Foliar or soil.', 'ಎಲೆ ಅಥವಾ ಮಣ್ಣು.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Strong odor.', 'ದೇವನಾದ ವಾಸನೆ.'),
('Seaweed Extract Powder', 'ಸೀಪಡ್ ಎಕ್ಸ್ಟ್ರಾಕ್ಟ್ ಪುಡಿ', 'NPK varies', 'Enhances growth and stress tolerance.', 'ಬೆಳೆ ಬೆಳವಣಿಗೆ ಮತ್ತು ಒತ್ತಡ ತಾಳುವಿಕೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Foliar spray.', 'ಎಲೆ ಮೇಲ್ಭಾಗ ಸಿಂಪಡಿ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Use as per label.', 'ಲೇಬಲ್ ಆಧಾರಿತ ಬಳಸಿ.'),
('Humic Acid', 'ಹ್ಯೂಮಿಕ್ ಆಸಿಡ್', 'NPK varies', 'Improves soil structure and nutrient uptake.', 'ಮಣ್ಣು ರಚನೆ ಮತ್ತು ಪೋಷಕ ಅಂಶಗಳ ಶೋಷಣೆಯನ್ನು ಸುಧಾರಿಸುತ್ತದೆ.', 'Soil drench.', 'ಮಣ್ಣಿನಲ್ಲಿ ಹಾಕಿ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Avoid excessive use.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Potash-Magnesium Mix', 'ಪೊಟಾಶ್-ಮ್ಯಾಗ್ನೀಷಿಯಂ ಮಿಶ್ರಣ', '0-0-20+Mg', 'Potassium and magnesium source.', 'ಪೊಟಾಶ್ ಮತ್ತು ಮ್ಯಾಗ್ನೀಷಿಯಂ ಪೂರೈಕೆ.', 'Basal or top dressing.', 'ಮೂಲ ಅಥವಾ ಮೇಲಿನ ಡ್ರೆಸ್ಸಿಂಗ್.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Use as per soil test.', 'ಮಣ್ಣು ಪರೀಕ್ಷೆ ಆಧಾರಿತ ಬಳಸಿ.'),
('Kelp Meal', 'ಕೆಲ್ಪ್ ಮೀಲ್', 'NPK varies', 'Natural growth stimulant.', 'ಸಹಜ ಬೆಳವಣಿಗೆ ಉತ್ತೇಜಕ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Do not overdose.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Azospirillum', 'ಏಜೋಸ್ಪಿರಿಲ್ಲಮ್', 'NPK 0-0-0', 'Nitrogen-fixing bacteria for soil.', 'ಮಣ್ಣು ನೈಟ್ರೋಜನ್ ಫಿಕ್ಸಿಂಗ್ ಬ್ಯಾಕ್ಟೀರಿಯಾ.', 'Seed treatment.', 'ಬೀಜ ಚಿಕಿತ್ಸೆ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Handle carefully.', 'ಸಾವಧಾನಿ ವಹಿಸಿ.'),
('Phosphate Solubilizing Bacteria', 'ಫಾಸ್ಫೇಟ್ ಸೊಲ್ಯೂಬಿಲೈಸಿಂಗ್ ಬ್ಯಾಕ್ಟೀರಿಯಾ', '0-0-0', 'Enhances phosphorus availability.', 'ಫಾಸ್ಫರಸ್ ಲಭ್ಯತೆ ಹೆಚ್ಚಿಸುತ್ತದೆ.', 'Seed or soil application.', 'ಬೀಜ ಅಥವಾ ಮಣ್ಣು.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Follow instructions.', 'ಸೂಚನೆ ಪಾಲಿಸಿ.'),
('Potassium Humate', 'ಪೊಟಾಶ್ ಹ್ಯೂಮೇಟ್', '0-0-0+K', 'Improves potassium uptake.', 'ಪೊಟಾಶಿಯಂ ಶೋಷಣೆ ಸುಧಾರಿಸುತ್ತದೆ.', 'Soil application.', 'ಮಣ್ಣಿನಲ್ಲಿ ಹಾಕಿ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Do not overdose.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.'),
('Silicon Solution', 'ಸಿಲಿಕಾನ್ ಸೊಲ್ಯೂಶನ್', '0-0-0+Si', 'Enhances stress tolerance and strengthens tissue.', 'ಒತ್ತಡ ತಾಳುವಿಕೆ ಮತ್ತು ಕೋಶ ಶಕ್ತಿ ಹೆಚ್ಚಿಸುತ್ತದೆ.', 'Foliar spray.', 'ಎಲೆ ಮೇಲ್ಭಾಗ ಸಿಂಪಡಿ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Use as per label.', 'ಲೇಬಲ್ ಆಧಾರಿತ ಬಳಸಿ.'),
('Seaweed Liquid Fertilizer', 'ಸೀಪಡ್ ಲಿಕ್ವಿಡ್ ಫರ್ಟಿಲೈಜರ್', 'NPK varies', 'Boosts growth and yield.', 'ಬೆಳೆ ಬೆಳವಣಿಗೆ ಮತ್ತು ಉತ್ಪಾದನೆ ಹೆಚ್ಚಿಸುತ್ತದೆ.', 'Foliar or soil.', 'ಎಲೆ ಅಥವಾ ಮಣ್ಣಿನಲ್ಲಿ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Follow instructions.', 'ಸೂಚನೆ ಪಾಲಿಸಿ.'),
('Rock Phosphate Powder', 'ರಾಕ್ ಫಾಸ್ಫೇಟ್ ಪುಡಿ', '0-30-0', 'Slow-release phosphorus.', 'ನಿಧಾನವಾಗಿ ಫಾಸ್ಫರಸ್ ಪೂರೈಕೆ.', 'Basal application.', 'ಮೂಲ ಅನ್ವಯ.', 'All crops.', 'ಎಲ್ಲಾ ಬೆಳೆಗಳಿಗೆ ಅನ್ವಯ.', 'Do not overapply.', 'ಅತಿಯಾದ ಬಳಕೆ ತಪ್ಪಿಸಿ.');

INSERT INTO crops (
    slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
    sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
    irrigation, irrigationkn, soilphmin, soilphmax,
    fertilizerbaseline, fertilizerbaselinekn, info, infokn,
    cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
    cultivationguide_spacing, cultivationguide_yield,
    cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
    cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
('sweet_potato', 'Sweet Potato', 'ಶುಕ್ಕರ್ ಆಲೂಗಡ್ಡೆ', 'Kharif', 'ಖರಿಫ್', 120, 'Long', 'ದೀರ್ಘ',
 'June–July', 'ಜೂನ್–ಜುಲೈ', 'Oct–Nov', 'ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್',
 'Rainfed / Irrigated', 'ಮಳೆಯಾಧಾರಿತ / ನೀರಾವರಿ', 5.5, 7.5,
 'NPK 10:20:20', 'ಎನ್‌ಪಿಕೆ 10:20:20', 'Tuber crop; drought tolerant.', 'ಗಡ್ಡೆಹಣ್ಣು; ಬಿಸಿಲು ತಾಳುವ ಶಕ್ತಿ.',
 'Warm sunny', 'Loamy soil', '2–3 t/ha', '30x30 cm', '20–25 t/ha',
 'ಬಿಸಿ ಸೂರ್ಯಪ್ರಕಾಶ', 'ಲೋಮಿ ಮಣ್ಣು', '2–3 ಟನ್/ಹೆ', '30x30 ಸೆಂ', '20–25 ಟನ್/ಹೆ'),

('yam', 'Yam', 'ಹುಳಿ ಆಲೂಗಡ್ಡೆ', 'Kharif', 'ಖರಿಫ್', 150, 'Long', 'ದೀರ್ಘ',
 'June–July', 'ಜೂನ್–ಜುಲೈ', 'Nov–Dec', 'ನವೆಂಬರ್–ಡಿಸೆಂಬರ್',
 'Irrigated', 'ನೀರಾವರಿ', 5.5, 7.5,
 'NPK 15:15:15', 'ಎನ್‌ಪಿಕೆ 15:15:15', 'Tuber crop; needs fertile soil.', 'ಗಡ್ಡೆಹಣ್ಣು; ಫಲವತ್ತಾದ ಮಣ್ಣು ಅಗತ್ಯ.',
 'Warm sunny', 'Loamy soil', '2–3 t/ha', '50x50 cm', '15–20 t/ha',
 'ಬಿಸಿ ಸೂರ್ಯಪ್ರಕಾಶ', 'ಲೋಮಿ ಮಣ್ಣು', '2–3 ಟನ್/ಹೆ', '50x50 ಸೆಂ', '15–20 ಟನ್/ಹೆ'),

('tapioca', 'Tapioca', 'ಕಸಾವಿ', 'Kharif', 'ಖರಿಫ್', 180, 'Long', 'ದೀರ್ಘ',
 'June–July', 'ಜೂನ್–ಜುಲೈ', 'Dec–Jan', 'ಡಿಸೆಂಬರ್–ಜನವರಿ',
 'Rainfed', 'ಮಳೆಯಾಧಾರಿತ', 5.5, 7.5,
 'NPK 10:20:20', 'ಎನ್‌ಪಿಕೆ 10:20:20', 'Root crop; drought tolerant.', 'ಮೂಲ ಬೆಳೆ; ಬಿಸಿಲು ತಾಳುವ ಶಕ್ತಿ.',
 'Warm sunny', 'Loamy soil', '1.5–2 t/ha', '50x50 cm', '15–20 t/ha',
 'ಬಿಸಿ ಸೂರ್ಯಪ್ರಕಾಶ', 'ಲೋಮಿ ಮಣ್ಣು', '1.5–2 ಟನ್/ಹೆ', '50x50 ಸೆಂ', '15–20 ಟನ್/ಹೆ'),

('coriander', 'Coriander', 'ಧನಿಯಾ', 'Kharif,Rabi', 'ಖರಿಫ್,ರಬೀ', 50, 'Short', 'ಸಣ್ಣ',
 'Sept–Oct', 'ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್', 'Nov–Dec', 'ನವೆಂಬರ್–ಡಿಸೆಂಬರ್',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 10:10:10', 'ಎನ್‌ಪಿಕೆ 10:10:10', 'Leafy herb; aromatic.', 'ಎಲೆ ಹರ್ಬ್; ಸುಗಂಧ.',
 'Warm sunny', 'Loamy soil', '10–15 kg/ha', '20x10 cm', '1–1.5 t/ha',
 'ಬಿಸಿ ಸೂರ್ಯಪ್ರಕಾಶ', 'ಲೋಮಿ ಮಣ್ಣು', '10–15 ಕೆಜಿ/ಹೆ', '20x10 ಸೆಂ', '1–1.5 ಟನ್/ಹೆ'),

('mint', 'Mint', 'ಪುದೀನಾ', 'Kharif,Rabi', 'ಖರಿಫ್,ರಬೀ', 60, 'Short', 'ಸಣ್ಣ',
 'July–Aug', 'ಜುಲೈ–ಆಗಸ್ಟ್', 'Sept–Oct', 'ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 10:10:10', 'ಎನ್‌ಪಿಕೆ 10:10:10', 'Leafy herb; fast-growing.', 'ಎಲೆ ಹರ್ಬ್; ವೇಗವಾಗಿ ಬೆಳೆಯುತ್ತದೆ.',
 'Warm sunny', 'Loamy soil', '10–15 kg/ha', '20x20 cm', '1–1.5 t/ha',
 'ಬಿಸಿ ಸೂರ್ಯಪ್ರಕಾಶ', 'ಲೋಮಿ ಮಣ್ಣು', '10–15 ಕೆಜಿ/ಹೆ', '20x20 ಸೆಂ', '1–1.5 ಟನ್/ಹೆ'),

('basil', 'Basil', 'ತೇಂಗಿನ ಎಲೆ', 'Kharif,Rabi', 'ಖರಿಫ್,ರಬೀ', 50, 'Short', 'ಸಣ್ಣ',
 'July–Aug', 'ಜುಲೈ–ಆಗಸ್ಟ್', 'Sept–Oct', 'ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 10:10:10', 'ಎನ್‌ಪಿಕೆ 10:10:10', 'Leafy herb; aromatic.', 'ಎಲೆ ಹರ್ಬ್; ಸುಗಂಧ.',
 'Warm sunny', 'Loamy soil', '10–15 kg/ha', '20x20 cm', '1–1.5 t/ha',
 'ಬಿಸಿ ಸೂರ್ಯಪ್ರಕಾಶ', 'ಲೋಮಿ ಮಣ್ಣು', '10–15 ಕೆಜಿ/ಹೆ', '20x20 ಸೆಂ', '1–1.5 ಟನ್/ಹೆ'),

('celery', 'Celery', 'ಸೆಲೆರಿ', 'Rabi', 'ರಬೀ', 80, 'Short', 'ಸಣ್ಣ',
 'Oct–Nov', 'ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್', 'Jan–Feb', 'ಜನವರಿ–ಫೆಬ್ರವರಿ',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 15:15:15', 'ಎನ್‌ಪಿಕೆ 15:15:15', 'Leafy vegetable; requires moist soil.', 'ಎಲೆ ತರಕಾರಿ; ತೇವ ಮಣ್ಣು ಬೇಕು.',
 'Cool dry', 'Loamy soil', '400–500 g/ha', '30x20 cm', '20–25 t/ha',
 'ತಂಪು ಒಣ', 'ಲೋಮಿ ಮಣ್ಣು', '400–500 g/ಹೆ', '30x20 ಸೆಂ', '20–25 ಟನ್/ಹೆ'),

('parsley', 'Parsley', 'ಪಾರ್ಸ್‌ಲೆ', 'Rabi', 'ರಬೀ', 60, 'Short', 'ಸಣ್ಣ',
 'Oct–Nov', 'ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್', 'Dec–Jan', 'ಡಿಸೆಂಬರ್–ಜನವರಿ',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 10:10:10', 'ಎನ್‌ಪಿಕೆ 10:10:10', 'Leafy herb; nutrient-rich.', 'ಎಲೆ ಹರ್ಬ್; ಪೋಷಕಾಂಶ ಸಂಪನ್ನ.',
 'Cool dry', 'Loamy soil', '200–300 g/ha', '20x10 cm', '10–15 t/ha',
 'ತಂಪು ಒಣ', 'ಲೋಮಿ ಮಣ್ಣು', '200–300 g/ಹೆ', '20x10 ಸೆಂ', '10–15 ಟನ್/ಹೆ'),

('chili', 'Chili', 'ಮೆಣಸು', 'Kharif,Rabi', 'ಖರಿಫ್,ರಬೀ', 90, 'Medium', 'ಮಧ್ಯಮ',
 'June–July', 'ಜೂನ್–ಜುಲೈ', 'Sept–Oct', 'ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 20:20:20', 'ಎನ್‌ಪಿಕೆ 20:20:20', 'Fruit vegetable; prefers warm climate.', 'ಹಣ್ಣು ತರಕಾರಿ; ಬಿಸಿಲು ಹವಾಮಾನ ಇಷ್ಟ.',
 'Warm sunny', 'Loamy soil', '500–600 g/ha', '40x30 cm', '15–20 t/ha',
 'ಬಿಸಿ ಸೂರ್ಯಪ್ರಕಾಶ', 'ಲೋಮಿ ಮಣ್ಣು', '500–600 g/ಹೆ', '40x30 ಸೆಂ', '15–20 ಟನ್/ಹೆ');

-- Continue the remaining entries up to 25 crops similarly, ensuring no duplicates with Parts 1–5
INSERT INTO crops (
    slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
    sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
    irrigation, irrigationkn, soilphmin, soilphmax,
    fertilizerbaseline, fertilizerbaselinekn, info, infokn,
    cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
    cultivationguide_spacing, cultivationguide_yield,
    cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
    cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
('amaranth', 'Amaranth', 'ಅಮರಂತ್', 'Kharif,Rabi', 'ಖರಿಫ್,ರಬೀ', 50, 'Short', 'ಸಣ್ಣ',
 'July–Aug', 'ಜುಲೈ–ಆಗಸ್ಟ್', 'Sept–Oct', 'ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 10:10:10', 'ಎನ್‌ಪಿಕೆ 10:10:10', 'Leafy vegetable; fast-growing.', 'ಎಲೆ ತರಕಾರಿ; ವೇಗವಾಗಿ ಬೆಳೆಯುತ್ತದೆ.',
 'Warm sunny', 'Loamy soil', '10–15 kg/ha', '20x15 cm', '1–1.5 t/ha',
 'ಬಿಸಿ ಸೂರ್ಯಪ್ರಕಾಶ', 'ಲೋಮಿ ಮಣ್ಣು', '10–15 ಕೆಜಿ/ಹೆ', '20x15 ಸೆಂ', '1–1.5 ಟನ್/ಹೆ'),

('spinach', 'Spinach', 'पालक', 'Kharif,Rabi', 'ಖರಿಫ್,ರಬೀ', 45, 'Short', 'ಸಣ್ಣ',
 'July–Aug', 'ಜುಲೈ–ಆಗಸ್ಟ್', 'Aug–Sept', 'ಆಗಸ್ಟ್–ಸೆಪ್ಟೆಂಬರ್',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 10:10:10', 'ಎನ್‌ಪಿಕೆ 10:10:10', 'Leafy vegetable; rich in iron.', 'ಎಲೆ ತರಕಾರಿ; ಕಬ್ಬಿಣ ಸಮೃದ್ಧ.',
 'Warm sunny', 'Loamy soil', '10–15 kg/ha', '20x15 cm', '1–1.2 t/ha',
 'ಬಿಸಿ ಸೂರ್ಯಪ್ರಕಾಶ', 'ಲೋಮಿ ಮಣ್ಣು', '10–15 ಕೆಜಿ/ಹೆ', '20x15 ಸೆಂ', '1–1.2 ಟನ್/ಹೆ'),

('lettuce', 'Lettuce', 'ಲೆಟ್ಯೂಸ್', 'Rabi', 'ರಬೀ', 60, 'Short', 'ಸಣ್ಣ',
 'Oct–Nov', 'ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್', 'Dec–Jan', 'ಡಿಸೆಂಬರ್–ಜನವರಿ',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.0,
 'NPK 15:15:15', 'ಎನ್‌ಪಿಕೆ 15:15:15', 'Leafy vegetable; cool season crop.', 'ಎಲೆ ತರಕಾರಿ; ತಂಪಾದ ಹವಾಮಾನ ಬೆಳೆ.',
 'Cool dry', 'Loamy soil', '400–500 g/ha', '30x20 cm', '1–1.5 t/ha',
 'ತಂಪು ಒಣ', 'ಲೋಮಿ ಮಣ್ಣು', '400–500 g/ಹೆ', '30x20 ಸೆಂ', '1–1.5 ಟನ್/ಹೆ'),

('kale', 'Kale', 'ಕೇಲ್', 'Rabi', 'ರಬೀ', 70, 'Short', 'ಸಣ್ಣ',
 'Oct–Nov', 'ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್', 'Dec–Jan', 'ಡಿಸೆಂಬರ್–ಜನವರಿ',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 15:15:15', 'ಎನ್‌ಪಿಕೆ 15:15:15', 'Leafy vegetable; nutrient-rich.', 'ಎಲೆ ತರಕಾರಿ; ಪೋಷಕಾಂಶ ಸಂಪನ್ನ.',
 'Cool dry', 'Loamy soil', '400–500 g/ha', '30x20 cm', '1–1.5 t/ha',
 'ತಂಪು ಒಣ', 'ಲೋಮಿ ಮಣ್ಣು', '400–500 g/ಹೆ', '30x20 ಸೆಂ', '1–1.5 ಟನ್/ಹೆ'),

('asparagus', 'Asparagus', 'ಅಸ್ಪೆರಾಗಸ್', 'Rabi', 'ರಬೀ', 120, 'Long', 'ದೀರ್ಘ',
 'Oct–Nov', 'ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್', 'Feb–Mar', 'ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
 'Irrigated', 'ನೀರಾವರಿ', 6.5, 7.5,
 'NPK 15:15:15', 'ಎನ್‌ಪಿಕೆ 15:15:15', 'Perennial vegetable; high-value crop.', 'ಸ್ಥಾಯೀ ತರಕಾರಿ; ಬೆಲೆ ಹೆಚ್ಚು.',
 'Cool dry', 'Loamy soil', '1–2 t/ha', '50x30 cm', '5–6 t/ha',
 'ತಂಪು ಒಣ', 'ಲೋಮಿ ಮಣ್ಣು', '1–2 ಟನ್/ಹೆ', '50x30 ಸೆಂ', '5–6 ಟನ್/ಹೆ'),

('okra', 'Okra', 'ಬೆಂಡಕಾಯಿ', 'Kharif', 'ಖರಿಫ್', 90, 'Medium', 'ಮಧ್ಯಮ',
 'June–July', 'ಜೂನ್–ಜುಲೈ', 'Sept–Oct', 'ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 20:20:20', 'ಎನ್‌ಪಿಕೆ 20:20:20', 'Fruit vegetable; heat tolerant.', 'ಹಣ್ಣು ತರಕಾರಿ; ಬಿಸಿಲು ತಾಳುವ ಶಕ್ತಿ.',
 'Warm sunny', 'Loamy soil', '500–600 g/ha', '40x20 cm', '15–20 t/ha',
 'ಬಿಸಿ ಸೂರ್ಯಪ್ರಕಾಶ', 'ಲೋಮಿ ಮಣ್ಣು', '500–600 g/ಹೆ', '40x20 ಸೆಂ', '15–20 ಟನ್/ಹೆ'),

('ladyfinger', 'Ladyfinger', 'ಬೆಂಡಕಾಯಿ', 'Kharif', 'ಖರಿಫ್', 80, 'Short', 'ಸಣ್ಣ',
 'June–July', 'ಜೂನ್–ಜುಲೈ', 'Sept–Oct', 'ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 20:20:20', 'ಎನ್‌ಪಿಕೆ 20:20:20', 'Fruit vegetable; widely cultivated.', 'ಹಣ್ಣು ತರಕಾರಿ; ಹೆಚ್ಚು ಬೆಳೆವತ್ತಾದ.',
 'Warm sunny', 'Loamy soil', '500–600 g/ha', '40x20 cm', '15–20 t/ha',
 'ಬಿಸಿ ಸೂರ್ಯಪ್ರಕಾಶ', 'ಲೋಮಿ ಮಣ್ಣು', '500–600 g/ಹೆ', '40x20 ಸೆಂ', '15–20 ಟನ್/ಹೆ'),

('fenugreek', 'Fenugreek', 'ಮೆಂತ್ಯು', 'Rabi', 'ರಬೀ', 60, 'Short', 'ಸಣ್ಣ',
 'Oct–Nov', 'ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್', 'Dec–Jan', 'ಡಿಸೆಂಬರ್–ಜನವರಿ',
 'Irrigated', 'ನೀರಾವರಿ', 6.0, 7.5,
 'NPK 10:20:10', 'ಎನ್‌ಪಿಕೆ 10:20:10', 'Leafy herb; improves soil fertility.', 'ಎಲೆ ಹರ್ಬ್; ಮಣ್ಣು ಫಲವತ್ತೆ ಹೆಚ್ಚಿಸುತ್ತದೆ.',
 'Cool dry', 'Loamy soil', '10–15 kg/ha', '20x10 cm', '0.8–1 t/ha',
 'ತಂಪು ಒಣ', 'ಲೋಮಿ ಮಣ್ಣು', '10–15 ಕೆಜಿ/ಹೆ', '20x10 ಸೆಂ', '0.8–1 ಟನ್/ಹೆ'),

('mustard', 'Mustard', 'ಸರೋಬರಿ', 'Rabi', 'ರಬೀ', 90, 'Medium', 'ಮಧ್ಯಮ',
 'Nov–Dec', 'ನವೆಂಬರ್–ಡಿಸೆಂಬರ್', 'Feb–Mar', 'ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
 'Irrigated / Rainfed', 'ನೀರಾವರಿ / ಮಳೆಯಾಧಾರಿತ', 6.0, 7.5,
 'NPK 15:15:15', 'ಎನ್‌ಪಿಕೆ 15:15:15', 'Oilseed crop; cool season.', 'ಎಣ್ಣೆ ಬೀಜ ಬೆಳೆ; ತಂಪಾದ ಹವಾಮಾನ.',
 'Cool dry', 'Loamy soil', '5–6 kg/ha', '30x10 cm', '1–1.5 t/ha',
 'ತಂಪು ಒಣ', 'ಲೋಮಿ ಮಣ್ಣು', '5–6 ಕೆಜಿ/ಹೆ', '30x10 ಸೆಂ', '1–1.5 ಟನ್/ಹೆ');

use krishidisha;
CREATE TABLE soil_recommendations (
    parameter VARCHAR(50),
    operator VARCHAR(20),
    threshold VARCHAR(20),
    severity VARCHAR(20),
    meaning_en TEXT,
    meaning_kn TEXT,
    recommendation_en TEXT,
    recommendation_kn TEXT
);
USE krishidisha;

ALTER TABLE soil_recommendations
DROP COLUMN id;
use krishidisha;
INSERT INTO soil_recommendations
(parameter, operator, threshold, severity, meaning_en, meaning_kn, recommendation_en, recommendation_kn)
VALUES
-- Nitrogen (N)
('N', '<', '25', 'Critical', 'Extremely low nitrogen', 'ಅತಿಯಾದ ಕಡಿಮೆ ನೈಟ್ರೋಜನ್', 'Immediately add Nitrogen: Apply Urea (46-0-0) 120 kg/acre. Ensure foliar spray for quick absorption. Monitor growth closely.', 'ತಕ್ಷಣ ನೈಟ್ರೋಜನ್ ಹೆಚ್ಚಿಸಿ: ಯೂರಿಯಾ (46-0-0) 120 ಕೆಜಿ/ಎಕರೆ ಬಳಸಿ. ಶೀಘ್ರ ಶೋಷಣೆಗಾಗಿ ಎಲೆ ರಾಸಾಯನಿಕ ಸ್ಪ್ರೇ ಮಾಡಿ. ಬೆಳವಣಿಗೆ ನಿಗಾ ವಹಿಸಿ.'),
('N', 'BETWEEN', '25-50', 'High', 'Very low nitrogen', 'ಬಹಳ ಕಡಿಮೆ ನೈಟ್ರೋಜನ್', 'Add Urea 100 kg/acre with organic manure to boost leaves and stem. Irrigate after application. Observe plant response.', 'ಯೂರಿಯಾ 100 ಕೆಜಿ/ಎಕರೆ ಮತ್ತು ಜೈವಿಕ ಗೊಬ್ಬರ ಬಳಸಿ ಎಲೆ ಮತ್ತು ಕಾಂಡ ಬೆಳವಣಿಗೆಗೆ. ಹದವಾಗಿ ನೀರಾವರಿ ಮಾಡಿ. ಸಸ್ಯ ಪ್ರತಿಕ್ರಿಯೆ ಗಮನಿಸಿ.'),
('N', 'BETWEEN', '50-80', 'Moderate', 'Low nitrogen', 'ಕಡಿಮೆ ನೈಟ್ರೋಜನ್', 'Apply half dose of Urea and continue routine compost/fertilizer application. Monitor leaf color and growth rate.', 'ಯೂರಿಯಾ ಅರ್ಧ ಪ್ರಮಾಣ ಬಳಸಿ ಮತ್ತು ನಿಯಮಿತ ಎಫ್‌ವೈಎಮ್/ಗೊಬ್ಬರ ಬಳಸಿ. ಎಲೆ ಬಣ್ಣ ಮತ್ತು ಬೆಳವಣಿಗೆ ಗಮನಿಸಿ.'),
('N', 'BETWEEN', '80-150', 'Normal', 'Optimal nitrogen', 'ಆದರ್ಶ ನೈಟ್ರೋಜನ್', 'Maintain with routine fertilization. Combine organic manure with chemical fertilizer for balanced growth.', 'ನಿಯಮಿತ ಗೊಬ್ಬರ ಬಳಸಿ. ಸಮತೋಲನ ಬೆಳವಣಿಗೆಯಿಗಾಗಿ ಜೈವಿಕ ಮತ್ತು ರಾಸಾಯನಿಕ ಗೊಬ್ಬರ ಸಂಯೋಜಿಸಿ.'),
('N', '>', '150', 'High', 'Excess nitrogen', 'ಹೆಚ್ಚು ನೈಟ್ರೋಜನ್', 'Reduce Nitrogen application; excess N can delay flowering, promote leafy growth, and attract pests.', 'ನೈಟ್ರೋಜನ್ ಕಡಿಮೆ ಮಾಡಿ; ಹೆಚ್ಚು N ಹೂವು ವಿಳಂಬ, ಎಲೆ ಹೆಚ್ಚು ಬೆಳೆಯಲು, ಮತ್ತು ಕೀಟಗಳನ್ನು ಆಕರ್ಷಿಸುತ್ತದೆ.'),

-- Phosphorus (P)
('P', '<', '20', 'Critical', 'Extremely low phosphorus', 'ಅತಿಯಾದ ಕಡಿಮೆ ಫಾಸ್ಫರಸ್', 'Apply DAP (18-46-0) 60 kg/acre immediately to enhance root and flowering. Use split dose for efficiency.', 'ಡಿಎಪಿ (18-46-0) 60 ಕೆಜಿ/ಎಕರೆ ತಕ್ಷಣ ಬಳಸಿ, ಬೇರು ಮತ್ತು ಹೂವು ಬೆಳವಣಿಗೆಗೆ. ಹಂಚಿಕೆ ಪ್ರಮಾಣ ಬಳಸಿರಿ.'),
('P', 'BETWEEN', '20-30', 'High', 'Very low phosphorus', 'ಬಹಳ ಕಡಿಮೆ ಫಾಸ್ಫರಸ್', 'Add DAP 50 kg/acre and combine with compost. Monitor flowering and root development.', 'ಡಿಎಪಿ 50 ಕೆಜಿ/ಎಕರೆ ಬಳಸಿ ಮತ್ತು ಕಂಪೋಸ್ಟ್ ಜೊತೆಗೆ ಬಳಸಿ. ಹೂವು ಮತ್ತು ಬೇರು ಬೆಳವಣಿಗೆ ಗಮನಿಸಿ.'),
('P', 'BETWEEN', '30-40', 'Moderate', 'Low phosphorus', 'ಕಡಿಮೆ ಫಾಸ್ಫರಸ್', 'Apply DAP in small doses with irrigation; ensure proper soil mixing.', 'ಡಿಎಪಿ ಸಣ್ಣ ಪ್ರಮಾಣದಲ್ಲಿ ನೀರಾವರಿಯೊಂದಿಗೆ ಬಳಸಿ; ಮಣ್ಣಿನಲ್ಲಿ ಸರಿಯಾಗಿ ಮಿಶ್ರಣ ಮಾಡಿ.'),
('P', 'BETWEEN', '40-50', 'Normal', 'Optimal phosphorus', 'ಆದರ್ಶ ಫಾಸ್ಫರಸ್', 'Maintain with routine fertilization and organic matter addition.', 'ನಿಯಮಿತ ಗೊಬ್ಬರ ಮತ್ತು ಜೈವಿಕ ಪದಾರ್ಥ ಬಳಸಿ.'),
('P', '>', '50', 'High', 'Excess phosphorus', 'ಹೆಚ್ಚು ಫಾಸ್ಫರಸ್', 'Reduce DAP; excess phosphorus may hinder micronutrient absorption. Apply compost to balance soil.', 'ಡಿಎಪಿ ಕಡಿಮೆ ಮಾಡಿ; ಹೆಚ್ಚು ಫಾಸ್ಫರಸ್ ಕ್ಷುದ್ರ ಪೋಷಕಾಂಶ ಶೋಷಣೆಯನ್ನು ತಡೆಹಿಡಿಯಬಹುದು. ಮಣ್ಣಿನ ಸಮತೋಲನಕ್ಕೆ ಕಂಪೋಸ್ಟ್ ಬಳಸಿ.'),

-- Potassium (K)
('K', '<', '50', 'Critical', 'Extremely low potassium', 'ಅತಿಯಾದ ಕಡಿಮೆ ಪೊಟ್ಯಾಸಿಯಂ', 'Add MOP (0-0-60) 50 kg/acre to strengthen stems and boost resistance. Monitor leaf color and plant vigor.', 'ಎಂಒಪಿ (0-0-60) 50 ಕೆಜಿ/ಎಕರೆ ಬಳಸಿ ಕಾಂಡ ಬಲಗೊಳಿಸಿ ಮತ್ತು ಪ್ರತಿರೋಧ ಹೆಚ್ಚಿಸಿ. ಎಲೆ ಬಣ್ಣ ಮತ್ತು ಸಸ್ಯ ಶಕ್ತಿ ಗಮನಿಸಿ.'),
('K', 'BETWEEN', '50-100', 'High', 'Very low potassium', 'ಬಹಳ ಕಡಿಮೆ ಪೊಟ್ಯಾಸಿಯಂ', 'Apply MOP 40 kg/acre with FYM for steady growth. Ensure soil moisture after application.', 'ಎಂಒಪಿ 40 ಕೆಜಿ/ಎಕರೆ ಮತ್ತು ಎಫ್‌ವೈಎಮ್ ಬಳಸಿ. ಬಳಕೆಯ ನಂತರ ಮಣ್ಣು ತೇವ ಹಂಚಿ.'),
('K', 'BETWEEN', '100-150', 'Moderate', 'Low potassium', 'ಕಡಿಮೆ ಪೊಟ್ಯಾಸಿಯಂ', 'Apply smaller MOP dose and improve organic matter to retain potassium.', 'ಕಡಿಮೆ ಪ್ರಮಾಣದ ಎಂಒಪಿ ಬಳಸಿ; ಪೊಟ್ಯಾಸಿಯಂ ಉಳಿಸಲು ಜೈವಿಕ ಪದಾರ್ಥ ಹೆಚ್ಚಿಸಿ.'),
('K', 'BETWEEN', '150-200', 'Normal', 'Optimal potassium', 'ಆದರ್ಶ ಪೊಟ್ಯಾಸಿಯಂ', 'Maintain with routine fertilization. Monitor for uniform leaf growth.', 'ನಿಯಮಿತ ಗೊಬ್ಬರ ಬಳಸಿ; ಸಮತೋಲನ ಎಲೆ ಬೆಳವಣಿಗೆ ಗಮನಿಸಿ.'),
('K', '>', '200', 'High', 'Excess potassium', 'ಹೆಚ್ಚು ಪೊಟ್ಯಾಸಿಯಂ', 'Reduce MOP; excess potassium may affect nutrient balance. Use organic compost to restore balance.', 'ಎಂಒಪಿ ಕಡಿಮೆ ಮಾಡಿ; ಹೆಚ್ಚು ಪೊಟ್ಯಾಸಿಯಂ ಪೋಷಕಾಂಶ ಸಮತೋಲನ ಕೆಡಿಸುತ್ತದೆ. ಸಮತೋಲನಕ್ಕಾಗಿ ಕಂಪೋಸ್ಟ್ ಬಳಸಿ.'),

-- pH
('pH', '<', '4.5', 'Critical', 'Extremely acidic soil', 'ಅತಿಯಾದ ಅಮ್ಲೀಯ ಮಣ್ಣು', 'Apply lime 300–400 kg/acre to neutralize acidity. Mix with FYM for better balance.', 'ಮಣ್ಣಿನ ಅಮ್ಲೀಯತೆ ಕಡಿಮೆ ಮಾಡಲು ಲೈಮ್ 300–400 ಕೆಜಿ/ಎಕರೆ ಬಳಸಿ. ಉತ್ತಮ ಸಮತೋಲನಕ್ಕೆ ಎಫ್‌ವೈಎಮ್ ಜೊತೆಗೆ ಮಿಶ್ರಣ ಮಾಡಿ.'),
('pH', 'BETWEEN', '4.5-5', 'High', 'Very acidic soil', 'ಬಹಳ ಅಮ್ಲೀಯ ಮಣ್ಣು', 'Apply lime 250–300 kg/acre and organic compost to improve pH. Monitor for crop response.', 'ಲೈಮ್ 250–300 ಕೆಜಿ ಮತ್ತು ಜೈವಿಕ ಕಂಪೋಸ್ಟ್ ಬಳಸಿ pH ಸುಧಾರಣೆ. ಬೆಳೆಯ ಪ್ರತಿಕ್ರಿಯೆ ಗಮನಿಸಿ.'),
('pH', 'BETWEEN', '5-5.5', 'Moderate', 'Slightly acidic soil', 'ಸ್ವಲ್ಪ ಅಮ್ಲೀಯ ಮಣ್ಣು', 'Apply lime 100–150 kg/acre if needed. Maintain organic matter and regular fertilization.', 'ಬೇಕಾದರೆ ಲೈಮ್ 100–150 ಕೆಜಿ ಬಳಸಿ. ಜೈವಿಕ ಪದಾರ್ಥ ಮತ್ತು ನಿಯಮಿತ ಗೊಬ್ಬರ ಕಾಪಾಡಿ.'),
('pH', 'BETWEEN', '5.5-7', 'Normal', 'Ideal soil pH', 'ಆದರ್ಶ ಮಣ್ಣು pH', 'Maintain with FYM/compost; continue balanced fertilization. Monitor growth.', 'ಎಫ್‌ವೈಎಮ್/ಕಂಪೋಸ್ಟ್ ಬಳಸಿ; ಸಮತೋಲನ ಗೊಬ್ಬರ. ಬೆಳವಣಿಗೆ ಗಮನಿಸಿ.'),
('pH', 'BETWEEN', '7-7.5', 'Moderate', 'Slightly alkaline soil', 'ಸ್ವಲ್ಪ ಕ್ಷಾರ ಮಣ್ಣು', 'Apply gypsum 50–100 kg/acre if needed; avoid excess N application.', 'ಬೇಕಾದರೆ ಜಿಪ್ಸಮ್ 50–100 ಕೆಜಿ ಬಳಸಿ; ಹೆಚ್ಚುವರಿ ನೈಟ್ರೋಜನ್ ತಪ್ಪಿಸಿ.'),
('pH', 'BETWEEN', '7.5-8', 'High', 'Alkaline soil', 'ಕ್ಷಾರ ಮಣ್ಣು', 'Apply gypsum 150–200 kg/acre; maintain organic matter. Ensure proper irrigation.', 'ಜಿಪ್ಸಮ್ 150–200 ಕೆಜಿ ಬಳಸಿ; ಜೈವಿಕ ಪದಾರ್ಥ ಕಾಪಾಡಿ. ಸರಿಯಾದ ನೀರಾವರಿ ಒದಗಿಸಿ.'),
('pH', '>', '8', 'Critical', 'Extremely alkaline soil', 'ಅತಿಯಾದ ಕ್ಷಾರ ಮಣ್ಣು', 'Apply gypsum 200–300 kg/acre and acidifying amendments. Monitor plant growth.', 'ಜಿಪ್ಸಮ್ 200–300 ಕೆಜಿ ಮತ್ತು ಮಣ್ಣಿನ ಅಮ್ಲೀಕರಣ ಉಪಾಯ ಬಳಸಿ. ಬೆಳೆಯ ಬೆಳವಣಿಗೆ ಗಮನಿಸಿ.'),

-- Moisture
('Moisture', '<', '20', 'Critical', 'Extremely dry soil', 'ಅತಿಯಾದ ಒಣ ಮಣ್ಣು', 'Increase irrigation frequency; apply mulch to retain water. Monitor crop closely.', 'ನೀರಾವರಿ ಹೆಚ್ಚಿಸಿ; ನೀರನ್ನು ಉಳಿಸಲು ಮಣ್ಣು ಮುಲ್ಚ್ ಹಾಕಿ. ಬೆಳೆಯನ್ನು ನಿಗಾ ವಹಿಸಿ.'),
('Moisture', 'BETWEEN', '20-30', 'High', 'Very dry soil', 'ಬಹಳ ಒಣ ಮಣ್ಣು', 'Apply irrigation immediately; combine with soil conditioner to retain moisture.', 'ತಕ್ಷಣ ನೀರಾವರಿ ಮಾಡಿ; ಮಣ್ಣು ತೇವ ಉಳಿಸಲು ಮಣ್ಣಿನ ಶರತ ನಿಯಂತ್ರಕ ಬಳಸಿ.'),
('Moisture', 'BETWEEN', '30-40', 'Moderate', 'Slight dryness', 'ಸ್ವಲ್ಪ ಒಣ', 'Schedule regular watering; mulch soil and monitor soil moisture.', 'ನಿಯಮಿತ ನೀರಾವರಿ ಯೋಜಿಸಿ; ಮಣ್ಣು ಮುಲ್ಚ್ ಮಾಡಿ ಮತ್ತು ತೇವ ಪರಿಶೀಲಿಸಿ.'),
('Moisture', 'BETWEEN', '40-70', 'Normal', 'Optimal moisture', 'ಆದರ್ಶ ತೇವ', 'Maintain with routine irrigation and rainfall monitoring. Ensure even moisture.', 'ನಿಯಮಿತ ನೀರಾವರಿ ಮತ್ತು ಮಳೆಯ ಪರಿಶೀಲನೆ. ಸಮತೋಲನ ತೇವ ಖಚಿತಪಡಿಸಿ.'),
('Moisture', '>', '70', 'High', 'Excess moisture', 'ಅತಿಯಾದ ತೇವ', 'Reduce irrigation; ensure drainage to avoid root rot.', 'ನೀರಾವರಿ ಕಡಿಮೆ ಮಾಡಿ; ಬೇರು ಕುಲುಮೆ ತಪ್ಪಿಸಲು ನೀರು ಹರಿವು ಒದಗಿಸಿ.'),

-- Temperature
('Temperature', '<', '10', 'Critical', 'Severe cold', 'ತೀವ್ರ ಚಳಿ', 'Use mulch, poly tunnels or heaters to protect crops from frost. Monitor growth closely.', 'ಮುಲ್ಚ್, ಪ್ಲಾಸ್ಟಿಕ್ ಟನಲ್ ಅಥವಾ ಹೀಟರ್ ಬಳಸಿ ಚಳಿಯಿಂದ ರಕ್ಷಿಸಿ. ಬೆಳವಣಿಗೆ ನಿಗಾ ವಹಿಸಿ.'),
('Temperature', 'BETWEEN', '10-15', 'High', 'Very cold', 'ಬಹಳ ಚಳಿ', 'Delay irrigation and sowing; cover crops with mulch or shade cloth.', 'ನೀರಾವರಿ ಮತ್ತು ಬಿತ್ತನೆ ವಿಳಂಬಿಸಿ; ಸಸ್ಯ ಮುಲ್ಚ್ ಅಥವಾ ಶೇಡ್ ಕ್ಲಾತ್‌ನಿಂದ ಮುಚ್ಚಿ.'),
('Temperature', 'BETWEEN', '15-20', 'Moderate', 'Slightly cold', 'ಸ್ವಲ್ಪ ಚಳಿ', 'Provide slight irrigation; avoid early sowing. Use mulch if needed.', 'ಸ್ವಲ್ಪ ನೀರಾವರಿ ಮಾಡಿ; ಬೇಗ ಬಿತ್ತನೆ ತಪ್ಪಿಸಿ. ಬೇಕಾದರೆ ಮುಲ್ಚ್ ಬಳಸಿ.'),
('Temperature', 'BETWEEN', '20-25', 'Normal', 'Optimal temperature', 'ಆದರ್ಶ ಉಷ್ಣತೆ', 'Maintain routine irrigation and ensure balanced growth. Monitor crops regularly.', 'ನಿಯಮಿತ ನೀರಾವರಿ ಮತ್ತು ಸಮತೋಲನ ಬೆಳವಣಿಗೆ. ಬೆಳೆಯನ್ನು ನಿಯಮಿತ ಪರಿಶೀಲಿಸಿ.'),
('Temperature', 'BETWEEN', '25-30', 'Moderate', 'Warm temperature', 'ಬಿಸಿಲು ಉಷ್ಣತೆ', 'Provide slight shade and regular irrigation. Avoid mid-day stress.', 'ಸ್ವಲ್ಪ ನೆರವು ಮತ್ತು ನಿಯಮಿತ ನೀರಾವರಿ. ಮಧ್ಯಾಹ್ನ ಒತ್ತಡ ತಪ್ಪಿಸಿ.'),
('Temperature', 'BETWEEN', '30-35', 'High', 'Hot temperature', 'ಬಿಸಿಲು ಹೆಚ್ಚು', 'Use shade nets, increase irrigation, and monitor crop stress signs.', 'ಶೇಡ್ ನೆಟ್ ಬಳಸಿ, ನೀರಾವರಿ ಹೆಚ್ಚಿಸಿ, ಬೆಳೆ ಒತ್ತಡ ಲಕ್ಷಣ ಗಮನಿಸಿ.'),
('Temperature', 'BETWEEN', '35-40', 'Very High', 'Too hot', 'ಅತಿಯಾದ ಬಿಸಿಲು', 'Use shade nets, drip irrigation, avoid noon watering. Protect leaves from scorching.', 'ಶೇಡ್ ನೆಟ್, ಡ್ರಿಪ್ ನೀರಾವರಿ, ಮಧ್ಯಾಹ್ನ ನೀರಾವರಿ ತಪ್ಪಿಸಿ. ಎಲೆಗಳನ್ನು ರಕ್ಷಿಸಿ.'),
('Temperature', '>', '40', 'Critical', 'Extreme heat', 'ತೀವ್ರ ಬಿಸಿಲು ಒತ್ತಡ', 'Apply frequent light irrigation and cover crops with shade cloth. Avoid direct sun exposure.', 'ಹಗುರವಾದ ನೀರಾವರಿ ಮಾಡಿ ಮತ್ತು ಸಸಿಗಳನ್ನು ಶೇಡ್ ಕ್ಲಾತ್‌ನಿಂದ ಮುಚ್ಚಿ. ನೇರ ಸೂರ್ಯ ಬೆಳಕು ತಪ್ಪಿಸಿ.');


USE krishidisha;

INSERT INTO crops (
  slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
  sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
  irrigation, irrigationkn, soilphmin, soilphmax,
  fertilizerbaseline, fertilizerbaselinekn, info, infokn,
  cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
  cultivationguide_spacing, cultivationguide_yield,
  cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
  cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
('barley','Barley','ಜೋಳದ ಹಣ್ಣು','Rabi','ರಬೀ',120,'Medium','ಮಧ್ಯಮ',
 'Nov–Dec','ನವೆಂಬರ್–ಡಿಸೆಂಬರ್','Mar–Apr','ಮಾರ್ಚ್–ಏಪ್ರಿಲ್',
 'Rainfed / Irrigated','ಮಳೆಯಾಧಾರಿತ / ನೀರಾವರಿ',6.0,7.5,
 'NPK 15:15:15','ಎನ್‌ಪಿಕೆ 15:15:15',
 'Cool-season cereal grown in northern plains.','ಉತ್ತರ ಪ್ರದೇಶಗಳಲ್ಲಿ ಬೆಳೆಯುವ ತಂಪು ಹವಾಮಾನ ಧಾನ್ಯ.',
 'Cool dry','Loamy soil','100–120 kg/ha','20x10 cm','2.5–3 t/ha',
 'ತಂಪು ಒಣ','ಲೋಮಿ ಮಣ್ಣು','100–120 ಕೆಜಿ/ಹೆ','20x10 ಸೆಂ','2.5–3 ಟನ್/ಹೆ'),

('foxtail_millet','Foxtail Millet','ನವಣೆ','Kharif','ಖರಿಫ್',85,'Short','ಕಡಿಮೆ',
 'June–July','ಜೂನ್–ಜುಲೈ','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,7.5,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Drought-tolerant millet with short duration.','ಕಡಿಮೆ ಅವಧಿಯ ಒಣ ಹವಾಮಾನ ಮಿಲೆಟ್.',
 'Warm dry','Red loam','10–12 kg/ha','22x7.5 cm','2–3 t/ha',
 'ಬಿಸಿ ಒಣ','ಕೆಂಪು ಮಣ್ಣು','10–12 ಕೆಜಿ/ಹೆ','22x7.5 ಸೆಂ','2–3 ಟನ್/ಹೆ'),

('barnyard_millet','Barnyard Millet','ಊದಲು','Kharif','ಖರಿಫ್',90,'Short','ಕಡಿಮೆ',
 'June–July','ಜೂನ್–ಜುಲೈ','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,7.5,
 'NPK 10:26:26','ಎನ್‌ಪಿಕೆ 10:26:26',
 'Fast-growing millet; suitable for hilly soils.','ವೇಗವಾಗಿ ಬೆಳೆಯುವ ಮಿಲೆಟ್; ಪರ್ವತ ಪ್ರದೇಶಗಳಿಗೆ ಸೂಕ್ತ.',
 'Warm humid','Sandy loam','8–10 kg/ha','22x10 cm','2–2.5 t/ha',
 'ಬಿಸಿ ತೇವ','ಮರಳು ಲೋಮಿ','8–10 ಕೆಜಿ/ಹೆ','22x10 ಸೆಂ','2–2.5 ಟನ್/ಹೆ'),

('little_millet','Little Millet','ಸಾಮೆ','Kharif','ಖರಿಫ್',90,'Short','ಕಡಿಮೆ',
 'June–July','ಜೂನ್–ಜುಲೈ','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,7.5,
 'FYM + NPK 15:15:15','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 15:15:15',
 'Short-duration millet for dry zones.','ಒಣ ಪ್ರದೇಶದ ಕಡಿಮೆ ಅವಧಿಯ ಮಿಲೆಟ್.',
 'Warm dry','Red loam','8–10 kg/ha','22x10 cm','2–2.5 t/ha',
 'ಬಿಸಿ ಒಣ','ಕೆಂಪು ಮಣ್ಣು','8–10 ಕೆಜಿ/ಹೆ','22x10 ಸೆಂ','2–2.5 ಟನ್/ಹೆ'),

('kodo_millet','Kodo Millet','ಹಾರಕ','Kharif','ಖರಿಫ್',100,'Medium','ಮಧ್ಯಮ',
 'June–July','ಜೂನ್–ಜುಲೈ','Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,7.5,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Hardy millet for poor soils and drought areas.','ಕಡಿಮೆ ಫಲವತ್ತಾದ ಮಣ್ಣು ಮತ್ತು ಒಣ ಪ್ರದೇಶಗಳಿಗೆ ಸೂಕ್ತ ಮಿಲೆಟ್.',
 'Warm dry','Light loam','8–10 kg/ha','22x10 cm','2–3 t/ha',
 'ಬಿಸಿ ಒಣ','ಲಘು ಲೋಮಿ','8–10 ಕೆಜಿ/ಹೆ','22x10 ಸೆಂ','2–3 ಟನ್/ಹೆ'),

('proso_millet','Proso Millet','ಬರಗು','Kharif','ಖರಿಫ್',90,'Short','ಕಡಿಮೆ',
 'June–July','ಜೂನ್–ಜುಲೈ','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,7.5,
 'NPK 10:20:10','ಎನ್‌ಪಿಕೆ 10:20:10',
 'Drought-tolerant millet for dry belts.','ಒಣ ಪ್ರದೇಶಗಳಲ್ಲಿ ಬೆಳೆಯುವ ಮಿಲೆಟ್.',
 'Warm dry','Sandy loam','8–10 kg/ha','22x10 cm','2–3 t/ha',
 'ಬಿಸಿ ಒಣ','ಮರಳು ಲೋಮಿ','8–10 ಕೆಜಿ/ಹೆ','22x10 ಸೆಂ','2–3 ಟನ್/ಹೆ'),

('lentil','Lentil','ಮಸೂರ ಬೇಳೆ','Rabi','ರಬೀ',110,'Medium','ಮಧ್ಯಮ',
 'Nov–Dec','ನವೆಂಬರ್–ಡಿಸೆಂಬರ್','Mar–Apr','ಮಾರ್ಚ್–ಏಪ್ರಿಲ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,8.0,
 'Rhizobium + DAP','ರೈಜೋಬಿಯಮ್ + ಡಿಎಪಿ',
 'Pulse suited for cool dry zones.','ತಂಪು ಒಣ ಪ್ರದೇಶಗಳಿಗೆ ಸೂಕ್ತ ಬೇಳೆ.',
 'Cool dry','Loamy soil','30–35 kg/ha','25x10 cm','1–1.5 t/ha',
 'ತಂಪು ಒಣ','ಲೋಮಿ ಮಣ್ಣು','30–35 ಕೆಜಿ/ಹೆ','25x10 ಸೆಂ','1–1.5 ಟನ್/ಹೆ'),

('horse_gram','Horse Gram','ಹುರುಳಿ','Rabi','ರಬೀ',100,'Medium','ಮಧ್ಯಮ',
 'Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್','Feb–Mar','ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,7.5,
 'Rhizobium + NPK','ರೈಜೋಬಿಯಮ್ + ಎನ್‌ಪಿಕೆ',
 'Drought-tolerant pulse for dry tracts.','ಒಣ ಪ್ರದೇಶದ ಬೇಳೆ.',
 'Warm dry','Red loam','25–30 kg/ha','30x10 cm','0.8–1 t/ha',
 'ಬಿಸಿ ಒಣ','ಕೆಂಪು ಮಣ್ಣು','25–30 ಕೆಜಿ/ಹೆ','30x10 ಸೆಂ','0.8–1 ಟನ್/ಹೆ'),

('linseed','Linseed','ಆಲಸಿ','Rabi','ರಬೀ',120,'Medium','ಮಧ್ಯಮ',
 'Nov–Dec','ನವೆಂಬರ್–ಡಿಸೆಂಬರ್','Mar–Apr','ಮಾರ್ಚ್–ಏಪ್ರಿಲ್',
 'Rainfed / Irrigated','ಮಳೆಯಾಧಾರಿತ / ನೀರಾವರಿ',6.0,7.5,
 'NPK 15:15:15','ಎನ್‌ಪಿಕೆ 15:15:15',
 'Oilseed crop grown in cool regions.','ತಂಪು ಪ್ರದೇಶಗಳಲ್ಲಿ ಬೆಳೆಯುವ ಎಣ್ಣೆ ಬೀಜ ಬೆಳೆ.',
 'Cool dry','Loamy soil','25–30 kg/ha','30x10 cm','1–1.5 t/ha',
 'ತಂಪು ಒಣ','ಲೋಮಿ ಮಣ್ಣು','25–30 ಕೆಜಿ/ಹೆ','30x10 ಸೆಂ','1–1.5 ಟನ್/ಹೆ'),

('safflower','Safflower','ಕುಸುಮ್','Rabi','ರಬೀ',120,'Medium','ಮಧ್ಯಮ',
 'Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್','Feb–Mar','ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,8.0,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Oilseed tolerant to drought.','ಒಣ ಹವಾಮಾನಕ್ಕೆ ತಾಳುವ ಎಣ್ಣೆ ಬೀಜ ಬೆಳೆ.',
 'Cool dry','Loamy soil','5–6 kg/ha','45x20 cm','1.5–2 t/ha',
 'ತಂಪು ಒಣ','ಲೋಮಿ ಮಣ್ಣು','5–6 ಕೆಜಿ/ಹೆ','45x20 ಸೆಂ','1.5–2 ಟನ್/ಹೆ');

USE krishidisha;

INSERT INTO crops (
  slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
  sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
  irrigation, irrigationkn, soilphmin, soilphmax,
  fertilizerbaseline, fertilizerbaselinekn, info, infokn,
  cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
  cultivationguide_spacing, cultivationguide_yield,
  cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
  cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
('castor','Castor','ಆರಂಡಿ','Kharif','ಖರಿಫ್',160,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Dec–Jan','ಡಿಸೆಂ–ಜನ',
 'Rainfed / Irrigated','ಮಳೆಯಾಧಾರಿತ / ನೀರಾವರಿ',6.0,8.0,
 'NPK 15:15:15 + FYM','ಎನ್‌ಪಿಕೆ 15:15:15 + ಎಫ್‌ವೈಎಂ',
 'Oilseed crop grown in semi-arid zones.','ಅರ್ಧ ಒಣ ಪ್ರದೇಶಗಳಲ್ಲಿ ಬೆಳೆಯುವ ಎಣ್ಣೆ ಬೀಜ ಬೆಳೆ.',
 'Warm dry','Sandy loam','8–10 kg/ha','90x60 cm','1.5–2 t/ha',
 'ಬಿಸಿ ಒಣ','ಮರಳು ಲೋಮಿ','8–10 ಕೆಜಿ/ಹೆ','90x60 ಸೆಂ','1.5–2 ಟನ್/ಹೆ'),

('sesame','Sesame','ಎಳ್ಳು','Kharif','ಖರಿಫ್',100,'Medium','ಮಧ್ಯಮ',
 'June–July','ಜೂನ್–ಜುಲೈ','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',5.5,8.0,
 'FYM + NPK 10:26:26','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 10:26:26',
 'High-value oilseed grown in dry belts.','ಒಣ ಪ್ರದೇಶಗಳಲ್ಲಿ ಬೆಳೆಯುವ ಬೆಲೆಬಾಳುವ ಎಣ್ಣೆ ಬೀಜ ಬೆಳೆ.',
 'Warm dry','Light loam','4–5 kg/ha','30x10 cm','1–1.2 t/ha',
 'ಬಿಸಿ ಒಣ','ಲಘು ಲೋಮಿ','4–5 ಕೆಜಿ/ಹೆ','30x10 ಸೆಂ','1–1.2 ಟನ್/ಹೆ'),

('niger','Niger Seed','ರಮಿಳೆ ಬೀಜ','Kharif','ಖರಿಫ್',110,'Medium','ಮಧ್ಯಮ',
 'June–July','ಜೂನ್–ಜುಲೈ','Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',5.0,7.5,
 'FYM + NPK 12:32:16','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 12:32:16',
 'Minor oilseed tolerant to poor soils.','ಕಡಿಮೆ ಫಲವತ್ತಾದ ಮಣ್ಣಿಗೆ ತಾಳುವ ಎಣ್ಣೆ ಬೀಜ.',
 'Warm dry','Sandy loam','5–6 kg/ha','30x15 cm','1–1.5 t/ha',
 'ಬಿಸಿ ಒಣ','ಮರಳು ಲೋಮಿ','5–6 ಕೆಜಿ/ಹೆ','30x15 ಸೆಂ','1–1.5 ಟನ್/ಹೆ'),

('cucumber','Cucumber','ಸೌತೆಕಾಯಿ','Kharif','ಖರಿಫ್',90,'Medium','ಮಧ್ಯಮ',
 'June–July','ಜೂನ್–ಜುಲೈ','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Irrigated','ನೀರಾವರಿ',5.5,7.5,
 'FYM + NPK 10:20:10','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 10:20:10',
 'Creeper vegetable requiring warm climate.','ಬಿಸಿ ಹವಾಮಾನದಲ್ಲಿ ಬೆಳೆಯುವ ಕ್ರೀಪರ್ ತರಕಾರಿ.',
 'Warm humid','Loamy soil','1 kg/ha (seed)','60x60 cm','15–18 t/ha',
 'ಬಿಸಿ ತೇವ','ಲೋಮಿ ಮಣ್ಣು','1 ಕೆಜಿ/ಹೆ (ಬೀಜ)','60x60 ಸೆಂ','15–18 ಟನ್/ಹೆ'),

('pumpkin','Pumpkin','ಕುಂಭಳಕಾಯಿ','Kharif','ಖರಿಫ್',120,'Medium','ಮಧ್ಯಮ',
 'June–July','ಜೂನ್–ಜುಲೈ','Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್',
 'Irrigated','ನೀರಾವರಿ',6.0,7.5,
 'FYM + NPK 15:15:15','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 15:15:15',
 'Creeper vegetable with high yield.','ಹೆಚ್ಚು ಫಲದ ಕ್ರೀಪರ್ ತರಕಾರಿ.',
 'Warm humid','Loamy soil','1 kg/ha','200x200 cm','25–30 t/ha',
 'ಬಿಸಿ ತೇವ','ಲೋಮಿ ಮಣ್ಣು','1 ಕೆಜಿ/ಹೆ','200x200 ಸೆಂ','25–30 ಟನ್/ಹೆ'),

('ridge_gourd','Ridge Gourd','ಹೀರೇಕಾಯಿ','Kharif','ಖರಿಫ್',110,'Medium','ಮಧ್ಯಮ',
 'June–July','ಜೂನ್–ಜುಲೈ','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Irrigated','ನೀರಾವರಿ',5.5,7.0,
 'FYM + NPK 12:32:16','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 12:32:16',
 'Common kitchen vegetable; needs support.','ಆಧಾರ ಅಗತ್ಯವಿರುವ ಸಾಮಾನ್ಯ ತರಕಾರಿ.',
 'Warm humid','Loamy soil','1 kg/ha','150x150 cm','15–20 t/ha',
 'ಬಿಸಿ ತೇವ','ಲೋಮಿ ಮಣ್ಣು','1 ಕೆಜಿ/ಹೆ','150x150 ಸೆಂ','15–20 ಟನ್/ಹೆ'),

('bitter_gourd','Bitter Gourd','ಹಾಗಲಕಾಯಿ','Kharif','ಖರಿಫ್',120,'Medium','ಮಧ್ಯಮ',
 'June–July','ಜೂನ್–ಜುಲೈ','Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್',
 'Irrigated','ನೀರಾವರಿ',5.5,7.5,
 'FYM + NPK 10:20:20','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 10:20:20',
 'Popular vegetable rich in iron.','ಕಬ್ಬಿಣ ಸಮೃದ್ಧ ಜನಪ್ರಿಯ ತರಕಾರಿ.',
 'Warm humid','Loamy soil','1 kg/ha','200x150 cm','15–20 t/ha',
 'ಬಿಸಿ ತೇವ','ಲೋಮಿ ಮಣ್ಣು','1 ಕೆಜಿ/ಹೆ','200x150 ಸೆಂ','15–20 ಟನ್/ಹೆ'),

('bottle_gourd','Bottle Gourd','ಸೊರೆಕಾಯಿ','Kharif','ಖರಿಫ್',100,'Medium','ಮಧ್ಯಮ',
 'June–July','ಜೂನ್–ಜುಲೈ','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Irrigated','ನೀರಾವರಿ',6.0,7.5,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Creeper vegetable; good for summer.','ಬೇಸಿಗೆಯಲ್ಲಿ ಬೆಳೆಯುವ ಕ್ರೀಪರ್ ತರಕಾರಿ.',
 'Warm humid','Loamy soil','1 kg/ha','200x150 cm','20–25 t/ha',
 'ಬಿಸಿ ತೇವ','ಲೋಮಿ ಮಣ್ಣು','1 ಕೆಜಿ/ಹೆ','200x150 ಸೆಂ','20–25 ಟನ್/ಹೆ'),

('drumstick','Drumstick (Moringa)','ನೂಗೆಕಾಯಿ','Kharif','ಖರಿಫ್',240,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Feb–Mar','ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
 'Irrigated','ನೀರಾವರಿ',6.0,7.5,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Perennial vegetable tree rich in vitamins.','ವಿಟಮಿನ್ ಸಮೃದ್ಧ ದೀರ್ಘಕಾಲಿಕ ತರಕಾರಿ ಮರ.',
 'Warm humid','Sandy loam','2500 saplings/ha','2.5x2.5 m','25–30 t/ha',
 'ಬಿಸಿ ತೇವ','ಮರಳು ಲೋಮಿ','2500 ನೆಟ್ಟು/ಹೆ','2.5x2.5 ಮೀ','25–30 ಟನ್/ಹೆ'),

('beetroot','Beetroot','ಬೀಟ್ರೂಟ್','Rabi','ರಬೀ',100,'Medium','ಮಧ್ಯಮ',
 'Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್','Feb–Mar','ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
 'Irrigated','ನೀರಾವರಿ',6.0,7.0,
 'NPK 15:15:15','ಎನ್‌ಪಿಕೆ 15:15:15',
 'Root vegetable rich in iron and sugar.','ಕಬ್ಬಿಣ ಮತ್ತು ಸಕ್ಕರೆಯಲ್ಲಿ ಸಮೃದ್ಧ ಬೇರು ತರಕಾರಿ.',
 'Cool moist','Sandy loam','5 kg/ha','30x10 cm','15–18 t/ha',
 'ತಂಪು ತೇವ','ಮರಳು ಲೋಮಿ','5 ಕೆಜಿ/ಹೆ','30x10 ಸೆಂ','15–18 ಟನ್/ಹೆ'),

('radish','Radish','ಮೂಲಂಗಿ','Rabi','ರಬೀ',60,'Short','ಕಡಿಮೆ',
 'Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್','Jan–Feb','ಜನವರಿ–ಫೆಬ್ರವರಿ',
 'Irrigated','ನೀರಾವರಿ',6.0,7.5,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Fast-growing root vegetable.','ವೇಗವಾಗಿ ಬೆಳೆಯುವ ಬೇರು ತರಕಾರಿ.',
 'Cool moist','Sandy loam','5 kg/ha','30x10 cm','15–20 t/ha',
 'ತಂಪು ತೇವ','ಮರಳು ಲೋಮಿ','5 ಕೆಜಿ/ಹೆ','30x10 ಸೆಂ','15–20 ಟನ್/ಹೆ');

USE krishidisha;

INSERT INTO crops (
  slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
  sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
  irrigation, irrigationkn, soilphmin, soilphmax,
  fertilizerbaseline, fertilizerbaselinekn, info, infokn,
  cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
  cultivationguide_spacing, cultivationguide_yield,
  cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
  cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
('apple','Apple','ಸೇಬು','Rabi','ರಬೀ',180,'Long','ದೀರ್ಘ',
 'Dec–Jan','ಡಿಸೆಂ–ಜನ','June–July','ಜೂನ್–ಜುಲೈ',
 'Irrigated','ನೀರಾವರಿ',5.5,6.5,
 'FYM + NPK 10:20:20','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 10:20:20',
 'Temperate fruit grown in hilly regions.','ಪರ್ವತ ಪ್ರದೇಶಗಳಲ್ಲಿ ಬೆಳೆಯುವ ಹಣ್ಣು.',
 'Cool climate','Loamy soil','2000 saplings/ha','4x4 m','15–20 t/ha',
 'ತಂಪು ಹವಾಮಾನ','ಲೋಮಿ ಮಣ್ಣು','2000 ನೆಟ್ಟು/ಹೆ','4x4 ಮೀ','15–20 ಟನ್/ಹೆ'),

('pear','Pear','ನಾಶ್ಪತಿ','Rabi','ರಬೀ',180,'Long','ದೀರ್ಘ',
 'Dec–Jan','ಡಿಸೆಂ–ಜನ','June–July','ಜೂನ್–ಜುಲೈ',
 'Irrigated','ನೀರಾವರಿ',5.5,7.0,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Temperate fruit similar to apple.','ಸೇಬಿಗೆ ಹೋಲುವ ಪರ್ವತ ಪ್ರದೇಶದ ಹಣ್ಣು.',
 'Cool humid','Loamy soil','2500 saplings/ha','4x4 m','15–18 t/ha',
 'ತಂಪು ತೇವ','ಲೋಮಿ ಮಣ್ಣು','2500 ನೆಟ್ಟು/ಹೆ','4x4 ಮೀ','15–18 ಟನ್/ಹೆ'),

('guava','Guava','ಸೀಬೆಹಣ್ಣು','Kharif','ಖರಿಫ್',150,'Medium','ಮಧ್ಯಮ',
 'June–July','ಜೂನ್–ಜುಲೈ','Nov–Dec','ನವೆಂಬರ್–ಡಿಸೆಂಬರ್',
 'Irrigated','ನೀರಾವರಿ',6.0,7.5,
 'FYM + NPK 15:15:15','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 15:15:15',
 'Tropical fruit suitable for all soils.','ಎಲ್ಲಾ ಮಣ್ಣಿಗೂ ಸೂಕ್ತ ಉಷ್ಣವಲಯದ ಹಣ್ಣು.',
 'Warm humid','Alluvial soil','2000 saplings/ha','4x4 m','20–25 t/ha',
 'ಬಿಸಿ ತೇವ','ಅಲ್ಯೂವಿಯಲ್ ಮಣ್ಣು','2000 ನೆಟ್ಟು/ಹೆ','4x4 ಮೀ','20–25 ಟನ್/ಹೆ'),

('papaya','Papaya','ಪಪ್ಪಾಯಿ','Kharif','ಖರಿಫ್',240,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Feb–Mar','ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
 'Irrigated','ನೀರಾವರಿ',6.0,7.5,
 'FYM + NPK 10:20:20','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 10:20:20',
 'Fast-growing fruit; bears in 9 months.','9 ತಿಂಗಳಲ್ಲಿ ಫಲ ನೀಡುವ ವೇಗದ ಹಣ್ಣು.',
 'Warm humid','Loamy soil','4000 plants/ha','2x2 m','50–60 t/ha',
 'ಬಿಸಿ ತೇವ','ಲೋಮಿ ಮಣ್ಣು','4000 ನೆಟ್ಟು/ಹೆ','2x2 ಮೀ','50–60 ಟನ್/ಹೆ'),

('pineapple','Pineapple','ಅನಾನಸ್','Kharif','ಖರಿಫ್',365,'Long','ದೀರ್ಘ',
 'May–June','ಮೇ–ಜೂನ್','May–June (next year)','ಮುಂದಿನ ವರ್ಷ ಮೇ–ಜೂನ್',
 'Rainfed / Irrigated','ಮಳೆಯಾಧಾರಿತ / ನೀರಾವರಿ',4.5,6.5,
 'FYM + NPK 12:12:17','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 12:12:17',
 'Tropical fruit requiring well-drained soil.','ನೀರಿನ ಹರಿವಿನ ಮಣ್ಣಿನಲ್ಲಿ ಬೆಳೆಯುವ ಉಷ್ಣವಲಯದ ಹಣ್ಣು.',
 'Warm humid','Sandy loam','35,000 suckers/ha','25x60 cm','50–60 t/ha',
 'ಬಿಸಿ ತೇವ','ಮರಳು ಲೋಮಿ','35,000 ನೆಟ್ಟು/ಹೆ','25x60 ಸೆಂ','50–60 ಟನ್/ಹೆ'),

('sapota','Sapota (Chikoo)','ಸಪೋಟಾ','Annual','ವಾರ್ಷಿಕ',365,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','All year','ವರ್ಷಪೂರ್ತಿ',
 'Irrigated','ನೀರಾವರಿ',6.0,8.0,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Perennial fruit tree for tropical regions.','ಉಷ್ಣವಲಯ ಪ್ರದೇಶದ ದೀರ್ಘಕಾಲದ ಹಣ್ಣು.',
 'Warm humid','Sandy loam','200 plants/ha','10x10 m','15–20 t/ha',
 'ಬಿಸಿ ತೇವ','ಮರಳು ಲೋಮಿ','200 ನೆಟ್ಟು/ಹೆ','10x10 ಮೀ','15–20 ಟನ್/ಹೆ'),

('jamun','Jamun','ನೇರಳೆ','Annual','ವಾರ್ಷಿಕ',365,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','May–June','ಮೇ–ಜೂನ್',
 'Rainfed / Irrigated','ಮಳೆಯಾಧಾರಿತ / ನೀರಾವರಿ',6.0,7.5,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Evergreen fruit tree suited for plains.','ಮೈದಾನ ಪ್ರದೇಶಗಳಿಗೆ ಸೂಕ್ತ ಸದಾಹರಿತ ಮರ.',
 'Warm humid','Loamy soil','300 saplings/ha','10x10 m','20–25 t/ha',
 'ಬಿಸಿ ತೇವ','ಲೋಮಿ ಮಣ್ಣು','300 ನೆಟ್ಟು/ಹೆ','10x10 ಮೀ','20–25 ಟನ್/ಹೆ'),

('amla','Amla (Gooseberry)','ನೇಳ್ಲಿಕಾಯಿ','Rabi','ರಬೀ',240,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Feb–Mar','ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
 'Rainfed / Irrigated','ಮಳೆಯಾಧಾರಿತ / ನೀರಾವರಿ',6.0,8.0,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Medicinal fruit tree; rich in vitamin C.','ವಿಟಮಿನ್ ಸಿ ಸಮೃದ್ಧ ಔಷಧೀಯ ಹಣ್ಣು ಮರ.',
 'Warm dry','Sandy loam','400 plants/ha','8x8 m','15–20 t/ha',
 'ಬಿಸಿ ಒಣ','ಮರಳು ಲೋಮಿ','400 ನೆಟ್ಟು/ಹೆ','8x8 ಮೀ','15–20 ಟನ್/ಹೆ'),


('cumin','Cumin','ಜೀರಿಗೆ','Rabi','ರಬೀ',120,'Medium','ಮಧ್ಯಮ',
 'Nov–Dec','ನವೆಂಬರ್–ಡಿಸೆಂಬರ್','Mar–Apr','ಮಾರ್ಚ್–ಏಪ್ರಿಲ್',
 'Irrigated','ನೀರಾವರಿ',6.5,8.0,
 'FYM + NPK 10:26:26','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 10:26:26',
 'Spice crop used for seasoning.','ಸುವಾಸನೆಗೆ ಬಳಸುವ ಮಸಾಲೆ ಬೆಳೆ.',
 'Cool dry','Loamy soil','12–15 kg/ha','25x10 cm','0.8–1 t/ha',
 'ತಂಪು ಒಣ','ಲೋಮಿ ಮಣ್ಣು','12–15 ಕೆಜಿ/ಹೆ','25x10 ಸೆಂ','0.8–1 ಟನ್/ಹೆ');

USE krishidisha;

INSERT INTO crops (
  slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
  sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
  irrigation, irrigationkn, soilphmin, soilphmax,
  fertilizerbaseline, fertilizerbaselinekn, info, infokn,
  cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
  cultivationguide_spacing, cultivationguide_yield,
  cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
  cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
('black_pepper','Black Pepper','ಮೆಣಸು','Kharif','ಖರಿಫ್',365,'Long','ದೀರ್ಘ',
 'May–June','ಮೇ–ಜೂನ್','Year-round','ವರ್ಷಪೂರ್ತಿ',
 'Irrigated','ನೀರಾವರಿ',5.5,6.5,
 'FYM + NPK 15:15:20','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 15:15:20',
 'Climbing spice crop grown in humid regions.','ತೇವ ಪ್ರದೇಶಗಳಲ್ಲಿ ಬೆಳೆಯುವ ಹತ್ತುವ ಮಸಾಲೆ ಬೆಳೆ.',
 'Warm humid','Loamy soil','2500 vines/ha','2x2 m','2–3 t/ha',
 'ಬಿಸಿ ತೇವ','ಲೋಮಿ ಮಣ್ಣು','2500 ಹಳ್ಳಿಗಳು/ಹೆ','2x2 ಮೀ','2–3 ಟನ್/ಹೆ'),


('clove','Clove','ಲವಂಗ','Annual','ವಾರ್ಷಿಕ',365,'Long','ದೀರ್ಘ',
 'May–June','ಮೇ–ಜೂನ್','Year-round','ವರ್ಷಪೂರ್ತಿ',
 'Irrigated','ನೀರಾವರಿ',5.0,6.5,
 'FYM + NPK 10:10:10','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 10:10:10',
 'Perennial spice tree grown in Western Ghats.','ಪಶ್ಚಿಮ ಘಟ್ಟಗಳಲ್ಲಿ ಬೆಳೆಯುವ ಮಸಾಲೆ ಮರ.',
 'Humid','Sandy loam','1000 trees/ha','6x6 m','3–4 t/ha',
 'ತೇವ','ಮರಳು ಲೋಮಿ','1000 ಮರಗಳು/ಹೆ','6x6 ಮೀ','3–4 ಟನ್/ಹೆ'),

('nutmeg','Nutmeg','ಜಾಯಿಕೆ','Annual','ವಾರ್ಷಿಕ',365,'Long','ದೀರ್ಘ',
 'May–June','ಮೇ–ಜೂನ್','Year-round','ವರ್ಷಪೂರ್ತಿ',
 'Irrigated','ನೀರಾವರಿ',5.5,7.0,
 'FYM + NPK 12:12:18','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 12:12:18',
 'Spice tree valued for seeds and mace.','ಬೀಜ ಮತ್ತು ಮೇಶ್‌ಗಾಗಿ ಬೆಳೆಸುವ ಮಸಾಲೆ ಮರ.',
 'Humid tropical','Loamy soil','1000 plants/ha','6x6 m','2–3 t/ha',
 'ತೇವ ಉಷ್ಣ','ಲೋಮಿ ಮಣ್ಣು','1000 ನೆಟ್ಟು/ಹೆ','6x6 ಮೀ','2–3 ಟನ್/ಹೆ'),

('tea','Tea','ಚಹಾ','Kharif','ಖರಿಫ್',365,'Long','ದೀರ್ಘ',
 'May–June','ಮೇ–ಜೂನ್','Year-round','ವರ್ಷಪೂರ್ತಿ',
 'Rainfed / Irrigated','ಮಳೆಯಾಧಾರಿತ / ನೀರಾವರಿ',4.5,6.0,
 'FYM + NPK 12:12:17','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 12:12:17',
 'Evergreen plantation crop of hilly regions.','ಪರ್ವತ ಪ್ರದೇಶದ ಸದಾಹರಿತ ತೋಟ ಬೆಳೆ.',
 'Humid','Acidic soil','8000 bushes/ha','1x1 m','2–3 t/ha',
 'ತೇವ','ಆಮ್ಲ ಮಣ್ಣು','8000 ಗಿಡಗಳು/ಹೆ','1x1 ಮೀ','2–3 ಟನ್/ಹೆ'),

('rubber','Rubber','ರಬ್ಬರ್','Annual','ವಾರ್ಷಿಕ',365,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Year-round','ವರ್ಷಪೂರ್ತಿ',
 'Rainfed / Irrigated','ಮಳೆಯಾಧಾರಿತ / ನೀರಾವರಿ',4.5,6.5,
 'FYM + NPK 10:10:10','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 10:10:10',
 'Plantation tree for latex production.','ರಬ್ಬರ್ ಉತ್ಪಾದನೆಗೆ ಬೆಳೆಯುವ ಮರ.',
 'Warm humid','Lateritic soil','500 trees/ha','7x7 m','2 t/ha latex',
 'ಬಿಸಿ ತೇವ','ಲೇಟರೈಟ್ ಮಣ್ಣು','500 ಮರಗಳು/ಹೆ','7x7 ಮೀ','2 ಟನ್ ಲೇಟೆಕ್ಸ್/ಹೆ'),

('betel_vine','Betel Vine','ವೀಳ್ಯದೆಲೆ','Kharif','ಖರಿಫ್',365,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Year-round','ವರ್ಷಪೂರ್ತಿ',
 'Irrigated','ನೀರಾವರಿ',5.5,7.0,
 'Organic manure + NPK','ಸಾವಯವ ಗೊಬ್ಬರ + ಎನ್‌ಪಿಕೆ',
 'Climbing creeper used for leaves.','ಎಲೆಗಾಗಿ ಬೆಳೆಯುವ ಹತ್ತುವ ಬೆಳೆ.',
 'Warm humid','Loamy soil','Cuttings','1x1 m','15,000 leaves/ha',
 'ಬಿಸಿ ತೇವ','ಲೋಮಿ ಮಣ್ಣು','ಕಟ್‌ಟಿಂಗ್‌ಗಳು','1x1 ಮೀ','15,000 ಎಲೆಗಳು/ಹೆ'),

('bamboo','Bamboo','ಬಾಂಬೂ','Annual','ವಾರ್ಷಿಕ',365,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Year-round','ವರ್ಷಪೂರ್ತಿ',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',5.0,6.5,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Multipurpose woody grass used for furniture and paper.','ಗೃಹೋಪಯೋಗಿ ಮತ್ತು ಕಾಗದಕ್ಕೆ ಬಳಸುವ ಬಹುಉಪಯೋಗಿ ಬೆಳೆ.',
 'Warm humid','Alluvial soil','1000 clumps/ha','6x6 m','20–25 t/ha',
 'ಬಿಸಿ ತೇವ','ಅಲ್ಯೂವಿಯಲ್ ಮಣ್ಣು','1000 ಗುಂಪುಗಳು/ಹೆ','6x6 ಮೀ','20–25 ಟನ್/ಹೆ'),

('aloe_vera','Aloe Vera','ಕತ್ತಾಳೆ','Rabi','ರಬೀ',240,'Long','ದೀರ್ಘ',
 'Feb–Mar','ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್','Sept–Oct','ಸೆಪ್ಟೆಂಬರ್–ಅಕ್ಟೋಬರ್',
 'Irrigated','ನೀರಾವರಿ',6.0,8.5,
 'Organic manure','ಸಾವಯವ ಗೊಬ್ಬರ',
 'Medicinal herb used in cosmetics and medicine.','ಔಷಧಿ ಮತ್ತು ಸೌಂದರ್ಯ ಉತ್ಪನ್ನಗಳಲ್ಲಿ ಬಳಸುವ ಔಷಧೀಯ ಸಸ್ಯ.',
 'Warm dry','Sandy loam','20,000 suckers/ha','40x40 cm','15–20 t/ha',
 'ಬಿಸಿ ಒಣ','ಮರಳು ಲೋಮಿ','20,000 ನೆಟ್ಟು/ಹೆ','40x40 ಸೆಂ','15–20 ಟನ್/ಹೆ'),

('tulsi','Tulsi (Holy Basil)','ತುಳಸಿ','Rabi','ರಬೀ',120,'Medium','ಮಧ್ಯಮ',
 'Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್','Feb–Mar','ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
 'Irrigated','ನೀರಾವರಿ',6.0,8.0,
 'Organic manure + NPK','ಸಾವಯವ ಗೊಬ್ಬರ + ಎನ್‌ಪಿಕೆ',
 'Sacred aromatic herb used medicinally.','ಔಷಧೀಯ ಮತ್ತು ಧಾರ್ಮಿಕವಾಗಿ ಬಳಕೆಯ ಸಸ್ಯ.',
 'Warm dry','Loamy soil','5 kg/ha seed','40x40 cm','2–3 t/ha leaves',
 'ಬಿಸಿ ಒಣ','ಲೋಮಿ ಮಣ್ಣು','5 ಕೆಜಿ/ಹೆ ಬೀಜ','40x40 ಸೆಂ','2–3 ಟನ್ ಎಲೆಗಳು/ಹೆ'),

('lemongrass','Lemongrass','ಲೆಮನ್ ಗ್ರಾಸ್','Kharif','ಖರಿಫ್',240,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Year-round','ವರ್ಷಪೂರ್ತಿ',
 'Irrigated','ನೀರಾವರಿ',5.0,7.5,
 'Organic manure + NPK','ಸಾವಯವ ಗೊಬ್ಬರ + ಎನ್‌ಪಿಕೆ',
 'Aromatic grass used for oil extraction.','ತೈಲದ ಉತ್ಪಾದನೆಗೆ ಬಳಸುವ ಸುಗಂಧ ಹುಲ್ಲು.',
 'Warm humid','Loamy soil','30,000 slips/ha','45x45 cm','12–15 t/ha',
 'ಬಿಸಿ ತೇವ','ಲೋಮಿ ಮಣ್ಣು','30,000 ನೆಟ್ಟು/ಹೆ','45x45 ಸೆಂ','12–15 ಟನ್/ಹೆ'),

('stevia','Stevia','ಸ್ಟೀವಿಯಾ','Kharif','ಖರಿಫ್',240,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Year-round','ವರ್ಷಪೂರ್ತಿ',
 'Irrigated','ನೀರಾವರಿ',6.0,7.5,
 'Organic manure','ಸಾವಯವ ಗೊಬ್ಬರ',
 'Natural sweetener plant.','ಸ್ವಾಭಾವಿಕ ಸಿಹಿ ಸಸ್ಯ.',
 'Warm humid','Loamy soil','30,000 slips/ha','45x30 cm','12–15 t/ha leaves',
 'ಬಿಸಿ ತೇವ','ಲೋಮಿ ಮಣ್ಣು','30,000 ನೆಟ್ಟು/ಹೆ','45x30 ಸೆಂ','12–15 ಟನ್ ಎಲೆಗಳು/ಹೆ'),

('ashwagandha','Ashwagandha','ಅಶ್ವಗಂಧ','Rabi','ರಬೀ',180,'Medium','ಮಧ್ಯಮ',
 'Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್','Mar–Apr','ಮಾರ್ಚ್–ಏಪ್ರಿಲ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,8.0,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Medicinal root crop.','ಔಷಧೀಯ ಬೇರು ಬೆಳೆ.',
 'Warm dry','Light red soil','8–10 kg/ha seed','30x30 cm','4–5 t/ha roots',
 'ಬಿಸಿ ಒಣ','ಹಗುರ ಕೆಂಪು ಮಣ್ಣು','8–10 ಕೆಜಿ/ಹೆ ಬೀಜ','30x30 ಸೆಂ','4–5 ಟನ್ ಬೇರು/ಹೆ'),

('brahmi','Brahmi','ಬ್ರಹ್ಮಿ','Rabi','ರಬೀ',150,'Medium','ಮಧ್ಯಮ',
 'Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್','Mar–Apr','ಮಾರ್ಚ್–ಏಪ್ರಿಲ್',
 'Irrigated','ನೀರಾವರಿ',6.0,7.5,
 'Organic manure','ಸಾವಯವ ಗೊಬ್ಬರ',
 'Medicinal herb used for memory enhancement.','ಸ್ಮರಣೆ ಹೆಚ್ಚಿಸಲು ಬಳಸುವ ಔಷಧೀಯ ಸಸ್ಯ.',
 'Warm humid','Clay loam','20,000 cuttings/ha','40x40 cm','10–12 t/ha',
 'ಬಿಸಿ ತೇವ','ಮಣ್ಣು ಲೋಮಿ','20,000 ಕಟ್‌ಟಿಂಗ್‌ಗಳು/ಹೆ','40x40 ಸೆಂ','10–12 ಟನ್/ಹೆ'),

('vetiver','Vetiver (Khus)','ವೇಟಿವರ್','Annual','ವಾರ್ಷಿಕ',365,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Year-round','ವರ್ಷಪೂರ್ತಿ',
 'Rainfed / Irrigated','ಮಳೆಯಾಧಾರಿತ / ನೀರಾವರಿ',6.0,8.0,
 'Organic manure','ಸಾವಯವ ಗೊಬ್ಬರ',
 'Aromatic grass used for perfumery.','ಸುಗಂಧ ತೈಲ ಉತ್ಪಾದನೆಗೆ ಬಳಸುವ ಸಸ್ಯ.',
 'Warm humid','Sandy loam','20,000 slips/ha','45x45 cm','8–10 t/ha roots',
 'ಬಿಸಿ ತೇವ','ಮರಳು ಲೋಮಿ','20,000 ನೆಟ್ಟು/ಹೆ','45x45 ಸೆಂ','8–10 ಟನ್ ಬೇರು/ಹೆ'),

('dragon_fruit','Dragon Fruit','ಡ್ರಾಗನ್ ಹಣ್ಣು','Kharif','ಖರಿಫ್',365,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Year-round','ವರ್ಷಪೂರ್ತಿ',
 'Irrigated','ನೀರಾವರಿ',5.5,7.5,
 'FYM + NPK','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ',
 'Exotic fruit with climbing cactus stem.','ಹತ್ತುವ ಕಾಕ್ಟಸ್‌ದ ಕಾಂಡದಿಂದ ಬೆಳೆಯುವ ಅಪರೂಪದ ಹಣ್ಣು.',
 'Warm dry','Sandy loam','1200 cuttings/ha','3x3 m','25–30 t/ha',
 'ಬಿಸಿ ಒಣ','ಮರಳು ಲೋಮಿ','1200 ಕಟ್‌ಟಿಂಗ್‌ಗಳು/ಹೆ','3x3 ಮೀ','25–30 ಟನ್/ಹೆ');


USE krishidisha;

INSERT INTO crops (
  slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
  sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
  irrigation, irrigationkn, soilphmin, soilphmax,
  fertilizerbaseline, fertilizerbaselinekn, info, infokn,
  cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
  cultivationguide_spacing, cultivationguide_yield,
  cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
  cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
('tobacco','Tobacco','ತಂಬಾಕು','Rabi','ರಬೀ',150,'Medium','ಮಧ್ಯಮ',
 'Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್','Feb–Mar','ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
 'Irrigated','ನೀರಾವರಿ',5.5,7.5,
 'FYM + NPK 20:20:20','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 20:20:20',
 'Commercial crop grown for leaf curing and export.','ಎಲೆಗಳನ್ನು ಒಣಗಿಸಲು ಮತ್ತು ರಫ್ತು ಮಾಡಲು ಬೆಳೆಯುವ ವಾಣಿಜ್ಯ ಬೆಳೆ.',
 'Warm dry','Sandy loam','1 kg/ha seed','90x60 cm','1.5–2 t/ha cured leaves',
 'ಬಿಸಿ ಒಣ','ಮರಳು ಲೋಮಿ','1 ಕೆಜಿ/ಹೆ ಬೀಜ','90x60 ಸೆಂ','1.5–2 ಟನ್ ಒಣ ಎಲೆಗಳು/ಹೆ'),

('jute','Jute','ಜ್ಯೂಟ್','Kharif','ಖರಿಫ್',150,'Medium','ಮಧ್ಯಮ',
 'May–June','ಮೇ–ಜೂನ್','Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',5.5,7.5,
 'FYM + NPK 10:20:10','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 10:20:10',
 'Fibre crop for making bags and ropes.','ಬ್ಯಾಗ್ ಮತ್ತು ಕಬ್ಬಿಣ ತಯಾರಿಸಲು ನಾರು ಬೆಳೆ.',
 'Warm humid','Alluvial soil','6–8 kg/ha','25x10 cm','25–30 q/ha fibre',
 'ಬಿಸಿ ತೇವ','ಅಲ್ಯೂವಿಯಲ್ ಮಣ್ಣು','6–8 ಕೆಜಿ/ಹೆ','25x10 ಸೆಂ','25–30 ಕ್ವಿಂಟಲ್ ನಾರು/ಹೆ'),


('redgram','Red Gram (Toor Dal)','ತೊಗರಿ','Kharif','ಖರಿಫ್',160,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Dec–Jan','ಡಿಸೆಂ–ಜನ',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,8.0,
 'Rhizobium + NPK 15:15:15','ರೈಜೋಬಿಯಮ್ + ಎನ್‌ಪಿಕೆ 15:15:15',
 'Pulses crop tolerant to drought.','ಒಣಹವಾಮಾನಕ್ಕೆ ತಾಳುವ ಬೇಳೆ ಬೆಳೆ.',
 'Warm dry','Red loam','15–20 kg/ha','60x30 cm','8–10 q/ha grain',
 'ಬಿಸಿ ಒಣ','ಕೆಂಪು ಲೋಮಿ','15–20 ಕೆಜಿ/ಹೆ','60x30 ಸೆಂ','8–10 ಕ್ವಿಂಟಲ್ ಧಾನ್ಯ/ಹೆ'),


USE krishidisha;

INSERT INTO crops (
  slug, name, namekn, seasons, seasonskn, durationdays, durationcategory, durationcategorykn,
  sowingwindow, sowingwindowkn, harvestwindow, harvestwindowkn,
  irrigation, irrigationkn, soilphmin, soilphmax,
  fertilizerbaseline, fertilizerbaselinekn, info, infokn,
  cultivationguide_climate, cultivationguide_soil, cultivationguide_seedrate,
  cultivationguide_spacing, cultivationguide_yield,
  cultivationguidekn_climate, cultivationguidekn_soil, cultivationguidekn_seedrate,
  cultivationguidekn_spacing, cultivationguidekn_yield
) VALUES
('tobacco','Tobacco','ತಂಬಾಕು','Rabi','ರಬೀ',150,'Medium','ಮಧ್ಯಮ',
 'Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್','Feb–Mar','ಫೆಬ್ರವರಿ–ಮಾರ್ಚ್',
 'Irrigated','ನೀರಾವರಿ',5.5,7.5,
 'FYM + NPK 20:20:20','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 20:20:20',
 'Commercial crop grown for leaf curing and export.','ಎಲೆಗಳನ್ನು ಒಣಗಿಸಲು ಮತ್ತು ರಫ್ತು ಮಾಡಲು ಬೆಳೆಯುವ ವಾಣಿಜ್ಯ ಬೆಳೆ.',
 'Warm dry','Sandy loam','1 kg/ha seed','90x60 cm','1.5–2 t/ha cured leaves',
 'ಬಿಸಿ ಒಣ','ಮರಳು ಲೋಮಿ','1 ಕೆಜಿ/ಹೆ ಬೀಜ','90x60 ಸೆಂ','1.5–2 ಟನ್ ಒಣ ಎಲೆಗಳು/ಹೆ'),

('jute','Jute','ಜ್ಯೂಟ್','Kharif','ಖರಿಫ್',150,'Medium','ಮಧ್ಯಮ',
 'May–June','ಮೇ–ಜೂನ್','Oct–Nov','ಅಕ್ಟೋಬರ್–ನವೆಂಬರ್',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',5.5,7.5,
 'FYM + NPK 10:20:10','ಎಫ್‌ವೈಎಂ + ಎನ್‌ಪಿಕೆ 10:20:10',
 'Fibre crop for making bags and ropes.','ಬ್ಯಾಗ್ ಮತ್ತು ಕಬ್ಬಿಣ ತಯಾರಿಸಲು ನಾರು ಬೆಳೆ.',
 'Warm humid','Alluvial soil','6–8 kg/ha','25x10 cm','25–30 q/ha fibre',
 'ಬಿಸಿ ತೇವ','ಅಲ್ಯೂವಿಯಲ್ ಮಣ್ಣು','6–8 ಕೆಜಿ/ಹೆ','25x10 ಸೆಂ','25–30 ಕ್ವಿಂಟಲ್ ನಾರು/ಹೆ'),


('redgram','Red Gram (Toor Dal)','ತೊಗರಿ','Kharif','ಖರಿಫ್',160,'Long','ದೀರ್ಘ',
 'June–July','ಜೂನ್–ಜುಲೈ','Dec–Jan','ಡಿಸೆಂ–ಜನ',
 'Rainfed','ಮಳೆಯಾಧಾರಿತ',6.0,8.0,
 'Rhizobium + NPK 15:15:15','ರೈಜೋಬಿಯಮ್ + ಎನ್‌ಪಿಕೆ 15:15:15',
 'Pulses crop tolerant to drought.','ಒಣಹವಾಮಾನಕ್ಕೆ ತಾಳುವ ಬೇಳೆ ಬೆಳೆ.',
 'Warm dry','Red loam','15–20 kg/ha','60x30 cm','8–10 q/ha grain',
 'ಬಿಸಿ ಒಣ','ಕೆಂಪು ಲೋಮಿ','15–20 ಕೆಜಿ/ಹೆ','60x30 ಸೆಂ','8–10 ಕ್ವಿಂಟಲ್ ಧಾನ್ಯ/ಹೆ');





