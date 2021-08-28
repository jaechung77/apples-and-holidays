require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season] = {}
  holiday_hash[season][holiday_name] = []
  supply_array.each { |supply| holiday_hash[season][holiday_name] << supply  }
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter][:christmas] + holiday_hash[:winter][:new_years]
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  result = ""
  holiday_hash.each do |season, holidays| 

    result = result + "#{season.capitalize}" + ":\n" 
    holidays.each do |holiday, supplies|
      holidays_arr =  holiday.to_s.split("_")
        holidays_arr.each_with_index do |elem, j|
          if j == holidays_arr.size-1 && j == 0
            result = result + "  " + elem.capitalize + ": " 
          elsif j == 0
            result = result + "  " + elem.capitalize + " " 
          elsif j == holidays_arr.size-1 
            result = result + elem.capitalize + ": " 
          else
            result = result + elem.capitalize + " " 
          end  
        end  
        supplies.each_with_index do |supply, i|
              if i == supplies.size-1
                result = result + supply + "\n"
              else  
                result = result + supply + ", "
              end  
        end 
      end
    end    
  result_arr = result.split("\n")
  result_arr.each do |line|
    puts line 
  end  
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  result = []
  holiday_hash.each do |seasons, holidays|
    holidays.each do |key, supplies|
      if supplies.include? 'BBQ'
        result << key
      end   
    end
  end   
  result     
end



