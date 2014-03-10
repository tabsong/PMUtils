Pod::Spec.new do |s|
  s.name             = "PMUtils"
  s.version          = "0.0.1"
  s.summary          = "A short description of /Users/petermeyers/Dev/Personal/PMUtils."
  s.description      = <<-DESC
                       An optional longer description of /Users/petermeyers/Dev/Personal/PMUtils

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  # s.homepage         = "http://EXAMPLE/NAME"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Peter Meyers" => "pmeyers@onekingslane.com" }
  s.source           = { :git => "https://github.com/petermeyers1/PMUtils.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/NAME'

  # s.platform     = :ios, '5.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Resources'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
