- Don't forget FOODON (for aliging the Pizza Ontology's 'Food')
- Check discussion about placement of 'Country'
- No 'obsolete class' in COB
- `robot reason` and `robot reduce` are indeed useful in addition to `robot report`. What's the propper order? relax, reduce, report?
    - much of this is taken care of with `make release` in the ODK.

----

Raw chat log


```
10:51:22 From Charlie Hoyt to Everyone:
	Thoughts on pineapple on pizza?
10:51:43 From Shawn Tan to Everyone:
	@Charlie Hoyt Disjoint_with :p
10:52:03 From Charlie Hoyt to Everyone:
	Thank goodness OWL has proper syntax for expressing the truth ^
10:54:54 From Nico Matentzoglu to Everyone:
	Robot report is a subset of the dashboard.
10:55:21 From Chris Mungall to Everyone:
	`sssom dosql -q "SELECT * FROM df WHERE subject_label != object_label " components/cob-to-external.tsv`
10:55:30 From Chris Mungall to Everyone:
	Sorry that was meant for #cob
10:55:45 From Damion Dooley to Everyone:
	can you increase your terminal font size?
11:00:00 From Nico Matentzoglu to Everyone:
	Correct me if I am wrong: the presence of a untyped “root class” just for the sake of grouping your ontology terms is already a violation of the COB QC spec, right?
11:00:15 From Nico Matentzoglu to Everyone:
	Like the DomainThing class here
11:00:43 From Bjoern Peters to Everyone:
	@Nico, in spirit: yes.
11:01:16 From Bjoern Peters to Everyone:
	I thought this was the 'Warn' that Mark got
11:01:16 From Nico Matentzoglu to Everyone:
	And the material entity class, is quite general, wouldn’t this class without an SOP be a free for all?
11:01:58 From James Overton to Everyone:
	SOP = Standard Operation Procedure?
11:02:21 From Nico Matentzoglu to Everyone:
	Yes; you could just align with material entity, and ignore the hard work and aligning with its childre..
11:02:38 From Bjoern Peters to Everyone:
	@Nico, at least you would be shamed
11:02:56 From Bjoern Peters to Everyone:
	For example for redefining food, once we have the FOOD-ON term in there
11:03:20 From Chris Mungall to Everyone:
	If anyone is interested in the question of where countries are placed: https://github.com/OBOFoundry/COB/issues/91
11:03:43 From Nico Matentzoglu to Everyone:
	So the qc will somehow take this into account? There is a foodon term, but I just align with material entity?
11:04:03 From Bjoern Peters to Everyone:
	I think we should look for label duplication as a next level
11:04:07 From Nico Matentzoglu to Everyone:
	ok
11:04:18 From Bjoern Peters to Everyone:
	We talked about that for RO re-use as well
11:05:33 From Christian Stoeckert to Everyone:
	Instead of just deleting, maybe move them under obsolete so there is a more obvious way to track what happened (besides the comments)?
11:08:54 From Nico Matentzoglu to Everyone:
	I am enjoying this, good job Mark so far! But I do disagree that unsats do not have much to do with cob - formally, we should not allow incoherent ontologies at all - they should be failures in the COB integration testing
11:09:30 From Bjoern Peters to Everyone:
	@Nico, in terms of SOP, there will always be lower level terms that are not in COB, but that you should align with. In this example 'countries' and the specific instances. So we should also educate people that when they find a good COB parent for their terms, they should check what other ontologies are in that domain
11:09:54 From Nico Matentzoglu to Everyone:
	Sounds great Bjoern
11:10:13 From Bjoern Peters to Everyone:
	And going back to the reference ontology request, they should rather make a request for a missing term in a domain (like a country) rather adding with their own identifiers
11:10:14 From Bill Duncan to Everyone:
	Joining late. I had another appointment earlier.
11:10:37 From Bjoern Peters to Everyone:
	But that is all for the glorious future
11:11:41 From Nico Matentzoglu to Everyone:
	23
11:11:48 From Nico Matentzoglu to Everyone:
	+++++++++++++++++++++++++++++++++
11:11:54 From Nico Matentzoglu to Everyone:
	o
11:11:54 From Nico Matentzoglu to Everyone:
	o
11:12:03 From Nico Matentzoglu to Everyone:
	(
11:12:04 From Nico Matentzoglu to Everyone:
	c
11:12:04 From Nico Matentzoglu to Everyone:
	at
11:12:28 From Bill Duncan to Everyone:
	@Nico of course we don’t want incoherent ontologies. Has using the right reasoner been discussed? I have found ontologies that were consistent using ELK, but were incoherent when I tested using HeremiT.
11:14:22 From Kai to Everyone:
	In the past when I tried to bring in COB via standard robot  import with an ODK generated ontology it wasn’t importing any classes into the cob import owl file. I’ll try it again see if it works now.
11:18:18 From Bjoern Peters to Everyone:
	Should we have 'obsolete class' in COB then?
11:21:16 From James Overton to Everyone:
	I think that COB should not include ‘obsolete class’. We’ve been moving away from that for a decade. Tools have been getting better about displaying obsoletes in sensible ways.
```
