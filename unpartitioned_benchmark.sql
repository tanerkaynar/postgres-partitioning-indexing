-- ============================================================================
-- Karşılaştırma İçin: Düz Tablo Performans Testi (Sequential Scan)
-- ============================================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT makine_kodu, AVG(x_ekseni_titresim) AS ort_titresim
FROM makine_titresim_duz
WHERE makine_kodu = 'CNC-TEZGAH-014'
  AND kayit_zamani BETWEEN '2026-03-01 00:00:00+00' AND '2026-03-31 23:59:59+00'
GROUP BY makine_kodu;