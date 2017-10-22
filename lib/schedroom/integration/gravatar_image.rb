module Schedroom
  module Integration
    # class to integrate with gravatar image service
    class GravatarImage
      # returns gravatar image url
      def self.generate_path(email = nil, size = 42)
        token = Digest::MD5.hexdigest(email)
        "http://gravatar.com/avatar/#{token.downcase}.png?s=#{size}&d=mm"
      end
    end
  end
end
