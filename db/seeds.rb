require 'faker'
Faker::Config.locale = 'fr'
require 'date'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Inscription.destroy_all
Session.destroy_all
Apprenant.destroy_all
Entreprise.destroy_all
Intervenant.destroy_all
Parcoursadmin.destroy_all
Programme.destroy_all
User.destroy_all
puts "============Creating Apprenants & Entreprises...============"
# --------------------------------ENTREPRISES----------------------------------
x = 0
while x < 5
  entreprise = {
    nom: Faker::Company.name,
    siret: rand((10**13)..((10**14) - 1))
  }
  entreprise = Entreprise.create!(entreprise)
  puts "------Entreprise #{entreprise.nom}------"
  # ------------------------------APPRENANTS------------------------------------
  apprenants = []
  i = 0
  while i < 15
    name = Faker::Name.first_name
    surname = Faker::Name.last_name
    apprenants << {
      prenom: name,
      nom: surname,
      email: "#{name}.#{surname}@gmail.com",
      telephone: Faker::PhoneNumber.cell_phone,
      profession: Faker::Job.title,
      adresse_facturation: Faker::Address.street_address,
      code_postal: Faker::Address.zip_code,
      ville: Faker::Address.city,
      niveau_etude: "Bac+5",
      entreprise_id: entreprise.id
    }
    i += 1
  end
  x += 1
  apprenants.each do |attributes|
    apprenant = Apprenant.create!(attributes)
    puts "Created #{apprenant.prenom} #{apprenant.nom}"
  end
end
# ------------------------------INTERVENANTS------------------------------------
puts "============Creating Intervenants...============"
intervenants = []
i = 0
while i < 15
  name = Faker::Name.first_name
  surname = Faker::Name.last_name
  intervenants << {
    prenom: name,
    nom: surname,
    email: Faker::Internet.email,
    telephone: Faker::PhoneNumber.cell_phone,
    adresse: Faker::Address.street_address,
    code_postal: Faker::Address.zip_code,
    ville: Faker::Address.city,
    num_da: Faker::Number.number(digits: 10),
    siret: rand((10**13)..((10**14) - 1)),
    tarif: rand(100..500)
  }
  i += 1
end
intervenants.each do |attributes|
  intervenant = Intervenant.create!(attributes)
  puts "Created #{intervenant.prenom} #{intervenant.nom}"
end

# -------------------------------PROGRAMMES-------------------------------------
puts "============Creating Programmes...============"
programme = {
  titre: "Développement Web Full Stack",
  description: "Cette formation complète et intensive forme les participants aux technologies front-end et back-end du développement web. Les apprenants acquerront des compétences en HTML, CSS, JavaScript, ainsi que dans les langages de programmation côté serveur tels que Ruby, Python ou PHP. Ils apprendront à créer des applications web dynamiques et interactives, à intégrer des bases de données, et à utiliser des frameworks populaires tels que Ruby on Rails ou Django. À la fin de la formation, les participants seront prêts à relever les défis du développement web moderne.",
  prix: 7400
}
programme = Programme.create!(programme)
puts "Created #{programme.titre}"

puts "============Creating Programmes...============"
programme = {
  titre: "Data analyst",
  description: "Cette formation de Data Analyst est conçue pour fournir aux participants les compétences et connaissances nécessaires pour analyser et interpréter les données de manière stratégique. Les apprenants acquerront une solide compréhension des concepts clés de l'analyse de données, des techniques statistiques et des outils d'exploration de données. Ils apprendront à extraire des informations précieuses à partir de vastes ensembles de données, à effectuer des analyses approfondies et à présenter des insights clairs et pertinents. Cette formation pratique et orientée vers les projets permettra aux participants de maîtriser les compétences essentielles du Data Analyst et de contribuer efficacement à la prise de décision basée sur les données au sein d'une organisation.",
  prix: 7500
}
programme = Programme.create!(programme)
puts "Created #{programme.titre}"

