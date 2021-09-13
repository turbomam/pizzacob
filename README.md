# pizzacob
What happens when you add COB as an upper ontology to pizza.owl?

- git-clone or fetch/pull this repo
- delete any lingering catalogues
- get robot (jar and helper script) from http://robot.obolibrary.org/
- `make reports/pizzacob.tsv` 
    - downloads `pizza.owl` with a new name: `pizzacob.owl`
    - remove ontology annotations with robot
    - changes the ontology IRI and version IRI with robot
    - creates a report of OBO best proactice violations, `reports/pizzacob.tsv`
        - note especially `INFO` about classes with no *asserted* superclass

Starts out like this:

```
pizzacob % make reports/pizzacob.tsv 
robot report --input pizzacob.owl --output reports/pizzacob.tsv
Violations: 318
-----------------
ERROR:      197
WARN:       106
INFO:       15
2021-09-13 18:28:14,218 ERROR org.obolibrary.robot.ReportCommand - Report failed!
make: *** [reports/pizzacob.tsv] Error 1

% grep missing_superclass reports/pizzacob.tsv
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#CheeseyPizza	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#Country	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#DomainConcept	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#InterestingPizza	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#MeatyPizza	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#NonVegetarianPizza	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#SpicyPizza	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#SpicyPizzaEquivalent	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#SpicyTopping	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#ThinAndCrispyPizza	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#ValuePartition	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#VegetarianPizza	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#VegetarianPizzaEquivalent1	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#VegetarianPizzaEquivalent2	rdfs:subClassOf	
INFO	missing_superclass	http://www.co-ode.org/ontologies/pizza/pizza.owl#VegetarianTopping	rdfs:subClassOf	
```

- add `owl:imports http://purl.obolibrary.org/obo/cob.owl` to `pizzacob.owl` in Protege or your favorite text editor **and save**

https://raw.githubusercontent.com/OBOFoundry/COB/master/cob.owl


- manually place the classes with no *asserted* superclass under some COB class
    - may require some thought or discussion
    - _ValuePartition -> characteristic_ or _Spiciness -> characteristic_ and then delete _ValuePartition_?
    - DomainThing/Food -> material entity?
        - look at usages of parent and children. add comments. if we're going to delete any classes, we could ontology comments
    - DomainThing/Country -> Geographical location
    - Check usage of classes to be moved or deleted?

https://github.com/OBOFoundry/COB/blob/master/src/ontology/components/cob-to-external.owl not really necessary any more due to "COB rewired release" http://purl.obolibrary.org/obo/cob/releases/2021-09-11/cob-native.owl  It may even complicate things. But it does provide some good hints if you are already familiar with pre-COB OBO conventions.

robot relax  --input pizzacob.owl --output pizzacob.owl

- rerun `make reports/pizzacob.tsv` 
