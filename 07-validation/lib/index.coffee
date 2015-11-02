# Build your comprehensive validation function here!
# Feel free to use any third party librarys from NPM (http://npmjs.org) for data validation.

exports.validate = (data) ->

  
  # Very naive checks - change them!

  if data.id < 0 && data.id == null then return false
  
  if ! /^\+?(|[1-9]\d*)$/.test data.id then return false
  
  if !/^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i.test data.email then return false

  if data.favouriteColour != null && !/^#(([0-9a-fA-F]{2}){3}|([0-9a-fA-F]){3})$/.test data.favouriteColour then return false

  if data.name == null or !/^[a-zA-Z ]+$/.test data.name then return false 
    
  console.log 1
  if data.name.length > 64 then return false 

  console.log 2
  if data.taxRate == null then return false

  console.log 3
  if ! /^\d{0,2}(\.\d{0,2}){0,1}$/.test data.taxRate then return false

  console.log 4
  if data.taxRate > 1 then return false 

  console.log 5
  if data.interests.length > 5 then return false
    
  console.log 6
  return true
