# pizzacob
What happens when you add COB as an upper ontology to pizza.owl?

- get robot (jar and helper script) from http://robot.obolibrary.org/
- `make pizzacob.owl` 
    - downloads `pizza.owl` with a new name: `pizzacob.owl`
    - remove ontology annotations with robot
    - changes the ontology IRI and version IRI with robot
- add http://purl.obolibrary.org/obo/cob.owl `owl:imports` in Protege or your favorite text editor
