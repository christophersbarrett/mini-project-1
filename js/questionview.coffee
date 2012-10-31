define ['jquery', 'underscore', 'backbone', 'response'], ($, _, Backbone, Response) ->

    QuestionView = Backbone.View.extend 
        template: '<fieldset><legend>Question #<%=question.id%></legend><div class="questionText"><%=question.get("text")%></div><input type="radio" class="answer" name="answer" id="answerTrue" value="1" required="required"/><label for="answerTrue">True</label><input type="radio" class="answer" name="answer" id="answerFalse" value=""/><label for="answerFalse">False</label><input class="qnext" type="button" value="Next" disabled="disabled"/></fieldset>'
        el: $("#question")
        nextBtn: null
        appView: null
        question: null
        answer: null
        response: null
        initialize: (options) ->
            @question = options.question
            @answer = options.answer
            @appView = options.appView
            @response = new Response
                answer: @answer
        render: ->
            data = 
                question: @question
            this.$el.html _.template @template, data
            @nextBtn = @$el.find "input[type=button]"
        hide: ->
            @$el.css "display", "none"
        nextClicked: ->
            @appView.nextQuestion()
        answerChange: ->
            @nextBtn.removeAttr "disabled"
            userResponse = if $(".answer:checked").val() then true else false
            @response.set
                response: userResponse
        events: 
            "click .qnext": "nextClicked"
            "change .answer": "answerChange"
