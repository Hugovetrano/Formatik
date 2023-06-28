document.addEventListener("DOMContentLoaded", function() {
  var tableRows = document.querySelectorAll("tr[data-link]");
  tableRows.forEach(function(row) {
    row.addEventListener("click", function() {
      var link = this.dataset.link;
      if (link) {
        window.location.href = link;
      }
    });
  });
});
