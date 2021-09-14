prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>

insert {
	?s <http://purl.obolibrary.org/obo/IAO_0000118> ?o
}
where 
{ ?s rdfs:label ?o .
filter(lang(?o) = "pt" )}