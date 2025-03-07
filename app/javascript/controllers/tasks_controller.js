import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  edit(event) {
    event.preventDefault();
    event.target.classList.add("hidden");
    const descriptionInput = event.target.closest("form").getElementsByClassName("task-description-field")[0];
    descriptionInput.classList.remove("hidden");
    descriptionInput.focus();
  }

  submitEdit(event) {
    event.preventDefault();
    event.target.closest("form").requestSubmit();
  }

  blur(event) {
    event.preventDefault();
    event.target.classList.add("hidden");
    event.target.closest("form").getElementsByClassName("task-description-link")[0].classList.remove("hidden");
  }

  toggle(event) {
    event.target.closest("form").requestSubmit();
  }
}
