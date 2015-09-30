ReturnValue = require 'nanocyte-component-return-value'
Broadcast = require '../src/broadcast'

describe 'Broadcast', ->
  beforeEach ->
    @sut = new Broadcast

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        envelope =
          message: 'anything'
          config:
            topic: 'foo'

        result = @sut.onEnvelope envelope

        expect(result).to.deep.equal {
          devices: ['*']
          topic: 'foo'
          payload: 'anything'
        }

    describe 'when called with envelope with a different message', ->
      it 'should return the message', ->
        envelope =
          message: {overpriced: 'upcycled wicker decanter'}
          config:
            topic: 'foo'

        result = @sut.onEnvelope envelope

        expect(result).to.deep.equal {
          devices: ['*']
          topic: 'foo'
          payload: {overpriced: 'upcycled wicker decanter'}
        }

    describe 'when called with envelope with a different topic', ->
      it 'should return the message', ->
        envelope =
          message: 'anything'
          config:
            topic: 'antioxidant-zen-water'

        result = @sut.onEnvelope envelope

        expect(result).to.deep.equal {
          devices: ['*']
          topic: 'antioxidant-zen-water'
          payload: 'anything'
        }
