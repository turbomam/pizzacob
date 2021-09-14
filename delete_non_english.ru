prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>

delete {
	?s rdfs:label ?o
}
where 
{ ?s rdfs:label ?o .
filter(lang(?o) = "pt" )}