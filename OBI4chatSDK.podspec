Pod::Spec.new do |s|

  s.name          = "OBI4chatSDK"
  s.version       = "2.3.6"
  s.summary       = "OBI4chatSDK for chat"

  s.homepage      = "https://www.obi4wan.com/nl/"

  s.platform     = :ios, "12.1"
  
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

  s.ios.vendored_frameworks = 'OBI4chatSDK.framework'

  s.ios.deployment_target = '12.1'

  s.dependency  'PusherSwift', '7.0'

  s.swift_version = "4.2"

end

