platform :ios, '14.0'

install! 'cocoapods', :warn_for_unused_master_specs_repo => false

def testing_pods
    pod 'OHHTTPStubs/Swift', '~> 9.1.0'
    pod 'Nimble', '~> 9.0.0'
end

def common_pods
    pod 'SwiftLint', '~> 0.43.1'
    pod 'Sourcery', '~> 1.3.4'
end

target 'TakeHome' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  common_pods

  target 'TakeHomeTests' do
    inherit! :search_paths
    common_pods
    testing_pods
  end

end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
  end
 end
end
