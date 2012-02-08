I had an interesting use case that required me to build a structure that
allowed a large number of XML files (100K+) to be searchable by node
name and node value.  Part of the use case required joining to other
data that was stored in a relational database.  I decided to store the nodes,
node attributes, and node values using nested sets.  So I needed a
way to convert the XML data into a csv I could load into our relational
database.

I was also working with Common Lisp and dealing with XML nodes recursively
in lisp seemed like a good exercise.  In particular, I find that a number
code examples that I came across were great, but lacked the "real-world
trip ups" you normally hit in hacking.  For example, to get my CSV
file formatted correctly for loading, I had to set the *print-pretty*
value to nil.  Normally, the format function in Common Lisp seems to insert
line breaks - finding a reference and figuring out I needed to set the
*print-pretty* variable took me too long.  


For this particular application, I don't really need the XML node attributes
to be defined as nested set node, so I don't parse them as separate nodes.



