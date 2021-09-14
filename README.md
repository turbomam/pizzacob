# pizzacob
What happens when you add COB as an upper ontology to pizza.owl?

- git-clone or fetch/pull this repo
- `make clean`
- get robot (jar and helper script) from http://robot.obolibrary.org/
- `make pizzacob.tsv` 
    - downloads `pizza.owl` with a new name: `pizzacob.owl`
    - removes ontology annotations with robot
    - changes the ontology IRI and version IRI with robot
    - creates a report of OBO best proactice violations, `reports/pizzacob.tsv`
        - especially note the`INFO`s about classes with no *asserted* superclass

The report starts out like this:

```
pizzacob % make pizzacob.tsv 
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

- manually place the classes with no *asserted* superclass under some COB class
    - may require some thought or discussion
    - _DomainThing/Country -> Geographical location_?
    - _ValuePartition -> characteristic_? or _Spiciness -> characteristic_ and then delete _ValuePartition_?
    - _DomainThing/Food -> material entity_?
        - Look at usages of parents and children. Add comments before deleting any assertions. Before deleting any classes, add _ontology_ comments

- rerun `make pizzacob.tsv`
    -  Have the missing asserted superclasses all been resolved?
        -  No. The Pizza ontology uses lots of advanced OWL features. Some of the classes only have asserted _equivalent classes_. That's legal and useful for inferencing, but some OWL and RDF tools have limited support for equivalent classes. `robot` is providing info about these classes in case the ontology author just forgot to assert superclasses. `robot relax` can add weaker superclasses derrived from equivalent class assertions. Equivalent classes are not deleted. See the `robot` docuemtnation for optionally following relax with reduce.
- `robot relax  --input pizzacob.owl --output pizzacob.owl`
- rerun `make pizzacob.tsv`


https://raw.githubusercontent.com/OBOFoundry/COB/master/cob.owl ?

https://github.com/OBOFoundry/COB/blob/master/src/ontology/components/cob-to-external.owl not really necessary any more due to "COB rewired release" http://purl.obolibrary.org/obo/cob/releases/2021-09-11/cob-native.owl  It may even complicate things. But it does provide some good hints if you are already familiar with pre-COB OBO conventions.
