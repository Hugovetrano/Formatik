/* French locals for flatpickr */
const fp =
    typeof window !== "undefined" && window.flatpickr !== undefined
        ? window.flatpickr
        : {
            l10ns: {},
        };

export const French = {
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

fp.l10ns.fr = French;

export default fp.l10ns;
