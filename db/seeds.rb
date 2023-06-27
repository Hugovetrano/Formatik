# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Intervenant.create!({nom: 'muller', prenom: 'franck', email: 'franck.muller@gmail.com', adresse: '8 rue de la paix', code_postal: '58960', ville: 'Maville', telephone: '0654688930', num_da: "457852569875324", siret: "45875896325645275846", tarif: 350})
Intervenant.create!({nom: 'james', prenom: 'guillaume', email: 'guillaume.james@gmail.com', adresse: '8 rue de la mour', code_postal: '58860', ville: 'Saville', telephone: '0654688850', num_da: "457852569875444", siret: "45875896325645275222", tarif: 250})
Intervenant.create!({nom: 'dupont', prenom: 'jean', email: 'jean.dupont@gmail.com', adresse: '8 rue de la pomme', code_postal: '55960', ville: 'Leurville', telephone: '0654688741', num_da: "457852569875526", siret: "45875896325645275598", tarif: 280})

Programme.create!({titre: 'forgeron fullstack', description: "programme complet pour devenir forgeron", prix: 5000})
Programme.create!({titre: 'apiculteur remote', description: "programme complet pour devenir apiculteur", prix: 30000})
Programme.create!({titre: 'responsable navigation en eau non-navigable', description: "programme complet pour devenir forgeron", prix: 5000})