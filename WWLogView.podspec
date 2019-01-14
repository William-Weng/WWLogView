Pod::Spec.new do |s|

  s.name         				= "WWLogView"
  s.version      				= "0.1.0"
  s.summary      				= "WWLogView is Debug Log View. (一個簡單的Log視窗版)"
  s.homepage     				= "https://github.com/William-Weng/WWLogView"
  s.license      				= { :type => "MIT", :file => "LICENSE" }
  s.author             			= { "翁禹斌(William.Weng)" => "linuxice0609@gmail.com" }
  s.platform 					= :ios, "10.0"
  s.ios.vendored_frameworks 	= "WWLogView.framework"
  s.source 						= { :git => "https://github.com/William-Weng/WWLogView.git", :tag => "#{s.version}" }
  s.frameworks 					= 'UIKit'
  
end