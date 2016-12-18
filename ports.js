'use strict'

// import compiled elm
const Elm = require('./build/elm.js')

const fs = require('fs')

// grab div container ref from DOM
let container = document.getElementById('container')

// embedd Elm app into container
let magicalCards = Elm.MagicalCards.embed(container)

// writeFile port
magicalCards.ports.writeFile.subscribe(args => {
  let [path, content] = args
  fs.writeFile(path, content, (err) => {
    if (err) {
      console.error("Unable to write file :(")
    }
  })
})
