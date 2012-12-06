module Spinach
  module Facebook
    def mock_facebook(id, token)
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = {
        provider: 'facebook',
        uid: id,
        info: {
          email: '',
          name: '',
        },
        credentials: {
          token: token,
          expires_at: 1321747205,
          expires: true
        }
      }
    end
  end
end