programme = {
  titre: "Intelligence Artificielle et Machine Learning",
  description: "Cette formation approfondie est conçue pour les passionnés d'intelligence artificielle et d'apprentissage automatique. Les participants apprendront les concepts fondamentaux de l'IA et du ML, ainsi que les techniques de prétraitement des données, la construction de modèles, l'évaluation des performances et le déploiement. Ils exploreront également des domaines tels que la vision par ordinateur, le traitement du langage naturel et les réseaux de neurones. À la fin de la formation, les apprenants seront en mesure de développer des modèles prédictifs et des systèmes intelligents.",
  prix: 6400
}
programme = Programme.create!(programme)
puts "Created #{programme.titre}"

programme = {
  titre: "Cyber sécurité et Ethical Hacking",
  description: "Cette formation avancée en cyber sécurité forme les participants aux techniques de protection des systèmes et des réseaux contre les attaques malveillantes. Les apprenants découvriront les principaux types de cybermenaces, les vulnérabilités courantes et les meilleures pratiques pour sécuriser les infrastructures. Ils acquerront des compétences en test d'intrusion, en analyse de vulnérabilité et en réponse aux incidents de sécurité. La formation mettra également l'accent sur l'éthique du hacking, en enseignant aux participants comment identifier les vulnérabilités et renforcer la sécurité des systèmes de manière éthique.",
  prix: 5900
}
programme = Programme.create!(programme)
puts "Created #{programme.titre}"

programme = {
  titre: "Marketing Digital",
  description: "Cette formation approfondie en marketing digital donne aux participants les compétences nécessaires pour réussir dans l'écosystème numérique en constante évolution. Les apprenants exploreront les principes fondamentaux du marketing en ligne, y compris la stratégie de contenu, le référencement, la publicité en ligne, le marketing des médias sociaux et l'analyse de données. Ils apprendront à promouvoir efficacement des produits et services sur les canaux numériques, à optimiser les campagnes publicitaires et à mesurer les résultats pour obtenir un avantage concurrentiel sur le marché.",
  prix: 8600
}
programme = Programme.create!(programme)
puts "Created #{programme.titre}"

programme = {
  titre: "Design d'Expérience Utilisateur (UX Design)",
  description: "Cette formation pratique en UX Design enseigne aux participants les principes et les méthodologies du design centré sur l'utilisateur. Les apprenants exploreront les techniques de recherche utilisateur, la création de personas, la conception d'interfaces utilisateur attrayantes et conviviales, et l'évaluation des prototypes. Ils apprendront également à mener des tests d'utilisabilité et à itérer sur leurs designs pour fournir des expériences utilisateur exceptionnelles. À la fin de la formation, les participants seront capables de concevoir des applications et des sites web qui répondent aux besoins et aux attentes des utilisateurs.",
  prix: 9700
}
programme = Programme.create!(programme)
puts "Created #{programme.titre}"

programme = {
  titre: "Business Intelligence et Data Visualization",
  description: "Cette formation approfondie en business intelligence (BI) et en visualisation des données forme les participants à extraire des informations précieuses à partir de vastes ensembles de données et à les communiquer de manière claire et percutante. Les apprenants acquerront des compétences en collecte, en nettoyage et en analyse de données, ainsi qu'en création de tableaux de bord interactifs et de visualisations percutantes. Ils utiliseront des outils populaires tels que Tableau, Power BI ou D3.js pour présenter des insights et prendre des décisions éclairées basées sur les données.",
  prix: 6700
}
programme = Programme.create!(programme)
puts "Created #{programme.titre}"

programme = {
  titre: "Développement d'Applications Mobiles",
  description: "Cette formation pratique en développement d'applications mobiles prépare les participants à concevoir et à créer des applications mobiles pour les plateformes iOS et Android. Les apprenants acquerront des compétences en programmation mobile, en utilisant des langages tels que Swift ou Kotlin, et en utilisant des frameworks tels que Flutter ou React Native. Ils apprendront à concevoir des interfaces conviviales pour les appareils mobiles, à intégrer des fonctionnalités avancées et à publier leurs applications sur les app stores. À la fin de la formation, les participants seront prêts à développer des applications mobiles performantes et intuitives.",
  prix: 5400
}
programme = Programme.create!(programme)
puts "Created #{programme.titre}"

