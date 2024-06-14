import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filters"
export default class extends Controller {
  static targets = ["qi", "languages", "specialties", "price", "card"]
  connect() {
/*     console.log(this.qiTarget) */
/*     console.log(this.languagesTargets)
    // console.log(this.languagesTargets[0].checked);
/*     console.log(this.specialtiesTargets)
    console.log(this.priceTarget) */
/*     console.log(this.cardTargets);
    const french = this.languagesTargets[0].value
    console.log(this.cardTargets[1].getAttribute("data-languages").includes(french)); */
  }

  update(event) {
    event.preventDefault()

    this.cardTargets.forEach(card => {
      card.classList.remove('d-none')
    })

    const filterLanguages = []
    const filterSpecialties = []

    const filterQi = parseInt(this.qiTarget.value)
    this.languagesTargets.forEach(language => {
      if(language.checked) { filterLanguages.push(language.value) }
     })
    this.specialtiesTargets.forEach(specialty => {
      if (specialty.checked) {
        filterSpecialties.push(specialty.value)
      }
    })
    const filterPrice = parseInt(this.priceTarget.value)
    const cards = this.cardTargets

    if(filterQi) {
      this.filterByQi(cards, filterQi)
    }

    if(filterLanguages.length > 0) {
      this.filterByLanguage(cards, filterLanguages)
    }

    if(filterSpecialties) {
      this.filterBySpecialty(cards, filterSpecialties)
    }

    if(filterPrice) {
      this.filterByPrice(cards, filterPrice)
    }
  }

  filterByPrice(cards, filterPrice) {
    cards.forEach(card => {
      if (card.dataset.price > filterPrice) {
        card.classList.add("d-none")
      } else {
        card.classList.remove("d-none")
      }
    })
  }

  filterBySpecialty(cards, filterSpecialties) {
    cards.forEach(card => {
      if(!card.dataset.specialties.includes(filterSpecialties.join())) {
        card.classList.add("d-none")
      }
    })
  }

  filterByLanguage(cards, filterLanguages) {
    cards.forEach(card => {
      if(!card.dataset.languages.includes(filterLanguages.join(" "))) {
        card.classList.add("d-none")
      }
    })
  }
  filterByQi(cards, filterQi) {
    cards.forEach(card => {
      if (card.dataset.qi < filterQi) {
        card.classList.add("d-none")
      }
    })
  }
}
