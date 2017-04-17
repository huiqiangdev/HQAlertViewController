version = "0.0.1";

Pod::Spec.new do |s|
  s.name         = "HQAlertViewController"
  s.version      = version
  s.summary      = "an alertView used in register"
  s.description  = <<-DESC
                      a simple alertView common used in register.  
                       DESC
  s.homepage     = "https://github.com/huiqiangdev/HQAlertViewController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "heart_queen" => "huiqiangdev@icloud.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.requires_arc = true
  s.framework    = "UIKit"
  s.dependency 'Masonry' 
  s.source       = { :git => "https://github.com/huiqiangdev/HQAlertViewController.git", :tag => "#{s.version}" }
  s.source_files = "HQAlertViewController", "HQAlertViewController/*.{h}","HQAlertViewController/**/*.{h,m}"
  #s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end