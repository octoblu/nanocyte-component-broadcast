ReturnValue = require 'nanocyte-component-return-value'

class Broadcast extends ReturnValue
  onEnvelope: (envelope) =>
    {
      devices: ['*']
      topic:   envelope.config.topic
      payload: envelope.message
    }

module.exports = Broadcast
