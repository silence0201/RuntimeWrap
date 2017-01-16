Pod::Spec.new do |s|
  s.name         = "SIRuntimeWrap"
  s.version      = "1.0"
  s.summary      = "Runtime Wrap"
  s.description  = <<-DESC
  						A Simple Wrap for runtime with Objective-C
                   DESC
  s.homepage     = "https://github.com/silence0201/RuntimeWrap"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Silence" => "374619540@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/silence0201/RuntimeWrap.git", :tag => "1.0" }
  s.source_files  = "SIRuntime", "SIRuntime/**/*.{h,m}"
  s.exclude_files = "SIRuntime/Exclude"
  s.public_header_files = "SIRuntime/**/*.h"
  s.requires_arc = true
end
