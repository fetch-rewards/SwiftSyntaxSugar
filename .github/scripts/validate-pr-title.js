const nlp = require('compromise')
const title = process.env.PR_TITLE || ''

function error(message) {
  console.error(`❌ ${message}`)
  process.exit(1)
}

// Rule 1: Max 72 characters
if (title.length > 72) {
  error(`Title exceeds 72 characters (${title.length})`)
}

// Rule 2: Imperative mood check
const firstWord = title.split(' ')[0].toLowerCase()
const infinitiveVerb = nlp(firstWord).verbs().toInfinitive().out('text').toLowerCase()

if (firstWord !== infinitiveVerb) {
  error(`Title should be written in the imperative. Try using: "${infinitiveVerb}..."`)
}

// Rule 3: Sentence case check
if (title[0] !== title[0].toUpperCase()) {
  error('Title must start with a capital letter (sentence case)')
}

// Rule 4: No beginning punctuation or whitespace
if (/^[.!?;,:(){}\[\]"'`~@#$%^&*=_+\-<>|\\/\n\t\r\s]/.test(title)) {
  error('Title should not begin with punctuation or whitespace')
}

// Rule 5: No ending punctuation or whitespace
if (/[.!?;,:(){}\[\]"'`~@#$%^&*=_+\-<>|\\/\n\t\r\s]$/.test(title)) {
  error('Title should not end with punctuation or whitespace')
}

console.log('✅ PR title is valid!')
