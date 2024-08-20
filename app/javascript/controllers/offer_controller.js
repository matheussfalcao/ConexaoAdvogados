import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offer"
export default class extends Controller {
  static targets = ["content"];
  close() {
    this.contentTarget.classList.add('hidden');
  }
  // connect() {
  // }
}
