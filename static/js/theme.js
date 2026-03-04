const toggle = document.getElementById("themeToggle");

toggle.addEventListener("click", () => {
  const current = document.body.dataset.theme;
  document.body.dataset.theme = current === "light" ? "dark" : "light";
  toggle.textContent = current === "light" ? "🌞" : "🌙";
});