module PositionsHelper
  
  def extract params
    return [] if !params
    
    positions = []
    positions_hash = params
    positions_hash.each_key do |key|
      internal_hash = positions_hash[key] 
      is_applied = internal_hash['applied']
      if is_applied == '1'
        job_position = Position.find key.to_i
        positions << job_position
      end
    end
    positions
  end
    
end
