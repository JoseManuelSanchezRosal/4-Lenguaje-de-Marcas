for $t in doc("beatles")//beatle
return
<span>
   El beatle {$t/name/firstname/text()} {$t/name/lastname/text()} tiene una web llamada {data($t/@link)}
</span>