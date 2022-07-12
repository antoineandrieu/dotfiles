module.exports = {
  indexOfRegex (str, regex, startpos) {
    const indexOf = str.substring(startpos || 0).search(regex)
    return (indexOf >= 0) ? (indexOf + (startpos || 0)) : indexOf
  },
  lastIndexOfRegex (str, regex, startpos) {
    regex = (regex.global) ? regex : new RegExp(regex.source, 'g' + (regex.ignoreCase ? 'i' : '') + (regex.multiLine ? 'm' : ''))
    if (typeof (startpos) === 'undefined') {
      startpos = str.length
    } else if (startpos < 0) {
      startpos = 0
    }
    const stringToWorkWith = str.substring(0, startpos + 1)
    let lastIndexOf = -1
    let nextStop = 0
    let result
    while ((result = regex.exec(stringToWorkWith)) != null) {
      lastIndexOf = result.index
      regex.lastIndex = ++nextStop
    }
    return lastIndexOf
  }
}
