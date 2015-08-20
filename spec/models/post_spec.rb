# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end



describe Post do

  before(:each) { @user=User.new(email: 'user@example.com', password: "password"); @post = Post.new(content: 'example content', user_id: @user.id)  }

  subject { @post }

  it { should respond_to(:content) }

  it "#content returns the tweet" do
    expect(@post.content).to match 'example content'
  end

end