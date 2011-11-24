module VersionsHelper
  def formated_version version
    return '&nbsp'.html_safe unless object_hash = yaml_load(version.object)
    object_hash.map do |k,v|
      "#{I18n.t(k.to_sym, :scope => [:activerecord,:attributes, version.item_type.downcase])}:#{v}"
    end.join('<br />').html_safe


  end

  private

  def yaml_load object
    YAML::load(object)
  rescue
    false
  end
end
