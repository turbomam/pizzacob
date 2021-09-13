pizzacob.owl:
	curl https://protege.stanford.edu/ontologies/pizza/pizza.owl > $@
	robot annotate --input pizzacob.owl --remove-annotations --ontology-iri http://abc.xyz --version-iri http://abc.xyz --output pizzacob.owl
