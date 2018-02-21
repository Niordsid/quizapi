# QuizApi
RESTFul API builded on ROR for Create Quizzes.


# Guide and Prerequisites for execute the App.
 - Change username and password in the the database.yml file for your credentials.
 - Execute bundle install for instal dependencies.
 - Execute rake db:create for create the database
 - Execute rake db:migrate for create the tables on the database
 - Execute rake question:setup for seed the database with some questions
   *If you wanna add more questions use the endpoint http://localhost:3000/questions/new*
 - For start the Quiz access to : http://localhost:3000/quiz/index
