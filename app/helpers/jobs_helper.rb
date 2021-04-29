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
    def book_form_fields(f)
        if @company   # params[:brand_id]
         f.hidden_field :book_id, value: @company.id 
        else 
         render partial: "company_fields", locals: { f: f } 
        end 
    end

end