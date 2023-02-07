import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  open() {
    document.getElementById("navbar-default").classList.toggle("hidden");

  }
}
