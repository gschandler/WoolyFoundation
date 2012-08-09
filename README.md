WoolyFoundation
===============

WoolyFoundation is a set of frequently called upon helper classes and class extensions 
used in Wooly Beast Software products. The project builds as an iOS static library to be 
linked in other project files. 

This is definitely "work in progress", has minimal documentation, and could be considered
quite sparse.

Installation
------------
1. In your project, add the WoolyFoundation.xcodeproj to your list of project files.  
2. Add "WoolyFoundation.h" to the project prefix file.
3. Depending on where WoolyFoundation is located, the User Header Search Paths build setting may need to be update to point to the directory.
4. Update Other Linker Flags with '-all_load' in order to work around a bug in Apple's linkers with using static libraries that composed of categories. This may be fixed in future releases of Apple's developer tools: http://developer.apple.com/library/mac/#qa/qa1490/_index.html
5. Update the Target Dependencies in each target Build Phase to be dependent upon the library.