import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['apprenant', 'intervenant', 'entreprise', 'liintervenant', 'lientreprise', 'liapprenant']

  connect() {

  }

  apprenant() {
    this.apprenantTarget.style.display = "block";
    this.liapprenantTarget.classList.add("active");

    this.intervenantTarget.style.display = "none";
    this.liintervenantTarget.classList.remove("active");
    this.entrepriseTarget.style.display = "none";
    this.lientrepriseTarget.classList.remove("active");
  }

  intervenant() {
    this.intervenantTarget.style.display = "block";
    this.liintervenantTarget.classList.add("active");

    this.apprenantTarget.style.display = "none";
    this.liapprenantTarget.classList.remove("active");
    this.entrepriseTarget.style.display = "none";
    this.lientrepriseTarget.classList.remove("active");
  }

  entreprise() {
    this.entrepriseTarget.style.display = "block";
    this.lientrepriseTarget.classList.add("active");

    this.apprenantTarget.style.display = "none";
    this.liapprenantTarget.classList.remove("active");
    this.intervenantTarget.style.display = "none";
    this.liintervenantTarget.classList.remove("active");
  }
}
