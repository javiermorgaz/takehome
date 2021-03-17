platform :ios, '14.0'

install! 'cocoapods', :warn_for_unused_master_specs_repo => false

def testing_pods
    pod 'OHHTTPStubs/Swift', '~> 9.1.0'
    pod 'KIF', :configurations => ['Debug']
end

def common_pods
    pod 'SwiftLint', '~> 0.43.1'
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

  target 'TakeHomeUITests' do
    common_pods
    testing_pods
  end

end
