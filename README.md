# pizzacob
What happens when you add COB as an upper ontology to pizza.owl?

- get robot (jar and helper script) from http://robot.obolibrary.org/
- `make` 
    - downloads `pizza.owl` with a new name: `pizzacob.owl`
    - remove ontology annotations with robot
    - changes the ontology IRI and version IRI with robot
