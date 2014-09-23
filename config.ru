require 'rack'
require 'rack/contrib/try_static'
require 'newrelic_rpm'

use Rack::Deflater

use Rack::TryStatic,
  root: 'public',
  urls: %w[/],
  try: ['.html', 'index.html', '/index.html']

run lambda { [404, {'Content-Type' => 'text/html'}, ['Oh noes! 404 Not Found']]}

