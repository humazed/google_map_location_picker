#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'google_map_location_picker'
  s.version          = '2.1.1'
  s.summary          = '🌍 Map location picker for flutter Based on google_maps_flutter'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/humazed/google_map_location_picker'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'humazed' => 'humazed@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.swift_versions = ['4.0', '4.2', '5.0', '5.1.2']
  s.ios.deployment_target = '8.0'
end

