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
👉 [`analisis_delincuencia.sql`](analisis_delincuencia.sql)

---
*Desarrollado por Estela Taboada Hernández | Data & Business Intelligence*
