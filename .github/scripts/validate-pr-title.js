const nlp = require('compromise')
const prTitle = process.env.PR_TITLE || ''

function logError(message) {
  console.error(`❌ ${message}`)
  process.exit(1)
}

function capitalized(string) {
  if (!string) return '';
  return string[0].toUpperCase() + string.substring(1);
}

// Rule 1: PR title must not be empty
if (!prTitle) {
  logError(`PR title must not be empty`)
}

// Rule 2: PR title must be 72 characters or less
if (prTitle.length > 72) {
  logError(`PR title must be 72 characters or less (${prTitle.length})`)
}

// Rule 3: PR title must be written in the imperative
const firstWord = prTitle.split(' ')[0]
const firstWordLowercased = firstWord.toLowerCase()
const firstWordCapitalized = capitalized(firstWord)
const firstWordAsImperativeVerb = nlp(firstWord).verbs().toInfinitive().out('text')
const firstWordAsImperativeVerbLowercased = firstWordAsImperativeVerb.toLowerCase()
const firstWordAsImperativeVerbCapitalized = capitalized(firstWordAsImperativeVerb)

if (firstWordLowercased !== firstWordAsImperativeVerbLowercased) {
  if (firstWordAsImperativeVerb) {
    logError(`PR title must be written in the imperative. Try using "${firstWordAsImperativeVerbCapitalized}" instead of "${firstWordCapitalized}"`)
  } else {
    logError(`PR title must begin with a verb and be written in the imperative`)
  }
}

// Rule 4: PR title must begin with a capital letter
if (!/^[A-Z]/.test(prTitle)) {
  logError('PR title must begin with a capital letter')
}

// Rule 5: PR title must end with a letter or number
if (!/^[A-Za-z0-9]/.test(prTitle)) {
  logError('PR title must end with a letter or number')
}

console.log('✅ PR title is valid!')
