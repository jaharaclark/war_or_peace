require './lib/card.rb'

class CardGenerator
    attr_reader :file_name
    def initialize(file_name)
        @file_name = file_name
    end

    def create_card
        command = File.readlines(@file_name)
        command.inject([]) do |empty_container, line|
            each_line = line.chomp.split','
            empty_container << Card.new(each_line[0].strip.to_sym, each_line[1].strip.to_s, each_line[2].to_i)
        end
    end
end