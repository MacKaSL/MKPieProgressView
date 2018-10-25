Pod::Spec.new do |s|
  s.name         = "MKPieProgressView"
  s.module_name  = "MKPieProgressView"
  s.version      = "1.0.0"
  s.summary      = "A simple custom pie chart/circular progress."
  s.description  = <<-DESC
                   A simple custom pie chart/circular progress.
                   DESC
  s.homepage     = "https://github.com/MacKaSL/MKPieProgressView"
  s.license      = { :type => 'MIT' }
  s.author       = { "Himal Madhushan" => "mackacodes@gmail.com" }
  s.ios.deployment_target = '9.0'
  s.source       = { :git => "https://github.com/MacKaSL/MKPieProgressView.git", :tag => '1.0.0' }
  s.source_files  = "Source/MKPieProgressView.swift"
  s.requires_arc = true
  
  s.pod_target_xcconfig = {
   'SWIFT_VERSION' => '3.0'
  }
end