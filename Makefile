.PHONY: clean

onto_iri_base = https://raw.githubusercontent.com/turbomam/pizzacob/main/pizzacob.owl

# --annotation owl:imports "http://purl.obolibrary.org/obo/cob.owl" 
pizzacob.owl:
	curl https://protege.stanford.edu/ontologies/pizza/pizza.owl > $@
	robot annotate --input pizzacob.owl --remove-annotations --ontology-iri $(onto_iri_base) --version-iri $(onto_iri_base) --output pizzacob.owl
	
reports/pizzacob.tsv: pizzacob.owl:
	robot report --input $< --output $@

clean:
	rm -f pizzacob.owl
