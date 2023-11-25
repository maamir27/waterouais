import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-in"
export default class extends Controller {
  static values = { id: Number }
  static targets = ["button"]
  fire(event) {
    event.preventDefault();
    const url= `/stations/${ this.idValue }/reviews/new`;
    fetch( `/stations/${ this.idValue }/check_in`, {
      method: 'POST',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      }
    })
      .then(function(response) {
        if (response.ok) {
          window.location.href = url;
        } else {
          console.error('You cannot perform this action.');
        }
      });
      this.buttonTarget.disabled = true;
  }
}
