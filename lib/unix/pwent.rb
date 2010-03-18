
module Unix
  class Pwent
    ATTRIBUTES = [ :pw_name, :pw_passwd, :pw_uid, :pw_gid, :pw_gecos, :pw_dir, :pw_shell ]
    ATTR_SHORTNAME = ATTRIBUTES.collect{|r| r.to_s.sub(/^pw_/,'').to_sym}
    attr_reader *ATTRIBUTES
    attr_reader *ATTR_SHORTNAME

    def initialize(pwent)
      unless pwent.is_a? UnixFFI::Struct::Passwd
        raise ArgumentError, "pwent: expected UnixFFI::Struct::Passwd, got #{pwent.class}"
      end

      ATTRIBUTES.each do |var_key|
        instance_variable_set "@#{var_key.to_s}", pwent[var_key]
        instance_variable_set "@#{var_key.to_s.sub(/^pw_/,'')}", pwent[var_key]
      end
    end

    def <=>(other)
      self.name <=> other.name
    end
  end
end
