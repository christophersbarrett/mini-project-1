define ['jquery', 'underscore', 'backbone'], ($, _, Backbone) ->

    SummaryView = Backbone.View.extend 
        template: "<h1>Test Complete</h1><fieldset><legend>Test Results:</legend><div><%=correct%> correct out of <%=totalQuestions%></div></fieldset>"
        el: $("#summary")
        totalQuestions: 0
        correct: 0
        initialize: (options) ->
            @totalQuestions = options.totalQuestions
            @correct = options.correct
        render: ->
            data = 
                correct: @correct
                totalQuestions: @totalQuestions
            this.$el.html _.template @template, data
