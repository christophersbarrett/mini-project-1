define ['jquery', 'underscore', 'backbone', 'questionview', 'summaryview'], ($, _, Backbone, QuestionView, SummaryView) ->

    AppView = Backbone.View.extend 
        el: $("#testApp")
        currentPos: 0
        correct: 0
        currentQuestionView: null
        questions: null
        answers: null
        responses: null
        nextQuestion: ->
            if @currentQuestionView != null
                @currentQuestionView.undelegateEvents()
                @responses.add @currentQuestionView.response
                @correct++ if @currentQuestionView.response.isCorrect()
            @currentPos++
            if @currentPos < (@questions.length + 1)
                @currentQuestionView = new QuestionView 
                    appView: this
                    question: @questions.get @currentPos
                    answer: @answers.get @currentPos
                @currentQuestionView.render()
            else
                @currentQuestionView.hide()
                sumView = new SummaryView
                    totalQuestions: @questions.length
                    correct: @correct
                sumView.render()
        initialize: (options) ->
            @questions = options.questions
            @answers = options.answers
            @responses = options.responses
            this.nextQuestion()

