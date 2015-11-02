assert   = require 'assert'
{validate} = require '../lib'

describe '07-validation', ->

  it 'should return `true` for valid data', ->
    assert validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: name', ->
    assert !validate
      id: 1
      name: 2 # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]


  it 'should return `false` for invalid data: email', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar@baz.com' # <--- problem
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: id', ->
    assert !validate
      id: -5 # <--- problem
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: favouriteColour', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccffx' # <--- problem
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: Name [Invalid length]', ->
    assert !validate
      id: 1
      name: 'xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx s' # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6' 
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: id [Not Integer]', ->
    assert !validate
      id: 1.1 # <--- problem
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: id [zero]', ->
    assert !validate
      id: 0 # <--- problem
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: taxRate [exceed maximum number]', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 2.1 # <--- problem
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: taxRate [Not null]', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: null # <--- problem
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]
  
  it 'should return `false` for invalid data: taxRate [text]', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 'word' # <--- problem
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]
  
  
  it 'should return `True` for valid data: favouriteColour [Null]', ->
    assert validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.12 
      favouriteColour: null 
      interests: ["cycling", "programming"]
   
 
  it 'should return `false` for invalid data: interests [no more than 4 interestsNot null]', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: null 
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming", "dancing", "reading", "swimming"] # <--- problem

  it 'should return `false` for invalid data: id [Not null]', ->
    assert !validate
      id: null # <--- problem
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.12 
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: name [Null]', ->
    assert !validate
      id: 6 
      name: null # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.12 
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  # !!!!!
  # Add more tests for different data that users might try to provide!
  # !!!!!
