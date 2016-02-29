Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '104070488721-a0ueeo39k2bmvcb222tn5a0uqptea755.apps.googleusercontent.com', '5aFEexfvU6HBkvjIyuZ_00Cf', scope: 'userinfo.profile,youtube'
end
