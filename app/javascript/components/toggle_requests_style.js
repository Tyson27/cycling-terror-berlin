// This is JS for dashboard page to toggle buttons.

const initToggleMenu1 = () => {
  const createButton = document.querySelector("#Menu1-button")
  const createContainer = document.querySelector("#Menu1-container")
  const containerMenu2 = document.querySelector("#Menu2-container")

  if (createButton) {
    createButton.addEventListener("click", () => {
      if (containerMenu2.classList.contains("show")) {
      containerMenu2.classList.remove("show")
      containerMenu2.classList.add("hide")}
    console.log(createContainer)
    createContainer.classList.remove("hide")
    createContainer.classList.add("show")
  })
  }
}

const initToggleMenu2 = () => {
  const createButton = document.querySelector("#Menu2-button")
  const createContainer = document.querySelector("#Menu2-container")
  const containerMenu1 = document.querySelector("#Menu1-container")

  if (createButton) {
    createButton.addEventListener("click", () => {
      if (containerMenu1.classList.contains("show")) {
      containerMenu1.classList.remove("show")
      containerMenu1.classList.add("hide")}
    console.log(createContainer)
    createContainer.classList.remove("hide")
    createContainer.classList.add("show")
  })
  }
}

const initToggleMenuTab = () => {
  const btnMenus = document.querySelectorAll(".btn-requests-menu")
  btnMenus.forEach((btnMenu) => {
    btnMenu.addEventListener("click", (event) => {
      btnMenus.forEach((btnMenuTwo) => {
        btnMenuTwo.classList.remove("btn-requests-menu-active")
      })
      event.currentTarget.classList.add("btn-requests-menu-active")
    })
  })
}

export {initToggleMenu1, initToggleMenu2, initToggleMenuTab}
