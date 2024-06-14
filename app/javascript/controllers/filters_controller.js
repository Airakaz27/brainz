import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filters"
export default class extends Controller {
  static targets = ["qi", "languages", "specialties", "price", "card"]
  connect() {
/*     console.log(this.qiTarget) */
/*     console.log(this.languagesTargets)
    console.log(this.languagesTargets[0].value); */
    // console.log(this.languagesTargets[0].checked);
/*     console.log(this.specialtiesTargets)
    console.log(this.priceTarget) */
  }

  update(event) {
    console.log("hello")
    const filterQi = parseInt(this.qiTarget.value)
    const filterPrice = this.priceTarget.value
    const filterLanguages = []
    const filterSpecialties = []
    this.languagesTargets.forEach(element => {
      if (element.checked) {
        languages.push(element.value)
      }
    });
    this.specialtiesTargets.forEach(element => {
      if (element.checked) {
        specialties.push(element.value)
      }
    });

    this.cardTargets.forEach(element => {
      const price = parseInt(element.getAttribute("data-price"))
      const qi = parseInt(element.getAttribute("data-qi"))
      const languages = element.getAttribute("data-languages")
      const specialties = element.getAttribute("data-specialties")
      if (qi < filterQi ) {
        element.style.display = "none"
      } else {
        element.style.display = ""
      }

      if (price > filterPrice ) {
        element.style.display = "none"
      } else {
        element.style.display = ""
      }

      

    })

  }
}
