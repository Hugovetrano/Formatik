import { Controller } from "@hotwired/stimulus"
import Popover from 'stimulus-popover'


// Connects to data-controller="new-session-form"
// POPOVER REPREND LES CARACTERISTIQUES DU CONTROLLER CLASSIQUE
export default class extends Popover {
  static targets = ['price', 'name', 'startDate', 'endDate', 'rowspecialty', 'outputSpecialty']

  connect() {
    console.log('Hello from NewSessionFormController');
  }

  updateInputs(event) {
    // Recuperation du prix du programme depuis une method du controller
    const programmeID = event.currentTarget.value;
    const url = "/getProgDetails/" + programmeID;
    fetch(url)
      .then(response => response.text())
      .then((data) => {
        const newPrice = data.split(',')[0];
        const newName = data.split(',')[1];
        this.priceTarget.value = newPrice;
        this.nameTarget.value = newName;
      });
      // Assignation du nouveau prix à l'input
  }

  keywordSearch(event) {
    const searchWord = event.target.value.toLowerCase();
    // const searchWord = this.element.querySelector('input').value.toLowerCase();
    // console.log(searchWord);
    this.rowspecialtyTargets.forEach((rowspecialty) => {
      const rowText = Array.from(rowspecialty.querySelectorAll('td')).map(td => td.textContent.toLowerCase()).join(' ');
      rowspecialty.classList.toggle('hidden', !rowText.includes(searchWord));
    });
  }

  clicked(event) {
    // ON RECUPERE LES DONNES DE L'ANNUAIRE DOM
    const interv = event.target.parentNode
    console.log(interv);
    const firstColumn = interv.querySelector('td:first-child');
    const sndColumn = interv.querySelector('td:nth-child(2)');
    console.log(sndColumn);
    const outputSpecialty = this.outputSpecialtyTarget;
    console.log(outputSpecialty)
    if (firstColumn) {
        outputSpecialty.value = `${firstColumn.textContent} ${sndColumn.textContent}`;
      }
}
}
