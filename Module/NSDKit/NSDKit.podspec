Pod::Spec.new do |spec|
  spec.name         = 'NSDKit'
  spec.version      = '0.1.0'
  spec.summary      = 'NSDKit Design system.'
  spec.description  = 'NSDKit is a design system of UI components.'

  spec.homepage     = 'https://github.com/iamkabulov'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }

  spec.author       = { 'Nursultan' => 'iamkabulov@gmail.com' }
  spec.source       = { :git => '', :tag => spec.version.to_s }

  spec.platform     = :ios, '15.0'
  spec.swift_version = '5.0'

  spec.source_files  = 'Sources/**/*.{h,m,swift}'
end
