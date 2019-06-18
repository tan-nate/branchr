natedogg = User.create(username: "natedogg", password: "whatup")

furniture = Tree.create(name: furniture, user: natedogg)

living_room = Branch.create(name: "living room", tree: furniture)

sofa = Branch.create(name: "sofa", tree: furniture)
table = Branch.create(name: "table", tree: furniture)
living_room.children << sofa
living_room.children << table

chair = Branch.create(name: "chair", tree: furniture)
couch = Branch.create(name: "couch", tree: furniture)
sofa.children << chair
sofa.children << couch

legs = Branch.create(name: "legs", tree: furniture)
surface = Branch.create(name: "surface", tree: furniture)
table.children << legs
table.children << surface

# COMMUNITY TREE

community = Tree.create(name: community)
