Pod::Spec.new do |s|
  s.name = "SIRuntimeWrap"
  s.version = "1.1"
  s.summary = "Runtime Wrap"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"Silence"=>"374619540@qq.com"}
  s.homepage = "https://github.com/silence0201/RuntimeWrap"
  s.description = "A Simple Wrap for runtime with Objective-C"
  s.requires_arc = true
  s.source = { :path => '.' }

  s.ios.deployment_target    = '7.0'
  s.ios.vendored_framework   = 'ios/SIRuntimeWrap.framework'
end
