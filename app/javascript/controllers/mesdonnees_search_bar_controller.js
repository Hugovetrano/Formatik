import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['row'];
  connect() {
    console.log('Hello from MesdonneesSearchBarController');
  }
  filterTable() {
    const searchTerm = this.element.querySelector('input').value.toLowerCase();
    console.log(searchTerm);
    this.rowTargets.forEach((row) => {
      const rowText = Array.from(row.querySelectorAll('td')).map(td => td.textContent.toLowerCase()).join(' ');
      row.classList.toggle('hidden', !rowText.includes(searchTerm));
    });
  }

  clicked(event) {
    var link = event.currentTarget.dataset.link;
    if (link) {
      window.location.href = link;
    }
  }
}
