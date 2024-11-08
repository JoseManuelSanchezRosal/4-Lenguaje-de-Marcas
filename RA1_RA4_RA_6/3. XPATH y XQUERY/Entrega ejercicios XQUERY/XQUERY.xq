"NOTA: Las consultas sin el elemento FLWOR son de XPATH y las que llevan el For o el Let con un return son de XQUERY.
1- Contar ocurrencias:",
count(/elemento a contar),

"2- Concatenar nombre + apellidos:",
for $t in /familia/padre
return concat($t/padre/nombre,'',$t/padre/apellidos),

"3- Listar elementos filtrando por genero:",
for $t in /catalog/book[genre="Fantasy"]
return $/title,

"4- Sumar el total de precios de todos los libros:",
let $t := sum(/catalog/book/price),
return $t

"5- Guardar total ocurrencias en variable con let:",
let $t := count(/catalog/book)," devuelve numero total de libros"

"6- Calcular el precio medio de los libros:"
let $total := sum(/catalog/book/price)(:SUMA TOTAL PRICE:)
let $count := count(/catalog/book)(:CONTAR TOTAL BOOKS:)
return $total div $count(:DEVOLVER DIVISION PRECIO TOTAL ENTRE LIBROS TOTALES:)

"7- Generar un documento XML con XQUERY:",
<bailes_lozano profesor= "Jesús Lozano">
{
for $t in doc("ejercicio_2_bailes")//baile
where $t/profesor = "Jesús Lozano"
return 
 <baile num="1"> &#10;(:El salto de linea es con &#10;:)
    <nombre> { $t/nombre/text() } </nombre>&#10;
    <plazas> { $t/plazas/text() } </plazas>&#10;
    <duracion> { $t/duracion/text() } </duracion>&#10;
 </baile>
}
</bailes_lozano>

"8- Generar un documento HTML mediante consula en XQUERY:",
<html>
  <head>
    <tittle>Bailes con cuota Trimestral</tittle>
  </head>
  
  <body>
     <table border = "3">
       <tr>
 <th>Baile</th>
 <th>Profesor</th>
 <th>Plazas</th>
       </tr>
       {
 for $baile in doc("ejercicio_2_bailes.xml")//baile
 where $baile/precio/@cuota="trimestral"
 order by $baile/plazas
 return <tr>
   <td>{$baile/nombre}</td>
   <td>{$baile/profesor}</td>
   <td>{$baile/plazas}</td>
</tr>
       }
     </table>
  </body>
</html>