require "spec_helper"

describe Notifications do
  describe "messages" do
    let(:mail) { Notifications.messages }

    it "renders the headers" do
      mail.subject.should eq("Messages")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
