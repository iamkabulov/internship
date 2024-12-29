Pod::Spec.new do |spec|
  spec.name         = 'Paywall'
  spec.version      = '0.1.0'
  spec.summary      = 'Paywall module.'
  spec.description  = 'Paywall is a Paywall layer of project.'

  spec.homepage     = 'https://github.com/iamkabulov'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }

  spec.author       = { 'Nursultan' => 'iamkabulov@gmail.com' }
  spec.source       = { :git => '', :tag => spec.version.to_s }

  spec.platform     = :ios, '15.0'
  spec.swift_version = '5.0'
  spec.ios.deployment_target = '13.0'
  
  spec.dependency 'Domain', '~> 0.1.0'
  spec.dependency 'Configuration', '~> 0.1.0'
  spec.dependency 'NSDKit', '~> 0.1.0'


  spec.source_files  = ['Dependency/**/*.{h,m,swift}', 'Factory/**/*.{h,m,swift}', 'Model/**/*.{h,m,swift}', 'Presenter/**/*.{h,m,swift}', 'View/**/*.{h,m,swift}']
end
