require "deep_impact/version"

module DeepImpact
  def self.stringify(obj)
    case obj
    when String then obj
    when Array
      obj.map {|elem| stringify(elem) }
    when Hash
      Hash[obj.map{ |k, v| [stringify(k), stringify(v)] }]
    else
      return obj.to_str if obj.respond_to? :to_str
      return obj.to_s   if obj.respond_to? :to_s
      obj
    end
  end
end
