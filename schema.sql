-- ============================================================================
-- GÜN 01: Fabrika Makine Titreşim Telemetrisi Bölümleme (Partitioning) Şeması
-- ============================================================================

DROP TABLE IF EXISTS makine_titresim_loglari CASCADE;

-- 2. Ana Tablo (Aylık Range Partitioning)
CREATE TABLE makine_titresim_loglari (
    log_id BIGSERIAL,
    makine_kodu VARCHAR(32) NOT NULL,            -- Örn: CNC-01, TORNA-05
    x_ekseni_titresim NUMERIC(6, 3) NOT NULL,    -- X ekseni titreşim değeri
    y_ekseni_titresim NUMERIC(6, 3) NOT NULL,    -- Y ekseni titreşim değeri
    sicaklik_derece NUMERIC(5, 2) NOT NULL,      -- Çalışma sıcaklığı (°C)
    kayit_zamani TIMESTAMPTZ NOT NULL,           -- Sensörün veri attığı an
    PRIMARY KEY (log_id, kayit_zamani)
) PARTITION BY RANGE (kayit_zamani);

-- 3. 2026 Yılı Aylık Partition Tabloları
CREATE TABLE titresim_2026_01 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-01-01 00:00:00+00') TO ('2026-02-01 00:00:00+00');

CREATE TABLE titresim_2026_02 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-02-01 00:00:00+00') TO ('2026-03-01 00:00:00+00');

CREATE TABLE titresim_2026_03 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-03-01 00:00:00+00') TO ('2026-04-01 00:00:00+00');

CREATE TABLE titresim_2026_04 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-04-01 00:00:00+00') TO ('2026-05-01 00:00:00+00');

CREATE TABLE titresim_2026_05 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-05-01 00:00:00+00') TO ('2026-06-01 00:00:00+00');

CREATE TABLE titresim_2026_06 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-06-01 00:00:00+00') TO ('2026-07-01 00:00:00+00');

CREATE TABLE titresim_2026_07 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-07-01 00:00:00+00') TO ('2026-08-01 00:00:00+00');

CREATE TABLE titresim_2026_08 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-08-01 00:00:00+00') TO ('2026-09-01 00:00:00+00');

CREATE TABLE titresim_2026_09 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-09-01 00:00:00+00') TO ('2026-10-01 00:00:00+00');

CREATE TABLE titresim_2026_10 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-10-01 00:00:00+00') TO ('2026-11-01 00:00:00+00');

CREATE TABLE titresim_2026_11 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-11-01 00:00:00+00') TO ('2026-12-01 00:00:00+00');

CREATE TABLE titresim_2026_12 PARTITION OF makine_titresim_loglari
    FOR VALUES FROM ('2026-12-01 00:00:00+00') TO ('2027-01-01 00:00:00+00');

-- Beklenmeyen tarihler için varsayılan partition
CREATE TABLE titresim_varsayilan PARTITION OF makine_titresim_loglari DEFAULT;

-- 4. İndeksler (Performans Canavarları)
CREATE INDEX idx_makine_zaman ON makine_titresim_loglari (makine_kodu, kayit_zamani DESC);
CREATE INDEX idx_titresim_brin ON makine_titresim_loglari USING brin (kayit_zamani);