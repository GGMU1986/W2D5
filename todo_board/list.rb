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
    end

end