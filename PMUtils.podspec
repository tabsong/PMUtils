Pod::Spec.new do |s|
  s.name        = 'PMUtils'
  s.version     = '0.0.35'
  s.summary     = 'Categories on Foundation and UIKit classes that offer extended functionality.'
  s.homepage    = "https://github.com/petermeyers1/#{s.name}"
  s.license     = 'MIT'
  s.author      = { 'Peter Meyers' => 'petermeyers1@gmail.com' }
  s.source      = { :git => "https://github.com/petermeyers1/#{s.name}.git", :tag => s.version.to_s }
  s.platform    = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source_files = 'Classes/**/*.{h,m}'
  s.requires_arc = true
  s.frameworks   = 'Foundation', 'CoreData', 'UIKit'
end
