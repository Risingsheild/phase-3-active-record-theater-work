class Role < ActiveRecord::Base
    has_many :auditions

    def actors 
        self.auditions.map do |each_audtion|
                each_audtion.actors
        end
    end

    def locations 
        actor_locations = []
        self.auditions.each do |each_audtion|
            actor_locations << each.locations
        end
        
        return actor_locations
    end

    def understudy
        filtered_array_results = self.auditions.filter do |that_audtion_instance|
            that_audtion_instance.hired = true 
        end

        if (filtered_array_results.size !=0 && filtered_array_results.size > 1)
            return filtered_array_results.second
        else
            "no actor is selected for the understudy"
        end
    end
    

end