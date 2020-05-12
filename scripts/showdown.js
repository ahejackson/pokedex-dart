'use strict'

// Use this script to extract the data from Pokemon Showdown
// (which is stored as Javascript objects) into JSON that the Pokedex can use.
// Run the script from node
//
// Make sure to edit the showdowndir and datadir variables to match
// the locations on your computer.
//
// Note that Showdown updated its data to use typescript on April 23rd 2020
// The last commit before this was 2c08cde63a568a92f51b8c69079ee68409aa9516
// For now, you have to checkout that commit (or earlier) to run the scripts

import * as path from 'path'
import * as fs from 'fs'

const showdowndir = '../../../pokemon/Pokemon-Showdown/data/'
const datadir = '../data/'

function main() {
  console.log('Writing pokedex...')
  writePokedex()

  console.log('Writing abilities...')
  writeAbilities()

  console.log('Writing moves...')
  writeMoves()

  console.log('Writing items...')
  writeItems()
}

function writeJSON(filename, data) {
  let json = JSON.stringify(data, null, 2)
  fs.writeFileSync(path.join(datadir, filename), json)
}

async function writePokedex(filename = 'pokedex.json') {
  const dex = []
  const showdown = await import(path.join(showdowndir, 'pokedex.js'))

  // filter the dex
  for (let pkm in showdown.default.BattlePokedex) {
    if (showdown.default.BattlePokedex[pkm].num > 0) {
      dex.push(showdown.default.BattlePokedex[pkm])
    }
  }
  writeJSON(filename, dex)
}

async function writeAbilities(filename = 'abilities.json') {
  const abilities = []
  const showdown = await import(path.join(showdowndir, 'abilities.js'))

  // filter the abilities
  for (let i in showdown.default.BattleAbilities) {
    if (
      showdown.default.BattleAbilities[i].num >= 0 &&
      typeof showdown.default.BattleAbilities[i].isNonstandard === 'undefined'
    ) {
      abilities.push({
        id: showdown.default.BattleAbilities[i].id,
        name: showdown.default.BattleAbilities[i].name,
        num: showdown.default.BattleAbilities[i].num,
        desc: showdown.default.BattleAbilities[i].shortDesc
      })
    }
  }
  writeJSON(filename, abilities)
}

async function writeMoves(filename = 'moves.json') {
  const moves = []
  const showdown = await import(path.join(showdowndir, 'moves.js'))

  // filter the moves
  for (let i in showdown.default.BattleMovedex) {
    if (showdown.default.BattleMovedex[i].num >= 0) {
      moves.push(showdown.default.BattleMovedex[i])
    }
  }
  writeJSON(filename, moves)
}

async function writeItems(filename = 'items.json') {
  const items = []
  const showdown = await import(path.join(showdowndir, 'items.js'))

  // filter the items
  for (let i in showdown.default.BattleItems) {
    if (showdown.default.BattleItems[i].num >= 0) {
      items.push(showdown.default.BattleItems[i])
    }
  }
  writeJSON(filename, items)
}

main()
