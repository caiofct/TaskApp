import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"];

  openModal(event) {
    event.preventDefault()
    this.modalTarget.classList.remove("hidden");
    document.getElementById("list_name").focus();
  }

  closeModal(event) {
    event.preventDefault();
    this.modalTarget.classList.add("hidden");

    document.querySelectorAll(".list-tab").forEach(tab => {
      tab.classList.remove("text-indigo-600", "border-indigo-500", "border-b-2");
      tab.classList.add("text-gray-500", "border-transparent", "hover:text-gray-600", "hover:border-b-2", "hover:border-gray-200");
    });
  }
}
