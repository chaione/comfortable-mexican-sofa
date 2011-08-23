class Cms::Category < ActiveRecord::Base
  
  set_table_name :cms_categories
  
  # -- Relationships --------------------------------------------------------
  has_many :categorizations,
    :dependent => :destroy
    
  # -- Validations ----------------------------------------------------------
  validates :label,
    :presence   => true,
    :uniqueness => true
  validates :categorized_type,
    :presence   => true
    
  # -- Scopes ---------------------------------------------------------------
  default_scope order(:label)
  scope :of_type, lambda { |type|
    where(:categorized_type => type)
  }
  
end