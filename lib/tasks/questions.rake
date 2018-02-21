require 'json'
namespace :question do
  desc 'TODO'
  task setup: :environment do
    questions_file = File.read("#{Rails.root}/lib/tasks/question.json")
    question = JSON.parse(questions_file)
    question.each do |question|
      Question.create(question)
    end
    choices_file = File.read("#{Rails.root}/lib/tasks/choices.json")
    choice = JSON.parse(choices_file)
    choice.each do |choice|
      Choice.create(choice)
    end
  end
end
