module ItemsHelper

  def condition_select_options
    r = []
    Item.available_conditions.each_with_index do |c, idx|
      r << [c, idx]
    end
  end
end
