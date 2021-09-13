.PHONY: clean

onto_iri_base = http://abc.xyz

pizzacob.owl:
	curl https://protege.stanford.edu/ontologies/pizza/pizza.owl > $@
	robot annotate --input pizzacob.owl --remove-annotations --ontology-iri $(onto_iri_base) --version-iri $(onto_iri_base)  --output pizzacob.owl

clean:
	rm -f pizzacob.owl
