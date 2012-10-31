require.config 
    paths: 
        jquery: 'libs/jquery'
        underscore: 'libs/underscore'
        backbone: 'libs/backbone'

require ['jquery', 'underscore', 'backbone', 'appview', 'response'], ($, _, Backbone, AppView, Response) ->
    questionDataSource = {
        "questions": [
            { "id": 1, "text": "Tim Berners-Lee invented the Internet."},
            { "id": 2, "text": "Dogs are better than cats."},
            { "id": 3, "text": "Winter is coming."},
            { "id": 4, "text": "Internet Explorer is the most advanced browser on Earth."}
        ]
    }
    answerDataSource = {
        "answers": [
            { "id": 1, "selected": true},
            { "id": 2, "selected": false},
            { "id": 3, "selected": true},
            { "id": 4, "selected": false}
        ]
    }

    Question = Backbone.Model.extend()
    Answer = Backbone.Model.extend()

    QuestionList = Backbone.Collection.extend
        model: Question
    AnswerList = Backbone.Collection.extend
        model:Answer
    ResponseList = Backbone.Collection.extend
        model:Response
        
    questions = new QuestionList
    answers = new AnswerList
    responses = new ResponseList

    questions.reset questionDataSource.questions
    answers.reset answerDataSource.answers

    appView = new AppView 
        answers: answers
        questions: questions
        responses: responses

