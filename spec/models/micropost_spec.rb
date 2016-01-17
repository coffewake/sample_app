require "spec_helper"

describe Micropost do
	let(:user) {FactoryGirl.create(:user)}
	before {@micropost=user.microposts.build(content:"Lorem ipsum")}
		
	subject {@micropost}
	it {should respond_to(:content)}
	it {should respond_to(:user_id)}
	it {should be_valid}

	it {should respond_to(:user)}
	its (:user) {should eq user}

	describe "when user_id not presence" do
		before {@micropost.user_id=nil}
		it {should_not be_valid}
	end

	describe "when micropost invalid" do
		before {@micropost.content=" "}
		it {should_not be_valid}
	end

	describe "when micropost too long" do
		before {@micropost.content="a"*141}
		it {should_not be_valid}
	end

end