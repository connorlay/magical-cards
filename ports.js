'use strict'

// import compiled elm
const Elm = require('./build/elm.js')

// grab div container ref from DOM
let container = document.getElementById('container')

// embedd Elm app into container
let magicalCards = Elm.MagicalCards.embed(container)

// writeFile port
magicalCards.ports.writeFile.subscribe((path, content) => {

})
