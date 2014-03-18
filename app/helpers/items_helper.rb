module ItemsHelper

  def condition_select_options
    r = []
    Item.available_conditions.each do |c|
      r << [c, c]
    end
  end
end
