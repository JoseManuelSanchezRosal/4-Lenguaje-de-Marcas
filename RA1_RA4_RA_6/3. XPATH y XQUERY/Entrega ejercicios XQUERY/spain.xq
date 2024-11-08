<html>
  <head>
    <tittle>Records Spain</tittle>
  </head>
  
  <body>
     <table border = "5">
       <tr>
         <th>name</th>
         <th>address</th>
         <th>currency</th>
         <th>url</th>
       </tr>
       {
         for $spain in doc("records")/records/record
         where $spain/country="Spain" or $spain/country="New Zealand" or $spain/country="Germany"
         return <tr>
                   <td>{$spain/country}</td>
                   <td>{$spain/name}</td>
                   <td>{$spain/address}</td>
                   <td>{$spain/currency}</td>
                   <td>{$spain/url}</td>
                </tr>
       }
     </table>
  </body>
</html>