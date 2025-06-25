import { Controller } from "@hotwired/stimulus"
import { Sortable } from "sortablejs"

export default class extends Controller {
  static targets = ["template", "container"]
  static values = { childIndex: String }

  connect() {
    Sortable.create(this.containerTarget, {
      onEnd: (event) => {
        this.containerTarget.querySelectorAll('.nested-fields').forEach((item, index) => {
          item.querySelector(`[data-position=${this.childIndexValue}]`).value = index + 1
        })
      }
    })
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
      item.querySelector(`[data-destroy="${this.childIndexValue}"]`).value = '1'
      item.style.display = 'none'
    }
  }
}
