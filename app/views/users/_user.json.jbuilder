json.extract! user, :id, :fname, :lname, :email, :password_digest, :isAdmin, :status, :created_at, :updated_at
json.url user_url(user, format: :json)
