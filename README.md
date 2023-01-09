# Fantasy Total
Gestión de las previsiones de fantasy que hacen diversas páginas proveedoras sobre tu alineación semanal en Fantasy, para estudiar que proveedor acierta mas.

Se rellenan previa a la semana las predicciones de jugadores por cada posición y proveedor.

Se rellena post a la semana las puntuaciones de fantasy de tus jugadores.

Se obtiene un resumen de puntuación fantasy de cada proveedor en esa semana, y permite la asignación de los denomincados "Puntos Win" (0,5,10) según el usuario estime que cada proveedor ha cumplido en esa semana.

Tiene un dashboard de inicio de gráficos para resumir los datos principales, y consultar que proveedor es más fiable cada temporada.

## Requisitos

Es una aplicación en Oracle APEX (Versión 22.1.6).

Se requiere al menos una Oracle 12c. Preparado para utilizarse con el Cloud Free de Oracle.

## Installation

Es una exportación de la aplicación APEX tal cual en "f102":
 * Version descromida de la exportacion por zip ("Split into Multiple Files").
 * Incluye los Supported Objects para crearla desde inicio.

Instalar en una nueva instancia simplemente:
 * Importar aplicación, asignandole el id que queremos.
 * Si no se tienen los objetos de inicio marchar la opcion de instalar los "Supported Objects"

En "historico":
 * Estan los datos históricos que para mi caso he ido generando por temporada.


## Screenshots

### Panel de control resumen temporada

![Imagen panel control](https://raw.githubusercontent.com/jpromocion/fantasy-total-j/main/screenshots/imagen1.png?token=GHSAT0AAAAAAB5HNKFB7ATS6NQTUW3LUOGAY5335IQ)

### Jugadores por temporada

![Imagen Jugadores por temporada](https://raw.githubusercontent.com/jpromocion/fantasy-total-j/main/screenshots/imagen2.png?token=GHSAT0AAAAAAB5HNKFBWFXJ43VU2AEUN3QCY5336OA)

### Carga proyecciones de cada proveedor pre-week

![Imagen Carga proyecciones de cada proveedor pre-week](https://raw.githubusercontent.com/jpromocion/fantasy-total-j/main/screenshots/imagen3.png?token=GHSAT0AAAAAAB5HNKFAOQV6KJABRCPV4QFWY53366A)

### Relleno puntos Fanmtasy realizados post-week

![Imagen Relleno puntos Fanmtasy realizados post-week](https://raw.githubusercontent.com/jpromocion/fantasy-total-j/main/screenshots/imagen4.png?token=GHSAT0AAAAAAB5HNKFBSRY6RMXZ6CDXJCGOY5337EA)

### Consulta puntos totalizados por proveedor en week

![Imagen Consulta puntos totalizados por proveedor en week](https://raw.githubusercontent.com/jpromocion/fantasy-total-j/main/screenshots/imagen5.png?token=GHSAT0AAAAAAB5HNKFB7Z2M5ZET3RVD5OWYY5337LQ)

### Asignación puntos win por proveedor según resultados

![Imagen Asignación puntos win por proveedor según resultados](https://raw.githubusercontent.com/jpromocion/fantasy-total-j/main/screenshots/imagen6.png?token=GHSAT0AAAAAAB5HNKFAD7VTTCZMX75ROVISY5337SA)



