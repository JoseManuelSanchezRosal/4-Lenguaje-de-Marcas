
for $t in doc("ejercicio_3_libros")/bib/libro
let $ape := $t/autor/apellido
where every $ape in $t satisfies $ape/autor/apellido = "Stevens"
return $t




