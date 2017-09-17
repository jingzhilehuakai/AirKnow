# SPECIFY THE M-SUPPORT iOS VERSION
platform :ios, '8.0'

# USE DYNAMIC LIBRARY 
use_frameworks!

# COCOAPOD INSTALLER
def startPodInstaller
	# pod 'AirKnow', :path => './'

	pod 'AFNetworking'
	pod 'AwesomeCache'
    pod 'IGListKit', '~> 3.0'
	pod 'SnapKit'
	pod 'ScrollableGraphView'
	pod 'SwiftyJSON'
	pod 'SwifterSwift'
	pod 'CHIPageControl'
	pod 'SwiftTheme'
    pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift3'
end

# TARGET 'AIRKNOW' ACTION
target 'AirKnow' do
    # INSTALL DEPENDENCIES
    startPodInstaller
    # SPECIFY THE SWIFT VERSION
    swift_version = '3.0'
end

