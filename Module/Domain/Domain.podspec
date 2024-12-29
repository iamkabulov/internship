Pod::Spec.new do |spec|
  spec.name         = 'Domain'
  spec.version      = '0.1.0'
  spec.summary      = 'Domain module.'
  spec.description  = 'Domain is a domain layer of project.'

  spec.homepage     = 'https://github.com/iamkabulov'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }

  spec.author       = { 'Nursultan' => 'iamkabulov@gmail.com' }
  spec.source       = { :git => '', :tag => spec.version.to_s }

  spec.platform     = :ios, '15.0'
  spec.swift_version = '5.0'
	spec.ios.deployment_target = '13.0'


  spec.source_files  = ['Offer/Model/**/*.{h,m,swift}', 'Offer/Provider/**/*.{h,m,swift}']
end
