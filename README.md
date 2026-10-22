### 📋📋Crimenes_2015_al_2025_México📋📋
## Análisis crímenes en México 2015 al 2025
🚓🚓🚓Datos de índices delictivos de los años 2015 al 2025, tomados de la pagina https://www.datos.gob.mx/dataset/?res_format=CSV, del gobiernos.

1. Dimensiones generales (Filas y Total de Delitos)
Para conocer el volumen total de tu universo:

SQL
SELECT 
    COUNT(*) AS total_registros,
    SUM(incidencias_delictivas) AS total_delitos
FROM crimenes;
