import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  connect() {
    this.element.setAttribute("data-action", "keyup->search#search")
  }

  search() {
    let params = new URLSearchParams()
    params.append("q[name_or_plate_number_or_capacity_cont]", this.element.value)

    fetch(`http://localhost:3000/suppliers/4/products?${params}`, {
      method: "GET",
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
      .then(r => r.text())
      .then(html => Turbo.renderStreamMessage(html))
  }
}
