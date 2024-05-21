# app/services/bug_assignment_service.rb

class BugAssignmentService
  attr_reader :current_user, :params

  def initialize(current_user, params)
    @current_user = current_user
    @params = params
  end

  def call
    @bug = Bug.find(params[:id])
    bug_user_id = params[:bug][:user_id].to_i

    if authorized_to_assign?(bug_user_id)
      update_bug_user(bug_user_id)
      return true
    else
      return false
    end
  end

  private

  def authorized_to_assign?(bug_user_id)
    current_user.role.name == 'manager' || current_user.id == bug_user_id
  end

  def update_bug_user(bug_user_id)
    @bug.update(user_id: bug_user_id)
  end
end
