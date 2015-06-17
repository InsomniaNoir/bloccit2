require 'faker'

50.times do
  Post.create!(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
  post: posts.sample,
  body: Faker::Lorem.paragraph
  )
end

puts "Seed Finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
