PREFIX  rdfs: <http://www.w3.org/2000/01/rdf-schema#>

insert {
	?s rdfs:label ?newlab
	}
WHERE
  { ?s  ?p  ?o
    MINUS
      { ?s  rdfs:label  ?l }
      filter(isiri(?s))
      filter(contains(str(?s),"http://www.co-ode.org/ontologies/pizza/pizza.owl#"))
    BIND(strafter(str(?s), "http://www.co-ode.org/ontologies/pizza/pizza.owl#") AS ?newlab)
  }