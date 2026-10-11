-- ============================================================================
-- GÜN 01: 100.000 Satırlık Sahte Fabrika Sensör Verisi Üretme Scripti
-- ============================================================================

INSERT INTO makine_titresim_loglari (
    makine_kodu,
    x_ekseni_titresim,
    y_ekseni_titresim,
    sicaklik_derece,
    kayit_zamani
)
SELECT
    -- 50 farklı CNC/Torna tezgahı kodu üretir (Örn: CNC-TEZGAH-012)
    'CNC-TEZGAH-' || LPAD((FLOOR(random() * 50 + 1))::TEXT, 3, '0') AS makine_kodu,
    
    -- X ve Y ekseni için rastgele titreşim değerleri (0.1 ile 5.1 arası)
    ROUND((random() * 5.0 + 0.1)::NUMERIC, 3) AS x_ekseni_titresim,
    ROUND((random() * 5.0 + 0.1)::NUMERIC, 3) AS y_ekseni_titresim,
    
    -- Çalışma sıcaklığı (°C) (40 ile 80 derece arası)
    ROUND((40.0 + (random() * 40.0))::NUMERIC, 2) AS sicaklik_derece,
    
    -- 2026 yılının Ocak - Aralık ayları arasına rastgele zaman damgaları dağıtır
    TIMESTAMP '2026-01-01 00:00:00+00' + (random() * (INTERVAL '365 days')) AS kayit_zamani
FROM generate_series(1, 100000);

-- Verilerin aylık partition'lara nasıl dağıldığını kontrol etme sorgusu:
SELECT 
    tableoid::regclass AS bolum_adi,
    COUNT(*) AS toplam_kayit,
    MIN(kayit_zamani) AS ilk_tarih,
    MAX(kayit_zamani) AS son_tarih
FROM makine_titresim_loglari
GROUP BY tableoid
ORDER BY bolum_adi;