# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :tag => :div, :class => :clearfix,
                   :error_class => :error do |b|
    b.use :placeholder
    b.use :label
    b.use :tag => :div, :class => :input do |ba|
      ba.use :input
      
      ba.use :error, :tag => :span, :class => :inputError
      ba.use :hint,  :tag => :span, :class => "help-block"
    end
  end
end
