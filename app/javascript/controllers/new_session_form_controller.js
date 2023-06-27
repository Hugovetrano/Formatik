import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-session-form"
export default class extends Controller {
  static targets = ['price']
  static values = {
    programmePrice: Number
  }

  updatePrice() {
    console.log(this.element.dataset.programmePriceValue);
  }
}
