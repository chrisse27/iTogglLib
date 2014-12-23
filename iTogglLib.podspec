Pod::Spec.new do |s|
  s.name     = 'iTogglLib'
  s.version  = '1.0.0'
  s.platform = :ios, '7.0'
  s.summary  = 'An iOS library for the Toggl API'
  s.homepage = 'https://github.com/chrisse27/iTogglLib'
  s.author   = { 'Christoph Krautz' => 'christoph@krautz.ch' }
  s.source   = { :git => 'https://github.com/chrisse27/iTogglLib.git', :tag => s.version.to_s }
  s.license      = 'Apache'
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end