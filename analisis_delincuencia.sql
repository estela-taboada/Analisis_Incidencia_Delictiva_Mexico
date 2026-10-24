SQL
-- =============================================================================
-- PROYECTO: Análisis de Incidencia Delictiva y Estacionalidad en México
-- HERRAMIENTA: SQLite
-- AUTOR: Estela Taboada Hernández
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. IDENTIFICACIÓN DE ESTACIONALIDAD (TOP 3 MESES A NIVEL NACIONAL)
-- Objetivo: Determinar cuáles son los meses con mayor volumen de delitos
-- acumulados para identificar picos de estacionalidad en el país.
-- -----------------------------------------------------------------------------
SELECT 
    SUBSTR(fecha, 4, 2) AS mes,
    SUM(incidencias_delictivas) AS total_delitos
FROM crimenes
GROUP BY SUBSTR(fecha, 4, 2)
ORDER BY total_delitos DESC
LIMIT 3;


-- -----------------------------------------------------------------------------
-- 2. EXTRACCIÓN PARA VISUALIZACIÓN: DISTRIBUCIÓN MENSUAL COMPLETA
-- Objetivo: Exportar los 12 meses cronológicos para alimentar el gráfico de 
-- estacionalidad en Power BI.
-- -----------------------------------------------------------------------------
SELECT 
    SUBSTR(fecha, 4, 2) AS mes,
    SUM(incidencias_delictivas) AS total_delitos
FROM crimenes
GROUP BY SUBSTR(fecha, 4, 2)
ORDER BY mes ASC;


-- -----------------------------------------------------------------------------
-- 3. EVOLUCIÓN HISTÓRICA Y SEGMENTACIÓN POR DELITO: CASO QUERÉTARO
-- Objetivo: Evaluar la tendencia multianual en Querétaro desglosando el total 
-- general frente a delitos de alto impacto (Robo y Violencia Familiar)
-- utilizando agregación condicional (CASE WHEN).
-- -----------------------------------------------------------------------------
SELECT 
    SUBSTR(fecha, -4) AS anio,
    SUM(CASE WHEN tipo_delito = 'Robo' THEN incidencias_delictivas ELSE 0 END) AS total_robos,
    SUM(CASE WHEN subtipo_delito LIKE '%Violencia familiar%' THEN incidencias_delictivas ELSE 0 END) AS total_violencia_familiar,
    SUM(incidencias_delictivas) AS total_delitos_anio
FROM crimenes
WHERE entidad LIKE '%Quer%taro%'
GROUP BY anio
ORDER BY anio ASC;
