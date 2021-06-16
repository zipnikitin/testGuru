users = User.create!([{ name:"Klaus", email:"Klaus@ya.ru", password:"1234" },
                      { name:"Matiaz", email:"Matiaz@gmail.com", password:"1234" },
                      { name:"Rudolf", email:"Rudolf@live.ru", password:"1234" }])
categories = Category.create!([{ title: 'Rhythm' }, 
                               { title: 'Soloing' }, 
                               { title: 'Lyrics' }])
tests = Test.create!([{ title: 'Smoke on the Water', level: 0, author_id: users[1].id,
                        category_id: categories[0].id },
                      { title: 'Thunderstruck', level: 1, author_id: users[2].id,
                        category_id: categories[1].id },
                      { title: 'Death Metal Lyrics', level: 2, author_id: users[3].id,
                        category_id: categories[2].id }])
questions = Question.create!([{ body: 'Left Hand Riffing', test_id: tests[0].id },
                              { body: 'Legato', test_id: tests[1].id },
                              { body: 'Frantic Disembowelment', test_id: tests[2].id }])
answers = Answer.create!([{ body: '035065', question_id: questions[0].id, correct: true },
                { body: '04070407', question_id: questions[1].id, correct: true },
                { body: 'Eviscerate', question_id: questions[2].id, correct: true }])
