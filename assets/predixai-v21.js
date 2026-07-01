document.addEventListener("input", event => {
  if (!event.target.matches("[data-search]")) return;
  const q = event.target.value.toLowerCase().trim();
  document.querySelectorAll("[data-card]").forEach(card => {
    card.style.display = card.innerText.toLowerCase().includes(q) ? "" : "none";
  });
});
