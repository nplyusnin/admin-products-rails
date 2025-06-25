import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "container"]
  static values = { childIndex: String }

  connect() {
  }

  add(event) {
    event.preventDefault()
    const content = this.templateTarget.innerHTML.replaceAll(this.childIndexValue, new Date().getTime())
    this.containerTarget.insertAdjacentHTML('beforeend', content)
  }
  
  remove(event) {
    event.preventDefault()
    const item = event.currentTarget.closest('.nested-fields')

    if (item) {
      item.querySelector('input[name*="_destroy"]').value = '1'
      item.style.display = 'none'
    }
  }
}
