# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Welcome to CodeCore | Homework | Ruby - Basics | Ruby - Strings | Ruby - Numbers | Ruby - Flow Control | Ruby - Loops | Ruby - Arrays | Ruby - Hashes | Ruby - Exceptions | Ruby - OOP | Ruby - Modules & Mixins | Sinatra | Git & GitHub | HTML & CSS Refresher | Welcome to Rails | Model: ActiveRecord | CRUD | Quiz 1 | Interview Preparedness | ERD | One to Many | User Authentication | Many to Many | Mid-Term Quiz | Mailers | Background Jobs | AJAX | File Attachments | CoffeeScript | React.js | Rails Patterns | Final Exam |
Lecture.create(chapter: 1, subject:'Ruby')
Lecture.create(chapter: 2, subject:'Sinatra')
Lecture.create(chapter: 3, subject:'Git & GitHub')
Lecture.create(chapter: 4, subject:'HTML & CSS')
Lecture.create(chapter: 5, subject:'Rails')
Lecture.create(chapter: 6, subject:'Javascript')
Lecture.create(chapter: 7, subject:'JQuery')
Lecture.create(chapter: 8, subject:'AJAX')

Topic.create(number: 1, title: 'Basics', lecture_id: Lecture.where(chapter: 1))
Topic.create(number: 2, title: 'Strings', lecture_id: Lecture.where(chapter: 1))
Topic.create(number: 3, title: 'Number', lecture_id: Lecture.where(chapter: 1))
Topic.create(number: 4, title: 'Flow Control', lecture_id: Lecture.where(chapter: 1))
Topic.create(number: 5, title: 'Loops', lecture_id: Lecture.where(chapter: 1))
Topic.create(number: 6, title: 'Arrays', lecture_id: Lecture.where(chapter: 1))
Topic.create(number: 7, title: 'Hashes', lecture_id: Lecture.where(chapter: 1))
Topic.create(number: 8, title: 'Exceptions', lecture_id: Lecture.where(chapter: 1))
Topic.create(number: 9, title: 'OOP', lecture_id: Lecture.where(chapter: 1))
Topic.create(number: 10, title: 'Modules & Mixins', lecture_id: Lecture.where(chapter: 1))
