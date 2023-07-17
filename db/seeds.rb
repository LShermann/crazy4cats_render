until Post.count == 10 do
    Post.create(title: Faker::Book.title, description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false))
    end

    i = 0
    until User.count == 2 do
    User.create(email: "test#{i}@gmail", password: "123456", "password_confirmation": "123456", photo: Faker::Avatar.image, name: Faker::Name.name)
    i += 1
    end

    post = Post.all
    users = User.all

    until Comment.count == 10 do
    Comment.create(content: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), post_id: post.sample.id, user_id: users.sample.id)
    end
    r_type = %w[post comment]
    comments = Comment.all
    kinds = Post::Kinds
    until Reaction.count == 10 do
    rel_type = r_type.sample
    if rel_type == "post"
    Reaction.create(post_id: post.sample.id, user_id: users.sample.id, kind: kinds.sample, reaction_type: rel_type)
    else
    Reaction.create(comment_id: comments.sample.id, user_id: users.sample.id, kind: kinds.sample, reaction_type: rel_type)
    end
    end
    