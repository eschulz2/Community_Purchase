Rails.configuration.stripe = {
  publishable_key: 'pk_test_JIi1gWXc5CkvRZqfqpJeFUxW',
  secret_key:      'sk_test_kob7z3JQMheMJ4hknjcRIVwJ'
}

Stripe.api_key = \
  Rails.configuration.stripe[:secret_key]