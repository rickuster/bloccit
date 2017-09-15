require 'random_data'

#Create posts
50.times do
  #add fail warning to create
  Post.create!(
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
  Question.create!(
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
end

posts = Post.all
questions = Question.all

#Create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