programme = {
  titre: "Management et Leadership",
  description: "Cette formation en management et leadership vise à développer les compétences essentielles pour diriger avec succès des équipes et des projets. Les participants exploreront les différentes théories et modèles de leadership, la gestion des performances, la résolution de conflits et la communication efficace. Ils acquerront des compétences en planification stratégique, en prise de décision, en gestion du changement et en motivation d'équipe. La formation fournira également des outils et des techniques pour gérer le temps, les ressources et les priorités afin d'atteindre les objectifs organisationnels.",
  prix: 9300
}
programme = Programme.create!(programme)
puts "Created #{programme.titre}"

programme = {
  titre: "Analyse des Réseaux Sociaux",
  description: "Cette formation spécialisée en analyse des réseaux sociaux permet aux participants de comprendre les comportements et les interactions sur les réseaux sociaux, ainsi que d'extraire des insights précieux pour les entreprises et les organisations. Les apprenants exploreront les méthodes d'analyse des réseaux sociaux, les outils d'extraction de données et les techniques de visualisation. Ils apprendront à identifier les tendances, à évaluer l'impact des campagnes et à prendre des décisions éclairées en utilisant les données des réseaux sociaux.",
  prix: 4500
}
programme = Programme.create!(programme)
puts "Created #{programme.titre}"

# ---------------------------------SESSIONS-------------------------------------
puts "============Creating Sessions & Inscriptions...============"
i = 0
while i < 15
  start_date = Faker::Date.between(from: Date.today, to: 30.days.from_now)
  end_date = start_date + rand(1..5).days
  programme = Programme.order("RANDOM()").first
  session = {
    date_debut: start_date,
    date_fin: end_date,
    programme_id: programme.id,
    intervenant_id: Intervenant.order("RANDOM()").first.id,
    prix: programme.prix,
    adresse: Faker::Address.full_address
  }
  session = Session.create!(session)
  puts "Created #{session.date_debut} - #{session.date_fin}"
# -------------------------------INSCRIPTIONS-----------------------------------
  x = 0
  while x < rand(10..25)
    inscription = {
      session_id: session.id,
      apprenant_id: Apprenant.order("RANDOM()").first.id,
      parcoursadmin_id: Parcoursadmin.create!.id
    }
    inscription = Inscription.create!(inscription)
    puts "Created Inscription for #{inscription.apprenant.prenom} #{inscription.apprenant.nom}"
    x += 1
  end
  i += 1
end

# -------------------------------INSCRIPTIONS-----------------------------------
hugop = {
  genre: "Homme",
  nom: "Petament",
  prenom: "Hugo",
  email: "h.petament@icloud.com",
  password: "password",
  fonction: "Co-founder"
}
hugop = User.create!(hugop)
puts "------Created User :#{hugop.prenom} #{hugop.nom}------"

hugov = {
  genre: "Homme",
  nom: "Vetrano",
  prenom: "Hugo",
  email: "hugo.vetrano@ieseg.fr",
  password: "password",
  fonction: "Co-founder"
}
hugov = User.create!(hugov)
puts "------Created User :#{hugov.prenom} #{hugov.nom}------"

vincent = {
  genre: "Homme",
  nom: "Beaumont",
  prenom: "Vincent",
  email: "jkawtech@gmail.com",
  password: "password",
  fonction: "Co-founder"
}
vincent = User.create!(vincent)
puts "------Created User :#{vincent.prenom} #{vincent.nom}------"

karl = {
  genre: "Homme",
  nom: "Vandenabeele",
  prenom: "Karl",
  email: "karl.vandenabeele@gmail.com",
  password: "password",
  fonction: "Co-founder"
}
karl = User.create!(karl)
puts "------Created User :#{karl.prenom} #{karl.nom}------"

# -------------------------------CONCLUSION-------------------------------------
puts "Finished!"
puts "============Seeding Complete!============"
puts "Created #{Apprenant.count} Apprenants"
puts "Created #{Intervenant.count} Intervenants"
puts "Created #{Programme.count} Programmes"
puts "Created #{Session.count} Sessions"
puts "Created #{Inscription.count} Inscriptions"
puts "Created #{User.count} Users"
