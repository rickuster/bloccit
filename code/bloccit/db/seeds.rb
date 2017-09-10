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

#Create Advertisements
50.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph,
    price: RandomData.random_integer
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} Advertisements created"
