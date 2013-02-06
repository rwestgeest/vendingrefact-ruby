Description
===========

The Refuctored Vending machine is exercise code we have used in a number
of courses. The codebase is tiny, but difficult enough to clean up. You
can clone this repository and play around with refactorings to see if
you can make it better. 

We have provided a few integration tests, that test the vending machine
from the outside. 

Goals
=====
We wanted a small volume of code that is difficult enough to clean up,
so that you need to dilligently find smells and apply refactorings in
small steps, but not too big to get lost in.

Practicing coding skills on a sample problem works, because you can
focus on one thing to learn, and you don't have to worry about deadlines
or other problems your production code has. It's also easier to compare
notes with others who did the same exercise - we find it insightful
to observe how others attack a problem.

We also want to let you experience the effects of a partial safety net.
Therefore we have provided a few rough integration tests, that cover
most of the code, but not everything! So be careful.

How to use
==========

Clone or download the repository (TODO: LINKS). You might want to make a
branch for each attempt you make, and commit whenever the tests are
green, so you can compare your progress to the original goal, and see
what line of attack works better or worse for you. 

A sample commit comment might look like: 'smell: duplicate code.
refactoring: extract method'.

If you can't find small enough steps, you also might consider committing
partway through big steps, so you can choose where to go back to. 

In
general, if you can't come up with a small step, think harder or try to
attack smells where you can find small refactorings for. We often start
with simple rename refactorings : rename variables to understand what a
piece of code does, rename methods to make it more clear what a method
does etcetera. 

Steps:

1. Make a list of smells you find in the code. Put the smells you want
   to attack first on top. 
2. Find appropriate refactorings and put them next to the smells. You
   may need multiple refactorings to resolve a smell. 
3. Perform the refactorings for your worst
smell.
4. Look at any new smells you introduced while refactoring.
5. Repeat.

We recommend you run the provided tests often, even if they don't cover
everything. Adding new tests is also a good idea, but that may be only
possible after you've done some refactoring.

Which smells and refactorings can help me?
==========================================

You can find lists of smells and refactorings to choose from at: TODO:
LINKS

or you can order a pack of [smells and refactoring cue
cards](http://www.qwan.eu/refactoringcards) TODO: LINK to play with the
smells and refactorings spatially.

References
==========

Authors
=======
Marc Evers, Rob Westgeest, Willem van den Ende
