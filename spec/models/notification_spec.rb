require 'rails_helper'

RSpec.describe Notification, type: :model do
  it { should belong_to(:recipient).class_name('Author') }
  it { should belong_to(:author).class_name('Author') }
  it { should belong_to(:notifiable) }
end
