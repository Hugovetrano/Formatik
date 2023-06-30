// document.addEventListener("DOMContentLoaded", function() {
//   var tableRows = document.querySelectorAll("tr[data-link]");
//   tableRows.forEach(function(row) {
//     row.addEventListener("click", function() {
//       var link = this.dataset.link;
//       if (link) {
//         window.location.href = link;
//       }
//     });
//   });
// });

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Hello from IndexApprenantTableController");
  }

  clicked(event) {
    console.log(event.currentTarget);
  }
}
