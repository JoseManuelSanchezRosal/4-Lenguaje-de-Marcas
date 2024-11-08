
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