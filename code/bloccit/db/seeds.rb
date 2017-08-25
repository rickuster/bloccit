require 'random_data'

#Create posts
50.times do
  #add fail warning to create
  Post.create!(
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
end

posts = Post.all

#Create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

#Create unique post if one does not already exists
uniquepost = Post.find_or_create_by(title: "This is a unique title", body: "This is a unique body")

#Create unique comment if one does not already exists
uniquepost.comments.find_or_create_by(body: "This is a unique body")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
