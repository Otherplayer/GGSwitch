Pod::Spec.new do |s|
  s.name         = "GGSwitch"
  s.version      = "0.0.1"
  s.summary      = "GGSwitch, a custom system style switch!"
  s.description  = <<-DESC
                    GGSwitch, a custom system style switch!!
                   DESC
  s.homepage     = "https://github.com/Otherplayer/GGSwitch"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Otherplayer' => 'osmk@qq.com' }
  s.source       = { :git => "https://github.com/Otherplayer/GGSwitch.git", :tag => '0.0.1' }
  s.platform     = :ios
  s.ios.deployment_target = '6.0'
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end