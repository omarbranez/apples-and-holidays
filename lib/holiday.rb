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
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  #holiday_hash[:winter].each {|key, value| holiday_hash[:winter][key]<<supply}
    # run an iteration on every key/value pair in holiday_hash[:winter]. for each key (christmas, new years), adds "supply" argument to array
  holiday_hash[:winter][:new_years]<<supply
  holiday_hash[:winter][:christmas]<<supply
    #shovel supply to each winter holiday array
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
holiday_hash[:spring][:memorial_day]<<supply
    #shovel supply underneath memorial day since it's the only one there
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season]={holiday_name=>supply_array}
        #for any season, which is the first key, adds a new holiday_name and rockets in a supply array underneath it
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
        #for winter, pull out the supplies (not the holidays) and flatten the array
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|  #iterates each season's holiday
    puts "#{season.to_s.capitalize}:"     #all seasons are one word, we can turn them to strings and capitalize them right away
      holiday.each do |holiday2, supply|  #iterate the next two parts of the hash through each holiday's supplies. some holidays have underscores though
        day_array = []                    #we need to store our modified holidays to turn them back into
        temp_array = holiday2.to_s.split("_") #create a temporary array where we change the holiday names into strings and split them by removing the underscores
        temp_array.collect {|holiday_word| day_array << holiday_word.capitalize!}
                                          #for each word in the temporary array, capitalize and shovel them into the day_array
          holiday2 = day_array.join(" ")  #change value of unformatted holidays to result of last iteration. combine with spaces.
          supply = supply.join(", ")      #all supplies are already capitalized, we just need to seperate them with commas
          puts "  #{holiday2}: #{supply}" #printout
        end
      end
    end
  


def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_array = []                          #blank array, since the assignment wants the output formatted as such
  holiday_hash.each do |season, holiday|  #iterate through the first layer
    holiday.each do |holiday2, supply|    #iterate through the second layer since bbq is in the third layer
      if supply.include?("BBQ")           #do any of the supplies include the string bbq?
        bbq_array << holiday2             #if so, shovel them into the array we made
      end
    end
  end
  bbq_array                               #return it
      
end







