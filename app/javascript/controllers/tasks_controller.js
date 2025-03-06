import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  toggle(event) {
    event.target.closest("form").requestSubmit();
  }
}
