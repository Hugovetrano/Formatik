import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="session-intervenant-search-bar"
export default class extends Controller {
  static targets = ["nameprog", "outputprog"]
  connect() {
    console.log("have fun")
  }

  updateOutput() {
    const nameprogValue = this.nameprogTarget.value;
    this.outputprogTarget.value = nameprogValue;
  }

}
