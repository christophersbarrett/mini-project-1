define ['jquery', 'underscore', 'backbone'], ($, _, Backbone) ->

    Response = Backbone.Model.extend 
        initialize: (options) ->
            @answer = options.answer
            this.set
                id: @answer.get "id"
        isCorrect: ->
            @answer.get("selected") == this.get "response"
        answer: null
