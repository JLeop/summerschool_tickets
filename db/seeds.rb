puts "DESTROYING"
Ticket.destroy_all
User.destroy_all

puts "CREATEING"
puts "users"

julian = User.new(email: "julian@rega-sense.ch", name: "Julian (Admin)", password: "testtest", ta: true, remote_photo_url: "https://res.cloudinary.com/j163surf77/image/upload/v1535482604/DSF_lower_quality.jpg", admin: true)
julian.save!

ta_tester = User.new(email: "ta@test.com", name: "Master Yoda (TA)", password: "testtest", ta: true, remote_photo_url: "https://res.cloudinary.com/j163surf77/image/upload/v1535189135/yoda.jpg")
ta_tester.save!

tester = User.new(email: "student@test.com", name: "Luke (Student)", password: "testtest", ta: false, remote_photo_url: "https://res.cloudinary.com/j163surf77/image/upload/v1535189301/luke.jpg")
tester.save!

puts "tickets"
Ticket.new(student: tester, ta: julian, question: "How to build a rails ticketing system for the HSG Summer School?").save!
Ticket.new(student: tester, question: "How to understand technology by Bryan and Flo").save!
Ticket.new(student: tester, question: "If you are logged in as TA you can assign this ticket to yourself and set it to solved.").save!

puts "SEED COMPLETED"
