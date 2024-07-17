# frozen_string_literal: true

3.times do |n|
  Tweet.find_or_create_by!(id: n) do |tweet|
    tweet.content = "No.#{n} content. No.#{n} content. No.#{n} content."
  end
end