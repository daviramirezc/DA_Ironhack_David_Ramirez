

## Introduction
El proyecto busca analizar los factores que promueven el uso de medios de transporte sostenibles en la ciudad de Barcelona. Se basa en datos relacionados con características urbanas, demográficas, económicas y sociales de los 73 barrios de la ciudad para el año 2019. Con esta información, se pretende identificar patrones y áreas prioritarias para la implementación de medidas que fomenten el transporte público, la movilidad activa (caminata y bicicleta) y la reducción del impacto ambiental generado por el transporte. 

## Problem Statement
El proyecto tiene como objetivo evaluar los factores clave del Plan de Movilidad Urbana (PMU) 2024 de Barcelona, centrándose en aquellos que promueven el uso de medios de transporte sostenibles en la ciudad. Para ello, se utilizará un conjunto de datos basado en información urbana, demográfica, económica y social recopilada en 2019 sobre los 73 barrios de Barcelona. Este análisis permitirá identificar patrones y áreas prioritarias para la implementación de medidas que fomenten el transporte público, la movilidad activa (como caminar y andar en bicicleta) y la reducción del impacto ambiental asociado al transporte.

## Data Collection
Datasets used:
- Barcelona's Change & Displacement Indicators.
  Dataset publica encontrada en Kaggle, que ya es en si un conglomerado de data proveniente de diferentes fuentes. Link:   https://www.kaggle.com/datasets/macmotx/barcelona-data-airbnb-listings-10-years
  
- 0301040100_Barris_UNITATS_ADM
  Detalle de las unidades administrativas de la ciudad de Barcelona: distritos, barrios, área interés, áreas estadísticas básicas (AEB) y secciones censales.
Link:   https://opendata-ajuntament.barcelona.cat/data/es/dataset/20170706-districtes-barris/resource/11851135-6919-4dcb-91ed-821e5e87a428?inner_span=True

- BCN Bike Sharing Dataset - Bicing Stations
Este conjunto de datos contiene información de las aproximadamente 410 estaciones de bicicletas públicas del servicio de bicicletas compartidas de Barcelona para el año.
Link:   https://www.kaggle.com/datasets/edomingo/bicing-stations-dataset-bcn-bike-sharing/data?select=2019_INFO.csv

- 2019_vehicles_servei.csv
Padrón de vehículos. Servicio, según tipología, que ofrecen los vehículos de la ciudad de Barcelona.
Link:  https://opendata-ajuntament.barcelona.cat/data/es/dataset/est_vehicles_servei/resource/01779ac0-e517-4ab7-a978-585d26d94837#additional-info

## Data Cleaning and Preparation
El EDA hecho en python se baso en la exploración de los datos, identificando valores nulos y la toma de decisión de que hacer con ellos. En el caso particular del dataset "Barcelona's Change & Displacement Indicators." eran solo un par de columnas en las que figuraban valores nulos, en los casos en los que dichos valores no representaban un porcentaje importante se procedió a rellenar los valores con la media de los datos; y en el caso de que el porcentaje fue el 45% se decidió prescindir de dicha columna. 

Otra parte importante de la preparación de los datasets fue el poder contar con los mismos nombres de barrios, indispensable para luego poder unirlos.

## Exploratory Data Analysis
El análisis exploratorio de datos se llevó a cabo para comprender mejor la distribución de las variables seleccionadas y su comportamiento entre los barrios de Barcelona, con un enfoque particular en el año 2019. Los heatmaps generados proporcionaron información visual clave sobre cómo se distribuyen las variables de interés, como la población y las áreas dedicadas a diferentes usos del suelo, a lo largo de la ciudad. 

## Data Visualization and Dashboard
Las visualizaciones y dashboards de Power BI proporcionan información sobre la **distribución del registro de vehículos** en Barcelona. El **dashboard principal** muestra el total de vehículos registrados (825K), la distribución por distritos y el desglose por barrios, lo que permite identificar áreas con mayor concentración (por ejemplo, Eixample y Sant Gervasi-Galvany).  

Los **dashboards de Top 10 y Bottom 10** destacan los barrios con mayor y menor número de vehículos registrados, facilitando la toma de decisiones para la **gestión del tráfico**, **planificación urbana** y estrategias de **movilidad sostenible**. Estas visualizaciones permiten a los responsables priorizar acciones para **reducir la congestión** y **mejorar el transporte público** en zonas clave.


## Results and Discussion
 - Las zonas de bajas emisiones son fundamentales para mitigar la contaminación y mejorar la calidad del aire.
 -  Se identificó la necesidad de aumentar estaciones de bicicletas en áreas con carencias para impulsar el uso del transporte activo.
 -  Estrategias como aumentar estaciones de Bicing en áreas periféricas pueden incentivar la movilidad activa.
 -  Políticas de movilidad sostenible pueden reducir enfermedades relacionadas con la contaminación.
 -  Se recomienda priorizar la implementación de estrategias en distritos con alta concentración de vehículos, como Eixample y Sant Gervasi-Galvany.

## Conclusion
Los resultados del analisis que hemos hecho son:
-Implementar zonas de bajas emisiones es clave para reducir la contaminación y mejorar la calidad del aire.
-Se deben aumentar las estaciones de bicicletas en barrios con carencias detectadas para fomentar la movilidad sostenible.
-Priorizar la instalación de estaciones de Bicing en áreas periféricas incentivará el uso del transporte activo.
-Reducir plazas de aparcamiento para vehículos privados incentivará el uso del transporte público.
-La implementación de estrategias de transporte sostenible puede disminuir los casos de enfermedades relacionadas con la contaminación.
-Se recomienda implementar políticas de movilidad sostenible en distritos con alta concentración de vehículos, como Eixample y Sant Gervasi-Galvany, para reducir la congestión.

## Future Work
 - Estudiar datos en tiempo real sobre la movilidad urbana.
 - Desarrollar dashboards públicos que muestren datos sobre tráfico, emisiones y disponibilidad de transporte sostenible.
 - Evaluar el impacto de la reducción progresiva de plazas de aparcamiento en diferentes barrios.
