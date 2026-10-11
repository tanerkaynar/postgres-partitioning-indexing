-- ============================================================================
-- Karşılaştırma İçin: Düz Tabloya 100.000 Satır Sahte Veri Basma
-- ============================================================================

INSERT INTO makine_titresim_duz (makine_kodu, x_ekseni_titresim, y_ekseni_titresim, sicaklik_derece, kayit_zamani)
SELECT 
    'CNC-TEZGAH-' || LPAD(FLOOR(RANDOM() * 50 + 1)::TEXT, 3, '0') AS makine_kodu,
    ROUND((RANDOM() * 10)::NUMERIC, 3) AS x_ekseni_titresim,
    ROUND((RANDOM() * 10)::NUMERIC, 3) AS y_ekseni_titresim,
    ROUND((RANDOM() * 40 + 40)::NUMERIC, 2) AS sicaklik_derece,
    '2026-01-01 00:00:00+00'::TIMESTAMPTZ + (RANDOM() * INTERVAL '365 days') AS kayit_zamani
FROM generate_series(1, 100000);