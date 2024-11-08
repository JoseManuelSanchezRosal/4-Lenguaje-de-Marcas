"2_A_Muestra el nombre de todos los bailes (CONTENIDO):",
doc("ejercicio_2_bailes.xml")//nombre/text(),

"2_B_Consigue el nombre de todos los bailes que se realizan en la sala numero 1 (ELEMENTO):",
doc("ejercicio_2_bailes.xml")//baile[sala="1"]/nombre,"En documento /baile [donde la sala =1] nos devuelva el /nombre",

"2_C_Muestra todos los bailes con toda su informacion que se imparten en la sala 2 y cuyo precio sea menor que 35 euros (ELEMENTO):",
for $t in doc("ejercicio_2_bailes.xml")/bailes/baile
where $t/sala="2" and $t/precio<"35"
return $t,

"2_D_Obten el nombre de todos los profesores que dan clase con cuotas mensuales (CONTENIDO):",
for $t in doc("ejercicio_2_bailes.xml")/bailes/baile
where $t/precio/@cuota="mensual"
return $t/profesor/text(),

"2_E_Genera un nuevo documento XML que almacena la informacion de los bailes que imparte el profesor Jesus Lozano...",
<bailes_lozano profesor= "Jesús Lozano">
{
for $t in doc("ejercicio_2_bailes.xml")//baile
where $t/profesor = "Jesús Lozano"
return <baile num="1"> &#10;
    <nombre> { $t/nombre/text() } </nombre>&#10;
    <plazas> { $t/plazas/text() } </plazas>&#10;
    <duracion> { $t/duracion/text() } </duracion>&#10;
  </baile>
}
</bailes_lozano>