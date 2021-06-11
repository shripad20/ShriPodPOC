
Pod::Spec.new do |spec|

  spec.name         = "ShriPodPOC"
  spec.version      = "0.0.1"
  spec.summary      = "This is the POC of creating own POD named ShriPodPOC."

  spec.description  = <<-DESC
			ShriPodPOC is a small framework which gives you a simple Stepped progress bar which you can include in your project with simple steps.
                   DESC

  spec.homepage     = "https://appcoda.com"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "Shripad Chidrawar" => "shripad.chidrawar20@gmail.com" }

  spec.platform     = :ios, "12.0"

  #spec.source       = { :http => 'file:' + __dir__ + "/" }
  # spec.source     = { :git => https://github.com/shripad20/ShriPodPOC.git, :tag => "#{spec.version}" }
  spec.swift_version = "5.0"
  spec.source_files  = "ShriPodPOC/ShriPodPOC/Source/**/*.{swift, xib}"

end
