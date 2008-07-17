module HasBarcode
  
  def self.included(mod)
    mod.extend(ClassMethods)
  end
  
  module ClassMethods
    def has_barcode
      require 'barby'
      require 'barby/outputter/rmagick_outputter'
      extend HasBarcode::SingletonMethods
      include HasBarcode::InstanceMethods
    end
  end
  
  module SingletonMethods
    # No singletonmethods yet
  end
  
  module InstanceMethods
    # The magical method
    def barcode
      Barby::Code128C.new( (self.id * 1000).to_s )
    end
  end

end
