module ApplicationHelper

  # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title = '')                     # Method def, optional arg
    base_title = "Rambutan Stationery MS"  # Variable assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      page_title + " | " + base_title                 # String concatenation
    end
  end

  def determine_transaction_type(stationery)
    if stationery.borrowable?
        "Borrow"
    elsif stationery.fixed?
        "Use"
    else
        "Take"
    end
  end

  def determine_expired_date(date_time_obj)
    due = date_time_obj + 2
    if due.saturday?
        due += 2
    elsif due.sunday?
        due += 1
    end
    due.change({ hour: 18 })
  end 

  def needs_expired_date(a_stationery)
    if a_stationery.borrowable?
      determine_expired_date(DateTime.now)
    elsif a_stationery.fixed?
      a = DateTime.now
      a.change({ hour: 18 })
    else
      nil
    end
  end

  def no_outstanding_fines?
    if logged_in?
      late_items = Transaction.where("user_id = ? AND return_details = true AND return_date IS NULL 
                                      AND expired_date < now()", current_user.id)
      return (late_items.count == 0)
    else
      return true
    end
  end

  def calculate_fines
    fine_rate = 2
    if logged_in?
      late_items = Transaction.where("user_id = ? AND return_details = true AND return_date IS NULL 
                                      AND expired_date < now()", current_user.id)
      return late_items.count * fine_rate
    end
  end

  def get_date_string(date_time_obj)
    DateTime.parse(date_time_obj.to_s).strftime("%l:%M %p, %e %B %Y")
  end

  def options_from_enum_for_select(instance, enum)
    options_for_select(enum_collection(instance, enum), instance.send(enum))
  end
  
  def enum_collection(instance, enum)
    instance.class.send(enum.to_s.pluralize).keys.to_a.map { |key| [key.humanize, key] }
  end
end