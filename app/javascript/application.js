import { Application } from "@hotwired/stimulus";
import * as Turbo from "@hotwired/turbo-rails";
import CharacterCountController from "controllers/character_count_controller"

const application = Application.start();
window.Stimulus   = application
application.register("character-count", CharacterCountController)


document.addEventListener("turbo:load", () => {
  const navbar = document.querySelector(".navbar");
  if (!navbar) return;

  const toggleNavbarShadow = () => {
    if (window.scrollY > 50) {
      navbar.classList.add("scrolled");
    } else {
      navbar.classList.remove("scrolled");
    }
  };

  toggleNavbarShadow(); // リロード時にも反映
  window.addEventListener("scroll", toggleNavbarShadow);
});

