
10.times do |n|
  User.create(
    email: "user#{n+1}@gmail.com",
    password: "123456",
    confirmed_at: Time.now,
    confirmation_token: nil)
end

