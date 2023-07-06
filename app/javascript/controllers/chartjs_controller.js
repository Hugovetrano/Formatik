import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="chartjs"
export default class extends Controller {
  connect() {
    console.log("hello")
    this.grapheca();
    this.topprog();
  }
  // GRAPHE CA ANNUEL

  grapheca () {
      const div = document.getElementById("CAChart");
      const ctx = div.getContext('2d');
      const CAChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['Jan', 'Fev', 'Mar', 'Avr', 'Mai', 'Jui', 'Jul', 'Aou', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
          label: 'CA annuel',
          data: [105000, 130000, 140000, 150000, 210000, 190000, 90000, 30000, 110000, 130000, 130000, 60000],
          backgroundColor: 'rgba(91, 192, 248, 0.4)',
          borderColor: 'rgba(91, 192, 248, 0.6)',
          borderWidth: 2
        }]
      },
      options: {
        maintainAspectRatio: false,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }

  // TOP 5 PROGRAMMES
  topprog () {
    // APPEL DE LA METHODE DS LE CONTROLLER RUBY PROGRAMMES
    const url = '/programmes/getprogrammes'

    let dataset = {};
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        dataset = data
        this.#displaychart(dataset);
      })
    }

    #displaychart(dataset) {
      const div = document.getElementById("TopProg");
      const ctx = div.getContext('2d');
      const TopProg = new Chart(ctx, {
        type: 'pie',
        data: {
          labels: dataset["nom"],
          datasets: [{
            label: "CA / Programme",
            data: dataset["ca"],
            backgroundColor: [
              'rgb(255, 99, 132)',
              'rgb(54, 162, 235)',
              'rgb(255, 205, 86)',
              'rgb(88, 161, 68)',
              'rgb(220, 150, 60)',
            ],
            hoverOffset: 20
          }]
      }
    });
    }

}
