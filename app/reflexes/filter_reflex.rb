# frozen_string_literal: true
require 'pry'

class FilterReflex < ApplicationReflex
  def filter_type
    @events = Event.game_type_filter(element.dataset[:gametype])
    # binding.pry
  end
end
