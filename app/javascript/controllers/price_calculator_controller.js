import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["start", "end", "total"]

  connect() {
    console.log(this.startTarget)
    console.log(this.endTarget)
    console.log(this.totalTarget)
  }

  update() {
    let start = this.startTarget
    let end = this.endTarget
    let days = end - start
    console.log(days)
  }

}
