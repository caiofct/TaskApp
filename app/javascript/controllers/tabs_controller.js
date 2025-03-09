import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["tab"];

  tabTargetConnected(target) {
    // Whenever a new tab is added we need to advanced the history
    if (target.className.includes("new-list")) {
      window.history.pushState({}, '', target.href);
    }
  }

  toggle(event) {
    this.tabTargets.forEach(tab => {
      if (tab === event.target) {
        tab.classList.remove("text-gray-500", "border-transparent", "hover:text-gray-600", "hover:border-b-2", "hover:border-gray-200");
        tab.classList.add("text-indigo-600", "border-indigo-500", "border-b-2");
      } else {
        tab.classList.remove("text-indigo-600", "border-indigo-500", "border-b-2");
        tab.classList.add("text-gray-500", "border-transparent", "hover:text-gray-600", "hover:border-b-2", "hover:border-gray-200");
      }
  });
  }
}
