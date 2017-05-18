class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    User.find_or_create_by(
      uid: auth["info"]["id"],
      provider: auth["provider"],
      name: auth["info"]["display_name"] || auth["info"]["id"]
    )
  end
end
