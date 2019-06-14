natedogg = User.create(username: "natedogg", password: "whatup")

chair = Mash.create(name: "chair")
couch = Mash.create(name: "couch")
furniture = Category.create(name: "furniture")

sofa = Mash.create(name: "sofa", category: furniture, user: natedogg)
sofa.halves << chair
sofa.halves << couch
