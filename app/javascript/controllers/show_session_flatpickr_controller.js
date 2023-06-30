import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// import { French } from "./fr"

// Connects to data-controller="show-session-flatpickr"
export default class extends Controller {
  static values = {
    column: String,
    id: Number
  }

  connect() {
    const French = {
      firstDayOfWeek: 1,

      weekdays: {
          shorthand: ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"],
          longhand: [
              "Dimanche",
              "Lundi",
              "Mardi",
              "Mercredi",
              "Jeudi",
              "Vendredi",
              "Samedi",
          ],
      },

      months: {
          shorthand: [
              "Janv",
              "Févr",
              "Mars",
              "Avr",
              "Mai",
              "Juin",
              "Juil",
              "Août",
              "Sept",
              "Oct",
              "Nov",
              "Déc",
          ],
          longhand: [
              "Janvier",
              "Février",
              "Mars",
              "Avril",
              "Mai",
              "Juin",
              "Juillet",
              "Août",
              "Septembre",
              "Octobre",
              "Novembre",
              "Décembre",
          ],
      },

      ordinal: (nth) => {
          if (nth > 1) return "";

          return "er";
      },
      rangeSeparator: " au ",
      weekAbbreviation: "Sem",
      scrollTitle: "Défiler pour augmenter la valeur",
      toggleTitle: "Cliquer pour basculer",
      time_24hr: true,
  };


    if (this.columnValue === "date_debut") {
      var defaultHour = 9
    } else {
      var defaultHour = 18
    }

    flatpickr(this.element, {
      locale: French,
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
