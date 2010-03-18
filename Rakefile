require 'rake'
require 'spec/rake/spectask'

task :default => :spec

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ["--format", "nested", "-c"]
end

desc "generate FFI structs for your machine"
task :ffi_generate do
  require 'ffi'
  require 'ffi/tools/generator'
  require 'ffi/tools/struct_generator'

  ffi_files = Dir.glob('lib/unix_ffi/struct/*.rb.ffi')
  #ffi_options = { :cflags => "-I/usr/local/mylibrary" }
  ffi_options = {}
  ffi_files.each do |ffi_file|
    ruby_file = ffi_file.gsub(/\.ffi$/,'')
    unless uptodate?(ruby_file, [ffi_file])
      puts "generating: #{ffi_file} => #{ruby_file}"
      FFI::Generator.new ffi_file, ruby_file, ffi_options    
    end
  end
end

