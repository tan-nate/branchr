natedogg = User.create(username: "natedogg", password: "whatup")

furniture = Tree.create(name: "furniture", user: natedogg)

room = Branch.create(name: "room", tree: furniture)

sofa = Branch.create(name: "sofa", tree: furniture)
table = Branch.create(name: "table", tree: furniture)
room.children << sofa
room.children << table

chair = Branch.create(name: "chair", tree: furniture)
couch = Branch.create(name: "couch", tree: furniture)
sofa.children << chair
sofa.children << couch

legs = Branch.create(name: "legs", tree: furniture)
surface = Branch.create(name: "surface", tree: furniture)
table.children << legs
table.children << surface

# COMMUNITY TREE

community = Tree.create(name: "community")

room2 = Branch.create(name: "room", tree: community)

sofa2 = Branch.create(name: "sofa", tree: community)
table2 = Branch.create(name: "table", tree: community)
room2.children << sofa2
room2.children << table2

chair2 = Branch.create(name: "chair", tree: community)
couch2 = Branch.create(name: "couch", tree: community)
sofa2.children << chair2
sofa2.children << couch2

legs2 = Branch.create(name: "legs", tree: community)
surface2 = Branch.create(name: "surface", tree: community)
table2.children << legs2
table2.children << surface2
