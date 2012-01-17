module RecommendationsHelper
  
  def recommendation_nominee_label(award)
      if Award.store_award?(award)
        "Store Name Being Recommended"
      elsif Award.open_award?(award)
        "Associate/Store Name Being Recommended"
      else
        "Associate Name Being Recommended"
      end
  end
  
  def recommendation_title_label(award)
      if Award.store_award?(award)
        "Store #"
      elsif Award.open_award?(award)
        "Store Number Being Recommended"
      else
        "Job Title"
      end
  end
  
  def recommendation_dept_label(award)
       if Award.store_award?(award)
         "Store Manager Name"
       elsif Award.director_award?(award)   
         "District Name"
       elsif Award.open_award?(award)
         "Job Title or Store Manager Name"
       else
         "Department/Store #/Store Name:"
       end
  end
  
  def recommendation_label_label(award)
      if Award.store_award?(award)
        "store"
      elsif Award.director_award?(award)
        "	associate or store"
      else
        "associate"
      end
  end
  
end
