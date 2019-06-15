natedogg = User.create(username: "natedogg", password: "whatup")

furniture = Tree.create(name: furniture, user: natedogg)

chair = Branch.create(name: "chair", tree: furniture)
couch = Branch.create(name: "couch", tree: furniture)

sofa = Branch.create(name: "sofa", tree: furniture)
sofa.children << chair
sofa.children << couch

living_room = Branch.create(name: "living room", tree: furniture)
table = Branch.create(name: "table", tree: furniture)

living_room.children << sofa
living_room.children << table
