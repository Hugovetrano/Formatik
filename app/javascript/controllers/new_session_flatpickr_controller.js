import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import moment from "moment";
import "moment-timezone";

// Connects to data-controller="new-session-flatpickr"
export default class extends Controller {
  static targets = ['startDate', 'endDate', 'dates']
  
  connect() {
    flatpickr(this.element, {
      mode: "range",
      minDate: "today",
      dateFormat: "Y-m-d",
      enableTime: true,
      defaultHour: 9,
      time_24hr: true,
      onClose: (selectedDates) => {
        this.handleDateSelection(selectedDates);
      }
    });
  }

  handleDateSelection(selectedDates) {
    moment.tz.setDefault("Europe/Paris");

    const startTimestamp = Math.floor(selectedDates[0].getTime() / 1000);
    const endTimestamp = Math.floor(selectedDates[selectedDates.length - 1].getTime() / 1000);

    const startDate = moment(selectedDates[0]);
    const endDate = moment(selectedDates[selectedDates.length - 1]);
    const formattedStartDate = startDate.format('dddd D MMMM YYYY HH:mm');
    const formattedEndDate = endDate.format('dddd D MMMM YYYY HH:mm');

    // Utilisez les valeurs startDate et endDate comme vous le souhaitez
    console.log(startTimestamp, endTimestamp);

    // Vous pouvez également mettre à jour d'autres éléments du formulaire
    this.startDateTarget.value = startDate.format();
    this.endDateTarget.value = endDate.format();
    this.datesTarget.value = 'Du ' + formattedStartDate + ' au ' + formattedEndDate;
  }
}
