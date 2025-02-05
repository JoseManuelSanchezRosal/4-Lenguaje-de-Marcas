for $t in doc("records")//country
group by $t
order by $t
return
<span> El pais {$t} se repite {count(doc("records")/records/record[country=$t])} con los siguientes nombres {for $x in doc("records")//record 
where $x/country=$t 
return <b>{$x/name/text()}</b>}
</span>
