### 📋📋Crimenes_2015_al_2025_México📋📋
## Análisis crímenes en México 2015 al 2025
🚓🚓🚓Datos de índices delictivos de los años 2015 al 2025, tomados de la pagina https://www.datos.gob.mx/dataset/?res_format=CSV, del gobiernos.

# 1. Dimensiones generales (Filas y Total de Delitos)
Para conocer el volumen total de tu universo:

-#- SQL
SELECT 
    COUNT(*) AS total_registros,
    SUM(incidencias_delictivas) AS total_delitos
FROM crimenes;

<img width="441" height="91" alt="image" src="https://github.com/user-attachments/assets/9ee2ae41-e111-4d7a-94b4-e065237f08e7" />

2. Top 5 Bienes Jurídicos más Afectados
Para ver a nivel macro hacia dónde se inclina la actividad delictiva (Patrimonio, Vida, Libertad, etc.):

SELECT 
    bien_juridico_afectado,
    SUM(incidencias_delictivas) AS total_delitos,
    ROUND(100.0 * SUM(incidencias_delictivas) / (SELECT SUM(incidencias_delictivas) FROM crimenes), 2) AS porcentaje
FROM crimenes
GROUP BY bien_juridico_afectado
ORDER BY total_delitos DESC
LIMIT 5;

<img width="699" height="226" alt="image" src="https://github.com/user-attachments/assets/0f76a530-08bb-428f-bca4-93b92e7fc823" />

3. Top 10 Delitos Específicos más Frecuentes
Para identificar los focos rojos concretos:

SQL
SELECT 
    tipo_delito,
    subtipo_delito,
    SUM(incidencias_delictivas) AS total_casos
FROM crimenes
GROUP BY tipo_delito, subtipo_delito
ORDER BY total_casos DESC
LIMIT 10;

<img width="710" height="419" alt="image" src="https://github.com/user-attachments/assets/009434d9-3e20-498b-8a2d-bf97c111ae4e" /> 
