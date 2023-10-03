datos = [ {:name => 'John', 
    :dni => 2314151, 
    :apellido => 'Salchichon',
    :provincia => "santa fe",
    :ciudad => "San lorenzo",
    :calle => "San martin",
    :altura => 123},
    
  {:name => 'Arco', 
    :dni => 1245124, 
    :apellido => 'Salomon',
    :provincia => "santa fe",
    :ciudad => "Rosario",
    :calle => "Ubunto",
    :altura => 1234}
]


class Mascota
  attr_accessor :nombre, :raza

  def initialize(nombre, raza)
    @nombre = nombre
    @raza = raza
  end

end

mascotas = [Mascota.new("Manolo", "Yorkshire")]
mascotas.push(Mascota.new("Junior", "Labrador")) 
mascotas.push(Mascota.new("Cobe","Border collie")) 
mascotas.push(Mascota.new("Ringo","Caniche")) 
mascotas.push(Mascota.new("Hercules", "Yorkshire"))

