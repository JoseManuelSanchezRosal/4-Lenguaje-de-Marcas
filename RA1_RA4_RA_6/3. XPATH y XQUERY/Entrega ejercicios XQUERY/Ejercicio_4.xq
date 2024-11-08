"4_A_Obtener el numero de alumnos de la clase(NUMERO):",
for $t in doc("ejercicio_4_clase.xml")/clase/alumnos
let $num := count($t/alumno)
return $num,

"4_B_Obtener el numero de modulos que se imparten(NUMERO):",
for $t in doc("ejercicio_4_clase.xml")/clase/asignaturas
let $asig := count($t/asignatura)
return $asig,

"4_C_Obtener nombre y apellidos de todos los alumnos matriculados en algun modulo, es decir que tenga alguna nota(ELEMENTO). Usa el operador union:",
for $alumno in doc("ejercicio_4_clase.xml")//alumno
where doc("ejercicio_4_clase.xml")//nota/@alum = $alumno/@cod
return $alumno/apenomm,

"4_D_Obtener las calificaciones del alumno codigo n43483437 en cada uno de sus modulos. Para ello genera el siguiente XML..:",

"4_E_Obtener los nombres de los alumnos matriculados en LMSGI y sus notas. El resultado sera ordenar las notas de forma descendente. Para ello genera el siguiente XML...:",

"4_F_Repite el ejercicio anterior, pero muestra solo los alumnos que hayan aprobado:"




