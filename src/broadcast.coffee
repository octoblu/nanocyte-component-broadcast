ReturnValue = require 'nanocyte-component-return-value'

class Broadcast extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = Broadcast
