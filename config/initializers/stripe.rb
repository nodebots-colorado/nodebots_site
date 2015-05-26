Rails.configuration.stripe = {
  publishable_key: Figaro.env.stripe_development_publishable_key,
  secret_key: Figaro.env.stripe_development_secret_key 
}