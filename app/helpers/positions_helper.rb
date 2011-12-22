module PositionsHelper
  
  def extract_apply params
    return [] if !params
    
    positions = []
    positions_hash = params
    positions_hash.each_key do |key|
      internal_hash = positions_hash[key] 
      is_applied = internal_hash['apply']

      #the apply key must exist
      raise if is_applied == nil

      if is_applied == '1'
        job_position = Position.find key.to_i
        positions << job_position
      end
    end
    positions
  end
  
  def extract_unapply params
    return [] if !params
    
    positions = []
    positions_hash = params
    positions_hash.each_key do |key|
      internal_hash = positions_hash[key] 
      is_applied = internal_hash['unapply']

      #the unapply key must exist
      raise if is_applied == nil

      if is_applied == '1'
        job_position = Position.find key.to_i
        positions << job_position
      end
    end
    positions
  end
    
end
