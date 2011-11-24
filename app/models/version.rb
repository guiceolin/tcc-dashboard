class Version
  def object_hash
    YAML::load(object) || ''
  end

  def formated_object
    string = ''
    object_hash.each_pair do |key,value|
      string <<  "#{key} : #{value}\n"
    end
    string
  end
end
