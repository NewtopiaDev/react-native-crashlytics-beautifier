
Pod::Spec.new do |s|
  s.name         = "RNCrashlyticsBeautifier"
  s.version      = "1.0.3"
  s.summary      = "RNCrashlyticsBeautifier"
  s.description  = "DESC RNCrashlyticsBeautifier"
  s.homepage     = "https://github.com/NewtopiaDev/react-native-crashlytics-beautifier"
  s.license      = "MIT"
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/NewtopiaDev/react-native-crashlytics-beautifier.git", :tag => "master" }
  s.source_files  = "ios/*.{h,m}"
  
  s.dependency "React"
  s.dependency "Crashlytics"
  
end

  