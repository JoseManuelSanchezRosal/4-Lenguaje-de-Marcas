(:GENERAR UN DOCUMENTO XML EJERCICIO 2 E:)
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