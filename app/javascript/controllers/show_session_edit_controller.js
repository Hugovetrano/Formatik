import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-session-edit"
export default class extends Controller {
  static values = {
    column: String,
    id: Number
  }

  openEdit() {
    this.element.insertAdjacentHTML('beforeend', "<input type='text' data-action='blur->show-session-edit#test'>");
  }

  test(event) {
    console.log(event.target.value);
    event.target.outerHTML = '';
  }

  updateDetails() {
    const id = this.element.children[0].getAttribute('data-show-session-edit-id-value');
    const column = this.element.children[0].getAttribute('data-show-session-edit-column-value');
    const url = "/sessions/" + id
    fetch(url, {
      method: 'PATCH',
      body: JSON.stringify({
        column: column,
        new_value: new_value,
      }),
      headers: {
        'Content-type': 'application/json; charset=utf-8',
      },
    })
    .then((response) => response.json())
    .then((data) => {
      if (data.status === 'ok') {
        // Trouver l'élément <p> le plus proche en remontant dans la hiérarchie
        const paragraph = this.element.closest('.show-session-details-items');
        if (paragraph) {
          paragraph.innerHTML = data.new_line;
        }
      } else {
        console.log('La mise à jour a échoué');
      }
    })
  }
  }
