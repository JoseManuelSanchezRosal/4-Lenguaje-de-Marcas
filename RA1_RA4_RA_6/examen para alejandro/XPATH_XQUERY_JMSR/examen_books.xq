"Devolver texto de libros que no sean de genero Computer y precio menor que 5",
for $t in doc("books")/catalog/book
where $t/genre!="Computer" and $t/price<"5"
return $t/title/text(),
count(doc("books")/catalog/book[genre!="Computer" and price<"5"])

