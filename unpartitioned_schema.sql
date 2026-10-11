-- ============================================================================
-- Karşılaştırma İçin: Bölümlemesiz ve İndeksiz (Düz) Tablo Şeması
-- ============================================================================

DROP TABLE IF EXISTS makine_titresim_duz CASCADE;

CREATE TABLE makine_titresim_duz (
    log_id BIGSERIAL PRIMARY KEY,
    makine_kodu VARCHAR(32) NOT NULL,
    x_ekseni_titresim NUMERIC(6, 3) NOT NULL,
    y_ekseni_titresim NUMERIC(6, 3) NOT NULL,
    sicaklik_derece NUMERIC(5, 2) NOT NULL,
    kayit_zamani TIMESTAMPTZ NOT NULL
);