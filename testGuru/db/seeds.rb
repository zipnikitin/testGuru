users = User.create!([{ name:"Klaus", email:"Klaus@ya.ru", password:"1234" },
                      { name:"Matiaz", email:"Matiaz@gmail.com", password:"1234" },
                      { name:"Rudolf", email:"Rudolf@live.ru", password:"1234" }])
categories = Category.create!([{ title: 'Rhythm' }, 
                               { title: 'Soloing' }, 
                               { title: 'Lyrics' }])
tests = Test.create!([{ tittle: 'Smoke on the Water', level: 0, author: users[1],
                        category: categories[0] },
                      { tittle: 'Thunderstruck', level: 1, author: users[2],
                        category: categories[1] },
                      { tittle: 'Death Metal Lyrics', level: 2, author: users[0],
                        category: categories[2] }])
questions = Question.create!([{ body: 'Left Hand Riffing', test: tests[0] },
                              { body: 'Legato', test: tests[1] },
                              { body: 'Frantic Disembowelment', test: tests[2] }])
answers = Answer.create!([{ body: '035065', question: questions[0], correct: true },
                { body: '04070407', question: questions[1], correct: true },
                { body: 'Eviscerate', question: questions[2], correct: true }])
results = Result.create!([{ user: users[0], test: tests[0] }])