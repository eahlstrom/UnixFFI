
module Unix
end

mydir = File.dirname(__FILE__)
require File.join(mydir, 'unix_ffi')
require File.join(mydir, 'unix', 'pwent')
require File.join(mydir, 'unix', 'passwd')

