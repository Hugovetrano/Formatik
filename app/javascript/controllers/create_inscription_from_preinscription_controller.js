import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-inscription-from-preinscription"
export default class extends Controller {
  static targets = ['prenom', 'nom', 'email', 'telephone', 'profession', 'adresseFacturation', 'codePostal', 'ville', 'niveauEtude', 'entrepriseId', 'formulaireApprenantEnregistre']
  
  updateApprenant(event) {
    event.preventDefault();
    const url = `/apprenants/update_by_mail`
    const prenom = this.prenomTarget.value;
    const nom = this.nomTarget.value;
    const email = this.emailTarget.value;
    const telephone = this.telephoneTarget.value;
    const profession = this.professionTarget.value;
    const adresse_facturation = this.adresseFacturationTarget.value;
    const code_postal = this.codePostalTarget.value;
    const ville = this.villeTarget.value;
    const niveau_etude = this.niveauEtudeTarget.value;
    const entreprise_id = this.entrepriseIdTarget.value;
    
    fetch(url, {
      method: "post",
      body: JSON.stringify({
        prenom: prenom,
        nom: nom,
        email: email,
        profession: profession,
        adresse_facturation: adresse_facturation,
        code_postal: code_postal,
        ville: ville,
        telephone: telephone,
        niveau_etude: niveau_etude,
        entreprise_id: entreprise_id
      }),
      headers: {
        'content-type': 'application/json; charset=utf-8'
      }
    })
    .then((response) => response.json())
    .then((data) => {
      console.log(data)
    })
  }
  
  createApprenant(event) {
    event.preventDefault();
    const url = `/apprenants`
    const prenom = this.prenomTarget.value;
    const nom = this.nomTarget.value;
    const email = this.emailTarget.value;
    const telephone = this.telephoneTarget.value;
    const profession = this.professionTarget.value;
    const adresse_facturation = this.adresseFacturationTarget.value;
    const code_postal = this.codePostalTarget.value;
    const ville = this.villeTarget.value;
    const niveau_etude = this.niveauEtudeTarget.value;
    const entreprise_id = this.entrepriseIdTarget.value;
    
    
    fetch(url, {
      method: "post",
      body: JSON.stringify({
        prenom: prenom,
        nom: nom,
        email: email,
        profession: profession,
        adresse_facturation: adresse_facturation,
        code_postal: code_postal,
        ville: ville,
        telephone: telephone,
        niveau_etude: niveau_etude,
        entreprise_id: entreprise_id
      }),
      headers: {
        'content-type': 'application/json; charset=utf-8',
        'Accept': 'application/json'
      }
    })
    .then((response) => response.json())
    .then((data) => {
      window.location.reload();
    })
  }
}
