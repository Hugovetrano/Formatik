import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="show-session-flatpickr"
export default class extends Controller {
  static values = {
    column: String,
    id: Number
  }

  connect() {
    if (this.columnValue === "date_debut") {
      var defaultHour = 9
    } else {
      var defaultHour = 18
    }

    flatpickr(this.element, {
      minDate: "today",
      dateFormat: "Y-m-d",
      enableTime: true,
      defaultHour: defaultHour,
      time_24hr: true,
      onClose: (selectedDate) => {
        this.updateDate(selectedDate);
      }
    })
  }

  updateDate(selectedDate) {
    const url = "/sessions/" + this.idValue
    fetch(url, {
      method: 'PATCH',
      body: JSON.stringify({
        column: this.columnValue,
        new_value: selectedDate,
      }),
      headers: {
        'Content-type': 'application/json; charset=utf-8',
      },
    })
    .then((response) => response.json())
    .then((data) => {
      if (data.status === 'ok') {
        // Trouver l'élément <p> le plus proche en remontant dans la hiérarchie
        const paragraph = this.element.closest('.show-session-details-items');
        if (paragraph) {
          paragraph.innerHTML = data.new_line;
        }
      } else {
        console.log('La mise à jour a échoué');
      }
    })
  }
}
