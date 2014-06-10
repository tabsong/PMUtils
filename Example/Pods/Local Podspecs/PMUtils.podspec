Pod::Spec.new do |s|
  s.name        = "PMUtils"
  s.version     = "0.0.47"
  s.summary     = "Categories on Foundation and UIKit classes that offer extended functionality."
  s.homepage    = "https://github.com/petermeyers1/#{s.name}"
  s.license     = 'MIT'
  s.author      = { "Peter Meyers" => "petermeyers1@gmail.com" }
  s.source      = { :git => "https://github.com/petermeyers1/#{s.name}.git", :tag => s.version.to_s }
  s.platform    = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source_files = 'Classes/**/*.{h,m}'
  s.requires_arc = true
  s.frameworks   = 'Foundation', 'CoreData', 'UIKit'
    
  s.subspec 'PMAnimationQueue' do |animation_queue|
  	animation_queue.source_files = 'Classes/**/PMAnimationQueue/*.{h,m}'
  end
  
  s.subspec 'PMOrderedDictionary' do |ordered_dictionary|
  	ordered_dictionary.source_files = 'Classes/**/PMOrderedDictionary/*.{h,m}'
  end
  
  s.subspec 'PMPair' do |pair|
  	pair.source_files = 'Classes/**/PMPair/*.{h,m}'
  end
  
  s.subspec 'PMProtocolInterceptor' do |protocol_interceptor|
  	protocol_interceptor.source_files = 'Classes/**/PMProtocolInterceptor/*.{h,m}'
  end
  
  s.subspec 'PMImageFilmstrip' do |image_filmstrip|
  	image_filmstrip.source_files = 'Classes/**/PMImageFilmstrip/*.{h,m}'
  end
  
end
