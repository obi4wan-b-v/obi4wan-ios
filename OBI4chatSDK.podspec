Pod::Spec.new do |s|

  s.name          = "OBI4chatSDK"
  s.version       = "4.0.0"
  s.summary       = "OBI4ChatSDK for chat"

  s.homepage      = "https://www.obi4wan.com/nl/"

  s.platform     = :ios, "13"

  s.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
      Licensed under the Apache License, Version 2.0 (the "License");
      you may not use this file except in compliance with the License.
      You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

      Unless required by applicable law or agreed to in writing, software
      distributed under the License is distributed on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
      See the License for the specific language governing permissions and
      limitations under the License.
      LICENSE
    }

  s.author        = { "OBI4wan" => "info@obi4wan.nl" }
  s.source       = { :git => "https://github.com/obi4wan-b-v/obi4wan-ios.git", :tag => "#{s.version}" }

  s.ios.vendored_frameworks = 'OBI4ChatSDK.xcframework'

  s.ios.deployment_target = '13'

  s.dependency  'PusherSwift', '9.2.2'
  s.dependency  'lottie-ios', '3.2.3'
  s.dependency  'Alamofire', '5.4.4'

  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.swift_version = "5"

end
