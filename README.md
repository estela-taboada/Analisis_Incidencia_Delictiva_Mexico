# 📊 Análisis de Incidencia Delictiva y Estacionalidad en México

Proyecto enfocado en la estructuración, agregación lógica y visualización de datos de incidencia delictiva a nivel nacional y estatal (con foco en el estado de Querétaro), aplicando consultas avanzadas en **SQLite** y construcción de un dashboard ejecutivo en **Power BI Desktop**.

---
## 📈 Dashboard Ejecutivo
<img width="1071" height="620" alt="image" src="https://github.com/user-attachments/assets/95a2687a-9060-45a6-b55d-e2e07b8ebf30" />

---

## 🎯 Objetivos del Análisis
1. **Identificar la estacionalidad delictiva nacional:** Determinar los periodos del año con mayores concentraciones de incidencias.
2. **Evaluar la tendencia histórica en Querétaro:** Analizar la evolución anual del volumen total de delitos frente a categorías críticas como robo y violencia familiar.
3. **Estructurar un flujo de datos eficiente:** Realizar la extracción y agregación pesada directamente en motor SQL para servir modelos ligeros y directos a la capa visual.

---

## 🛠️ Stack Técnico y Funciones Clave
* **Motor de Base de Datos:** SQLite
* **Visualización & BI:** Microsoft Power BI Desktop
* **Técnicas SQL aplicadas:**
  * **Tratamiento temporal:** Normalización y extracción de año y mes mediante segmentación posicional (`SUBSTR`).
  * **Agregaciones condicionales:** Implementación de `SUM(CASE WHEN ... THEN ... ELSE 0 END)` para pivotar categorías de delitos en columnas métricas sin necesidad de subconsultas.
  * **Filtros lógicos y comodines:** Uso de `LIKE '%Quer%taro%'` para prevenir inconsistencias tipográficas en variables geográficas.
  * **Agrupaciones jerárquicas:** `GROUP BY` optimizados para granularidades mensuales y anuales.

---

## 📌 Principales Hallazgos (Insights)
* **Picos de Estacionalidad Nacional:** Octubre encabeza históricamente la mayor incidencia delictiva acumulada en el país (1.91 millones de incidentes), seguido de marzo (1.89M) y mayo (1.87M).
* **Comportamiento en Querétaro:** 
  * De un total acumulado de más de **591 mil delitos**, los robos representan el volumen principal con **253 mil incidencias**, mientras que los casos de violencia familiar registran **42 mil casos**.
  * La serie histórica muestra un comportamiento oscilatorio, evidenciando una contracción clara durante 2020 y una posterior estabilización en años recientes.

---

## 📂 Consultas y Código Fuente
El código completo y estructurado se encuentra documentado en el archivo:
👉 SQL

sql ...


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

---
*Desarrollado por Estela Taboada Hernández | Data & Business Intelligence*
