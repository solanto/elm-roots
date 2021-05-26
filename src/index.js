import { Elm } from "./Main.elm"

Elm.Main.init({
    node: document.querySelector("main"),
    flags: new Date().toLocaleDateString("sv-se", { weekday: "long" })
})
