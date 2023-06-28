import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index-session-calendar-toggle"
export default class extends Controller {
  // connect() {
  //   this.element.querySelector('.simple-calendar').classList.add('d-none');
  // }

  toggle() {
    this.element.querySelector('.simple-calendar').classList.toggle('d-none');
  }
}
