import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-session-form"
export default class extends Controller {
  static targets = ['price', 'name', 'startDate', 'endDate']

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
}
