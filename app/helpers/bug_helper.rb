# module BugHelper
#   def priority_color(priority)
#     case priority.downcase
#     when 'low'
#       '#d3f7ba' # Light green
#     when 'medium'
#       '#fff9b8' # Light yellow
#     when 'high'
#       '#ffb8b8' # Light red
#     else
#       '#ffffff' # Default color
#     end
#   end
# end
module BugHelper
  def priority_color(priority)
    case priority.downcase
    when 'low'
      { color: '#d3f7ba', icon: 'fa-check-circle' }
    when 'medium'
      { color: '#fff9b8', icon: 'fa-exclamation-circle' }
    when 'high'
      { color: '#ffb8b8', icon: 'fa-times-circle' }
    else
      { color: '#ffffff', icon: 'fa-question-circle' }
    end
  end
end
