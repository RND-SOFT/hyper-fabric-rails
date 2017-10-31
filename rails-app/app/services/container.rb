class Container
  
  def self.all
    filtered_paths = %(chaincode peer orderer)
    Docker::Container.all.map(&:json).select{ |c| filtered_paths.include?(c["Path"]) }
  end
  
end