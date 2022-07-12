import test from 'ava'
import {indexOfRegex, lastIndexOfRegex} from '../index'

test(t => {
  const testString = '123456789abcdefghchijklmnopqrstuvwy123456789abcdefghchijklmnopqrstuvwy'
  t.is(indexOfRegex(testString, /ab/), 9)
  t.is(lastIndexOfRegex(testString, /ab/), 44)
})
