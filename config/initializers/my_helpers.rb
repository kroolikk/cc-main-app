# Include hook code here
require File.dirname(__FILE__) + '/../../lib/my_helpers/my_helpers'
String.send(:include, MyHelpers)
