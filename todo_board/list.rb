require_relative "./item.rb"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        item = Item.new(title, deadline, description)
        if Item.valid_date?(deadline)
            @items << item
            return true
        end
        false
    end

    def size
        @items.length
    end
    
    def valid_index?(idx)
        return false if (idx < 0 || idx > size - 1)
        true
    end

    def swap(idx_1, idx_2)
        if valid_index?(idx_1) && valid_index?(idx_2)
            @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1]
            return true
        end
        false
    end

    def [](idx)
        return @items[idx] if valid_index?(idx)
        nil
    end

    def priority
        @items.first
    end

    def print
        puts "-----------------------------------------"
        puts "             " + "#{@label}" + "         "
        puts "-----------------------------------------"
        puts "Index  |  Item             | Deadline    "
        puts "-----------------------------------------"
        (0...size).each do |i|
            puts "  #{i}" + "    | " + "#{self[i].title}".ljust(17) + " | " + "#{self[i].deadline}"
        end
        puts "-----------------------------------------"
    end

    def print_full_item(idx)
        puts "----------------------------------------------"
        puts " #{self[idx].title}".ljust(25) + " #{self[idx].deadline}"
        puts " #{self[idx].description}"
        puts "----------------------------------------------"
    end

    def print_priority
        print_full_item(0)
    end

    def up(idx, amount)
        return false if !valid_index?(idx)
        i = idx
        count = 0
        while count < amount
            swap(i - 1, i)
            count += 1
            i -= 1
        end
        true
    end

    def down(idx, amount)
        return false if !valid_index?(idx)
        i = idx
        count = 0
        while count < amount
            swap(i, i + 1)
            count += 1
            i += 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

end