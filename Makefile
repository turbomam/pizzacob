.PHONY: clean

onto_iri_base = https://raw.githubusercontent.com/turbomam/pizzacob/main/pizzacob.owl

pizzacob.owl:
	curl https://protege.stanford.edu/ontologies/pizza/pizza.owl > $@
	robot annotate --input pizzacob.owl --remove-annotations --ontology-iri $(onto_iri_base) --version-iri $(onto_iri_base) --annotation owl:imports <http://purl.obolibrary.org/obo/cob.owl> --output pizzacob.owl

clean:
	rm -f pizzacob.owl
