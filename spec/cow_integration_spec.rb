require 'rack/test'
require 'sinatra'
require 'cow'

set :environment, :test

describe 'The Cow app' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'generates a basic cow' do
      expected = (<<-'RUBY').strip
 _______ 
< Hello >
 ------- 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
      RUBY
      get '/'
      result = last_response.body.strip
      result.should eq(expected)
  end

  it 'generates a goodbye cow' do
    expected = (<<-'RUBY').strip
 ___________ 
< Good bye! >
 ----------- 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
    RUBY
    get '/', 'message' => 'Good bye!'
    result = last_response.body.strip
    result.should eq(expected)
  end
end
