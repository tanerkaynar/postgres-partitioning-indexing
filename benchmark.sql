-- ============================================================================
-- GÜN 01: Partition Pruning ve İndeks Performans Testi (Benchmark)
-- ============================================================================

EXPLAIN (ANALYZE, BUFFERS)
SELECT makine_kodu, AVG(x_ekseni_titresim) AS ort_titresim
FROM makine_titresim_loglari
WHERE makine_kodu = 'CNC-TEZGAH-014'
  AND kayit_zamani BETWEEN '2026-03-01 00:00:00+00' AND '2026-03-31 23:59:59+00'
GROUP BY makine_kodu;