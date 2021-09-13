# pizzacob
What happens when you add COB as an upper ontology to pizza.owl?

- get robot (jar and helper script) from http://robot.obolibrary.org/
- `make reports/pizzacob.tsv` 
    - downloads `pizza.owl` with a new name: `pizzacob.owl`
    - remove ontology annotations with robot
    - changes the ontology IRI and version IRI with robot
    - creates a report of OBO best proactice violations, `reports/pizzacob.tsv`
        - note especially `INFO` about classes with no *asserted* superclass
- add `owl:imports http://purl.obolibrary.org/obo/cob.owl` to `pizzacob.owl` in Protege or your favorite text editor **and save**
- manually place the classes with no *asserted* superclass under some COB class
    - may require some thought or discussion
    - _ValuePartition -> characteristic_ or _Spiciness -> characteristic_ and then delete _ValuePartition_?
    - DomainThing/Food -> material entity?
    - DomainThing/Country -> Geographical location
    - Check usage of classes to be moved or deleted?

https://github.com/OBOFoundry/COB/blob/master/src/ontology/components/cob-to-external.owl not really necessary any more due to "COB rewired release" http://purl.obolibrary.org/obo/cob/releases/2021-09-11/cob-native.owl  It may even complicate things. But it does provide some good hints if you are already familiar with pre-COB OBO conventions.

robot relax  --input pizzacob.owl --output pizzacob.owl

- rerun `make reports/pizzacob.tsv` 
