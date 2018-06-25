Pod::Spec.new do |s|
  s.name         = 'POSErrorHandling'
  s.version      = '1.0.0'
  s.license      = 'MIT'
  s.summary      = 'Utilities for design-by-contract programming and error handling.'
  s.homepage     = 'https://github.com/pavelosipov/POSErrorHandling'
  s.authors      = { 'Pavel Osipov' => 'posipov84@gmail.com' }
  s.source       = { :git => 'https://github.com/pavelosipov/POSErrorHandling.git', :tag => s.version }
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
  s.source_files = 'Classes/**/*.{h,m}'
end