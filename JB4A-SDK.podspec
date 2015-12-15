
Pod::Spec.new do |s|
  s.name             = "JB4A-SDK"
  s.version          = "4.0.3.2"
  s.summary          = "Salesforce Marketing Cloud Journey Builder for Apps iOS SDK"

  s.description      = <<-DESC
Journey Builder for Apps provides everything you need to connect your apps, products, and spaces to customer journeys — nurturing customers into deeply engaged, long-term fans. Map your complete strategy, and then execute your plan and engage users across channels with in-app messaging, in-product messaging, email, mobile, social, ads, and the web.
DESC

  s.homepage         = "http://salesforce-marketingcloud.github.io/JB4A-SDK-iOS/"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'BSD'
  s.author           = { "Roman Figel" => "roman.figel@gmail.com" }
  s.source           = { :git => "https://github.com/rfihel/JB4A-SDK-iOS.git", :tag => 'JB4A-SDK-iOS-v' + s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'JB4A-SDK/*.h'

  s.public_header_files = 'JB4A-SDK/*.h'
  s.ios.vendored_library = 'JB4A-SDK/libJB4ASDK-4.0.3.a'
  s.ios.framework = 'CoreLocation'
end

