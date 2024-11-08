for $t in doc("beatles")/beatles/beatle
where $t/name/firstname = "Paul"
return $t/@link
