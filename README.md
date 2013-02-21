iGrapevine
==========

An effort to port the GrapeVine LARP Administration Utility codebase from VB6 to iOS.

## What is GrapeVine LARP Administration Utility?

GrapeVine is a freeware app created to help World of Darkness MET Storytellers run their games. It was written in VB6 by a developer named Adam Cerling, but he stopped maintaining it many years ago and posted the source code in case anyone else would like to have a shot at keeping up with it.

## What is iGrapeVine?

Many years have passed, but the Mind's Eye Theater communities are still going strong. Large games can have hundreds of active players, but all their technology is dependent on an aging Visual Basic 6 app that might stop running one day if Windows loses backwards compatibility with older apps. Visual Basic 6 is now a dead end. Microsoft has ended support for VB6 development tools and VB6 can't be converted to .Net easily.

There have been many attempts at rewriting GrapeVine over the years in other languages with an updated user interface. This is not that application, but I hope this will help whoever writes that application. 

iGrapeVine is intended to spare the next brave soul who tackles an iOS (or Mac) version of GrapeVine all the hard work of reading and writing .GEX files themselves, learning the file layouts, and testing their code.

## How are you going to port the UI?

I'm not intending to, beyond extracting any business logic from the UI into model classes. 

My Primary goals are:

1. To be able to read & write characters from native grapevine formats.
2. To represent Grapevine entities like characters, traits, etc as high-level Objective-C objects.

My ultimate goal would be to allow someone to quickly build an iPhone app that can open a .gv3 or .gex file from email and display character sheets in a mobile app.

## Why should I trust iGrapeVine?

iGrapeVine has a suite of unit tests backing it, and it's easy to acquire lots of .gex, .gvm, and .gv3 files we can test out.

VB6 code isn't particularly hard to convert to Objective-C, the data types appear to be quite compatible on a binary level. Although VB6 uses Pascal-style strings instead of C-style strings, it is not difficult to convert between them.

## When is it done?

You can view my progress document [here](https://docs.google.com/spreadsheet/ccc?key=0Ao4lbZ1VEsGbdERxeEw5ZHNRakZWSU4wdndMOGVaMEE&usp=sharing). As you can tell, we have a long way to go!

## What's with all the commented out VB6 code in the .m and .h files?

That's the spec! ;)

My process is:

* Start with a VB6 file
* Drop it into an equivalent .m file
  * Comment the whole file out
  * Convert it one method at a time
* Drop the commented VB6 Code into the .h file
  * Strip out the function bodies
  * Write the equivalent method headers
* The VB6 code remains behind, to help write the unit tests in Objective-C

Additional methods are added based on refactoring need, but those go into their own category in the converted class file to differentiate between what Adam Cerling originally created and what iGrapeVine has since added.

In time I would like to delete all those extraneous comments, but since we're in an early stage of unit testing everything, and many of the files can't be ported completely because of dependencies on other files that have yet to be ported, I want to preserve the commented-out VB6 code in-line.

The VB6 may contain business rules or edge cases that the equivalent "ported" code does not handle correctly. Once we have a high degree of confidence in the ported code for a particular file, the VB6 code can be eliminated.

## Why not write it in C?

The thought had occurred to me, but I really like the Objective-C language and iOS is all the rage these days. I write iPad Apps full time, so this was easiest for me to shift into.

## Can I help out?

Please do! Feel free to use any of this code for any purpose, or to help me make changes. It is provided as-is with no warranty, but if something is wrong with it I hope you'll tell me about it (or you'll submit a pull request after fixing it yourself).

Thanks,

Bill Cox

[blog](http://weaklyreferenced.blogspot.com)