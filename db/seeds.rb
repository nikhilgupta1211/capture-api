john = User.create(email: "john@got.com", password: "john1234", password_confirmation: "john1234")
arya = User.create(email: "arya@got.com", password: "arya1234", password_confirmation: "arya1234")

post = Post.create(photo: "http://nerdist.com/wp-content/uploads/2017/08/game-of-thrones-dagger.jpg", 
                   title: "Dagger", description: "Who has this dagger now?", user: john)

Comment.create(body: "I have the dagger", post: post, user: arya)

Like.create(post: post, user: arya)
