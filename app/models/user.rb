class User < ApplicationRecord
    validates :first_name, :last_name, :email, :session_key, account_type: true
end
