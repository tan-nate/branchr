natedogg = User.create(username: "natedogg", password: "whatup")

furniture = Tree.create(name: "furniture", user: natedogg)

room = Branch.create(name: "room", tree: furniture)

sofa = Branch.create(name: "sofa", tree: furniture)
table = Branch.create(name: "table", tree: furniture)
sofa.parent = room
table.parent = room

chair = Branch.create(name: "chair", tree: furniture)
couch = Branch.create(name: "couch", tree: furniture)
chair.parent = sofa
couch.parent = sofa

legs = Branch.create(name: "legs", tree: furniture)
surface = Branch.create(name: "surface", tree: furniture)
legs.parent = table
surface.parent = table

# COMMUNITY TREE

community = Tree.create(name: "community")

room2 = Branch.create(name: "room", tree: community)

sofa2 = Branch.create(name: "sofa", tree: community)
table2 = Branch.create(name: "table", tree: community)
sofa2.parent = room2
table2.parent = room2

chair2 = Branch.create(name: "chair", tree: community)
couch2 = Branch.create(name: "couch", tree: community)
chair2.parent = sofa2
couch2.parent = sofa2

legs2 = Branch.create(name: "legs", tree: community)
surface2 = Branch.create(name: "surface", tree: community)
legs2.parent = table2
surface2.parent = table2
