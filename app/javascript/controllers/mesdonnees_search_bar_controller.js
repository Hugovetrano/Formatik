import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['row'];

  filterTable() {
    const searchTerm = this.element.querySelector('input').value.toLowerCase();
    console.log(searchTerm);
    this.rowTargets.forEach((row) => {
      const rowText = Array.from(row.querySelectorAll('td')).map(td => td.textContent.toLowerCase()).join(' ');
      row.classList.toggle('hidden', !rowText.includes(searchTerm));
    });
  }
}
