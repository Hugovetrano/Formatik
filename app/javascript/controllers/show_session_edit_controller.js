import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  openEdit(event) {
    // cache l'élément span
    this.spanElement = this.element.querySelector('span');
    this.spanElement.style.display = 'none';

    // Enregistre le nom de la colonne et l'ID pour les utiliser plus tard
    this.columnName = event.target.getAttribute('data-show-session-edit-column-value');
    this.sessionId = event.target.getAttribute('data-show-session-edit-id-value');
  
    // Determine la classe CSS de l'input basée sur le nom de la colonne
    let inputClass = "";
    if (this.columnName === 'adresse') {
        inputClass = 'input-long';
    } else if (this.columnName === 'prix') {
        inputClass = 'input-short';
    } else if (this.columnName === 'nom') {
        inputClass = 'input-medium';
    }

    // affiche l'élément input avec la classe CSS appropriée
    this.element.insertAdjacentHTML('beforeend', `<input type='text' class='${inputClass}' data-action='blur->show-session-edit#updateDetails keyup.enter->show-session-edit#updateDetails'>`);
    this.inputElement = this.element.querySelector('input');
    this.inputElement.value = this.spanElement.innerText.includes("€") ? this.spanElement.innerText.replace("€", "") : this.spanElement.innerText;
    this.inputElement.focus();
  }


  updateDetails(event) {
    const new_value = event.target.value;
    const url = "/sessions/" + this.sessionId;
    fetch(url, {
      method: 'PATCH',
      body: JSON.stringify({
        column: this.columnName,
        new_value: new_value,
      }),
      headers: {
        'Content-type': 'application/json; charset=utf-8',
      },
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.status === 'ok') {
          // supprime l'input
          this.inputElement.remove();

          // met à jour le texte de l'élément span et l'affiche
          this.spanElement.innerHTML = data.new_line;
          this.spanElement.style.display = 'inline';
        } else {
          console.log('La mise à jour a échoué');
        }
      })
  }
}
