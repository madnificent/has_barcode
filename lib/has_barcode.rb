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
    # Finds an object, when the barcode is given.
    # barcode must be an object that returns a number when to_i calling to_i on it
    def find_by_barcode( barcode )
      find( barcode.to_i / 1000 )
    end
  end
  
  module InstanceMethods
    # The magical method
    def barcode
      Barby::Code128C.new( (self.id * 1000).to_s )
    end
  end

end
