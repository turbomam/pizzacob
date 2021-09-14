.PHONY: clean label_rules

onto_iri_base = https://raw.githubusercontent.com/turbomam/pizzacob/main/pizzacob.owl

# how to do
#   --annotation owl:imports "http://purl.obolibrary.org/obo/cob.owl"
#   with robot?
#   do it manually for now
pizzacob.owl:
	curl https://protege.stanford.edu/ontologies/pizza/pizza.owl > $@
	robot annotate \
	--input pizzacob.owl \
	--remove-annotations \
	--ontology-iri $(onto_iri_base) \
	--version-iri $(onto_iri_base) \
	--annotation dc11:description "COB-ified pizza ontology" \
	--annotation dc:license "MIT" \
	--annotation dc11:title "PizzaCOB" \
	--output pizzacob.owl
	
pizzacob.tsv: pizzacob.owl
	robot report --input $< --output $@ --fail-on none
	grep missing_superclass pizzacob.tsv
	
label_rules: pizzacob.owl
	robot query --input pizzacob.owl --update alternify_non_english.ru --output pizzacob.owl
	robot query --input pizzacob.owl --update delete_non_english.ru --output pizzacob.owl
	robot query --input pizzacob.owl --update rhs_to_label.ru --output pizzacob.owl

clean:
	rm -f pizzacob.owl
	# start with an empty catalog
	rm -f catalog-v001.xml
