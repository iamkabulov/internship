Pod::Spec.new do |spec|
  spec.name         = 'Application'
  spec.version      = '0.1.0'
  spec.summary      = 'Application module.'
  spec.description  = 'Application is a Application layer of project.'

  spec.homepage     = 'https://github.com/iamkabulov'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }

  spec.author       = { 'Nursultan' => 'iamkabulov@gmail.com' }
  spec.source       = { :git => '', :tag => spec.version.to_s }

  spec.platform     = :ios, '15.0'
  spec.swift_version = '5.0'
  spec.ios.deployment_target = '13.0'


  spec.dependency 'FirebaseCore', '~> 11.6.0'
  spec.dependency 'Configuration', '~> 0.1.0'
  spec.dependency 'Paywall', '~> 0.1.0'

  spec.source_files  = '**/*.{h,m,swift}'
  spec.resources = ['Application/Info.plist']
  spec.resources = ['Application/GoogleService-Info.plist']

  spec.resource_bundles = {
		'ApplicationAssets' => ['Application/logo.png']
	}


end
