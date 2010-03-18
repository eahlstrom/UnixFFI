require 'rubygems'
require 'ffi'

module UnixFFI
end

module UnixFFI::Struct
end

mydir = File.dirname(__FILE__)
require File.join(mydir, 'unix_ffi', 'struct', 'passwd')
require File.join(mydir, 'unix_ffi', 'getpwent')

