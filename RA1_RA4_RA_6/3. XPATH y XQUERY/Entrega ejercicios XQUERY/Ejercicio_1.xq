"1_A_Consigue el nombre de los modulos que se imparten en el instituto(ELEMENTO):",
doc("ejercicio_1_modulos_informatica.xml")//nombre,

"1_B_Muestra el nombre de los modulos del ciclo ASIR (CONTENIDO):",
for $t in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo
where $t/ciclo="ASIR"
return $t/nombre/text(),

"1_C_Devuelve el nombre de los modulos que se imparten en el segundo curso de cualquier ciclo (ELEMENTO):",
for $t in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo
where $t/curso="2"
return $t/nombre,

"1_D_Devuelve el nombre de los modulos que se imparten en el primer curso de ASIR (ELEMENTO) y ordenalos alfabeticamente:",
for $t in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo
where $t/curso="1" and $t/ciclo="ASIR"
order by $t/nombre
return $t/nombre,

"1_E_Obten el nombre de los modulos con menos de 5 horas semanales (CONTENIDO)",
for $t in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo
where $t/horasSemanales<"5"
return $t/nombre/text(),

"1_F_Devuelve el numero de modulos que se imparten en el primer curso de ASIR (NUMERO):",
count(//modulo[ciclo="ASIR" and curso = "1"])(:Esta funcion cuenta las veces que aparece lo que le decimos en la condicion entre corchetes:),

"1_G_Muestra las horas semanales de los modulos con mas de 3 horas semanales (CONTENIDO)",
for $t in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo
where $t/horasSemanales>"3"
return $t/horasSemanales/text()

