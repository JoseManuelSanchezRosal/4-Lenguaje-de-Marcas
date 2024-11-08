"3_A_Muestra los titulos de todos los libros(CONTENIDO):",
doc("ejercicio_3_libros")/bib/libro/titulo/text(),
"NOTA:Me he permitido el lujo Miguel, de modificar y eliminar el espacio que habia en el ultimo titulo del libro de Economics of Technology for Digital en el archivo original XML ejercicio_3_libros, para que no se viera el espacio en blanco antes del titulo.",

"3_B_Devuelve todos los titulos de los libros del ano 2000(ELEMENTO):",
for $t in doc("ejercicio_3_libros")/bib/libro
where $t/@year="2000"
return $t/titulo,

"3_C_Devuelve todos los titulos de los libros entre el ano 1995 y 2000. Ambos incluidos(ELEMENTO)",
for $t in doc("ejercicio_3_libros")/bib/libro
where $t/@year>"1994" and $t/@year<"2001"
return $t/titulo,

"3_D_Obten todos los titulos de todos los libros que tengan algun autor de apellido Stevens(CONTENIDO)",
for $t in doc("ejercicio_3_libros")/bib/libro
where $t/autor/apellido="Stevens"
return $t/titulo/text(),

"3_E_Muestra los titulos de todos los libros almacenados en la editorial Addison Wesley, primero con una clausula for y, a continuacion, con una clausula let(ELEMENTO):",
"FOR",
for $t in doc("ejercicio_3_libros")/bib/libro
where $t/editorial="Addison-Wesley"
return $t/titulo,
"LET",
let $t :=doc("ejercicio_3_libros")//libro[editorial = "Addison-Wesley"]
return $t/titulo,

"3_F_Consigue todos los titulos de los libros que tengan un solo autor ordenados por precio(ELEMENTO):",
for $t in doc("ejercicio_3_libros")/bib/libro[count(autor)=1]
order by $t/precio
return $t/titulo,

"3_G_Devuelve todos los titulos de los libros que tengan mas de dos autores ordenados por su titulo(ELEMENTO):",
for $t in doc("ejercicio_3_libros")/bib/libro[count(autor)>2]
order by $t/titulo
return $t/titulo,

"3_H_Devuelve el titulo y el ano de cada uno de los libros junto con el numero de autores de cada libro(ELEMENTO). Puedes hacerlo directamente??:",
for $t in doc("ejercicio_3_libros")//bib/libro
return
  <libro>&#10;
    <titulo>{$t/titulo/text()}</titulo>&#10;
    <anio>{data($t/@year)}</anio>&#10;(:OJO PARA SACAR DATO DE ATRIBUTO NO VALE CON /TEXT(), sino con DATA(variable/@year):)
    <autores>{let $c := count($t/autor)
      return $c}
    </autores>&#10;
  </libro>,

"3_I_Repite el apartado generando un fichero XML:",
<resumen_bib>&#10;
{
for $t in doc("ejercicio_3_libros")//bib/libro
return(:PREGUNTAR POSIBILIDAD INSERTAR SALTO LINEA:)
    <libro>&#10;
      <titulo>{$t/titulo/text()}</titulo>&#10;
      <anio>{data($t/@year)}</anio>&#10;
      <autores>{let $c := count($t/autor)
      return $c}
      </autores>&#10;
    </libro>
}&#10;
</resumen_bib>,

"3_J_Devuelve los titulos de todos los libros y los apellidos de sus dos primeros autores. En el caso de que existan mas de 2 autores para un libro, se anade un tercer autor et al. .Para ello genera el siguiente XML",

"3_K_Devuelve todos los titulos de los libros, su editorial y los comentarios del mismo, si es que tiene algun comentario. Si no tiene, usaras la etiqueta <sin_comentario/>. Para ello genera el siguiente XML:",

"3_L_Consigue los titulos de todos los libros en los que al menos uno de sus autores es Stevens(ELEMENTO) Usa some. Este cuantificador existencial permite definir consultas que devuelvan algun elemento que satisfaga la condicion:",
for $t in doc("ejercicio_3_libros")/bib/libro
let $ape := $t/autor/apellido
where some $ape in $t satisfies $ape/autor/apellido = "Stevens"
return $t/titulo,

"3_M_Devuelve todos los titulos de los libros en los que todos los autores sean Stevens(ELEMENTO). Usa every. Este cuantificador existencial permite devolver los elementos en los que todos sus nodos satisfagan la condicion:",
for $t in doc("ejercicio_3_libros")/bib/libro
let $ape := $t/autor/apellido
where every $ape in $t/autor satisfies contains ($ape/apellido, "Stevens")
return $t/titulo,

"3_N_Devuelve todos los apellidos distintos de los autores (ELEMENTO). Usa distinct-values(). Esta funcion extrae los valores de una secuencia de nodos y crea una nueva secuencia con valores unicos eliminando nodos duplicados:",

"3_O_Usa empty() y exists() en dos consultas distintas inventadas por ti. La funcion empty() devuelve cierto cuando la expresion entre parentesis esta vacia. La funcion opuesta a empty() es exists(), la cual devuelve cierto cuando una secuencia contiene, al menos, un elemento:"


