
module UnixFFI
  extend FFI::Library
  ffi_lib FFI::Platform::LIBC

  attach_function 'getpwent', [], :pointer
  attach_function 'setpwent', [], :void
  attach_function 'endpwent', [], :void
end
