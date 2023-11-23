function zoeken() {
  let input = document.getElementById("zoekterm").value;
  if (input != "") {
    window.location.replace(
      "http://localhost/educom-verrukkulluk/index.php?action=zoeken&zoekterm=" +
        input
    );
  } else {
    alert("Vul een zoekterm in");
  }
}


