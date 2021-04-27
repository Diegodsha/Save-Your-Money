module GroupsHelper
    def display_eye(expense)
        if current_user == expense.author
            render 'eye'
        end
    end

    def display_modify(group)
        if current_user == group.user
            render 'modify'
        end
    end
    
    
end
