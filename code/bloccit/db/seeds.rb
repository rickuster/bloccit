require 'random_data'

15.times do
  Topic.create!(
    name:   RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all

#Create posts
50.times do
  #add fail warning to create
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
end

#Create sponsored posts
50.times do
  #add fail warning to create
  SponsoredPost.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph,
    price: RandomData.random_price
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

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored post created"
puts "#{Comment.count} comments created"
