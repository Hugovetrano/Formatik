import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="session-intervenant-search-bar"
export default class extends Controller {
  connect() {
    console.log("have fun")
  }

  fetch() {
    console.log();
  }

}
