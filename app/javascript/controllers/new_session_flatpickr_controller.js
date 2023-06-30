import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// import { French } from "./fr"
import moment from "moment";
import "moment-timezone";

moment.locale('fr', {
  months : 'janvier_février_mars_avril_mai_juin_juillet_août_septembre_octobre_novembre_décembre'.split('_'),
  monthsShort : 'janv._févr._mars_avr._mai_juin_juil._août_sept._oct._nov._déc.'.split('_'),
  monthsParseExact : true,
  weekdays : 'dimanche_lundi_mardi_mercredi_jeudi_vendredi_samedi'.split('_'),
  weekdaysShort : 'dim._lun._mar._mer._jeu._ven._sam.'.split('_'),
  weekdaysMin : 'Di_Lu_Ma_Me_Je_Ve_Sa'.split('_'),
  weekdaysParseExact : true,
  longDateFormat : {
      LT : 'HH:mm',
      LTS : 'HH:mm:ss',
      L : 'DD/MM/YYYY',
      LL : 'D MMMM YYYY',
      LLL : 'D MMMM YYYY HH:mm',
      LLLL : 'dddd D MMMM YYYY HH:mm'
  },
  calendar : {
      sameDay : '[Aujourd hui à] LT',
      nextDay : '[Demain à] LT',
      nextWeek : 'dddd [à] LT',
      lastDay : '[Hier à] LT',
      lastWeek : 'dddd [dernier à] LT',
      sameElse : 'L'
  },
  relativeTime : {
      future : 'dans %s',
      past : 'il y a %s',
      s : 'quelques secondes',
      m : 'une minute',
      mm : '%d minutes',
      h : 'une heure',
      hh : '%d heures',
      d : 'un jour',
      dd : '%d jours',
      M : 'un mois',
      MM : '%d mois',
      y : 'un an',
      yy : '%d ans'
  },
  dayOfMonthOrdinalParse : /\d{1,2}(er|e)/,
  ordinal : function (number) {
      return number + (number === 1 ? 'er' : 'e');
  },
  meridiemParse : /PD|MD/,
  isPM : function (input) {
      return input.charAt(0) === 'M';
  },
  // In case the meridiem units are not separated around 12, then implement
  // this function (look at locale/id.js for an example).
  // meridiemHour : function (hour, meridiem) {
  //     return /* 0-23 hour, given meridiem token and hour 1-12 */ ;
  // },
  meridiem : function (hours, minutes, isLower) {
      return hours < 12 ? 'PD' : 'MD';
  },
  week : {
      dow : 1, // Monday is the first day of the week.
      doy : 4  // Used to determine first week of the year.
  }
});

// Connects to data-controller="new-session-flatpickr"
export default class extends Controller {
  static targets = ['startDate', 'endDate', 'dates']

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
    flatpickr(this.element, {
      locale: French,
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
    const formattedStartDate = startDate.format('LLLL', 'fr');
    const formattedEndDate = endDate.format('LLLL', 'fr');

    // Utilisez les valeurs startDate et endDate comme vous le souhaitez
    console.log(startTimestamp, endTimestamp);

    // Vous pouvez également mettre à jour d'autres éléments du formulaire
    this.startDateTarget.value = startDate.format();
    this.endDateTarget.value = endDate.format();
    this.datesTarget.value = `Du ${formattedStartDate} au ${formattedEndDate}`;
  }
}
