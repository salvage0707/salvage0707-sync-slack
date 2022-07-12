require "capybara/rspec"

Capybara.register_driver :chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("headless")
  options.add_argument("no-sandbox")
  options.add_argument("start-maximized")
  options.add_argument("enable-automation")
  options.add_argument("disable-dev-shm-usage")
  options.add_argument("disable-notifications")
  options.add_argument("disable-translate")
  options.add_argument("disable-extensions")
  options.add_argument("disable-infobars")
  options.add_argument("disable-gpu")
  options.add_argument("window-size=1400,1400")
  options.add_argument("--enable-features=NetworkService,NetworkServiceInProcess")
  # ブラウザーを起動する
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    clear_local_storage: true,
    clear_session_storage: true,
    options: options
  )
end

Capybara.javascript_driver = :chrome_headless

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  # System spec
  config.before(:each, type: :system, js: true) do
    driven_by :chrome_headless
  end
end