class Item
    attr_accessor :title, :deadline, :description

    def self.valid_date?(deadline)
        date_arr = deadline.split("-")
        return false if date_arr.length != 3
        return false if date_arr[0].length != 4 && date_arr[1].length != 2 
        return false if date_arr[2].length != 2
        months = ("1".."12").to_a
        days = ("1".."31").to_a
        return false if !months.include?(date_arr[1])
        return false if !days.include?(date_arr[2])
        true
    end

    def initialize(title, deadline, description)
        @deadline = deadline
        @title = title
        @description = description
        raise "not a valid date!" if !Item.valid_date?(deadline)
    end
end