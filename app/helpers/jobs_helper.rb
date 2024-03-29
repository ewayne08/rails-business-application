module JobsHelper

    def display_index_header
        if @company 
        content_tag(:h1, "#{@company.title}  Jobs")
        else 
        content_tag(:h1, "All Jobs")
        end 
   end
    def display_new_header
        if @company
        content_tag(:h1, "Create a #{@company.title} Job")
        else 
        content_tag(:h1, "Create a Job")
        end 
   end
    def job_form_fields(f)
        if @company   
         f.hidden_field :job_id, value: @company.id 
        else 
         render partial: "company_fields", locals: { f: f } 
        end 
    end

end