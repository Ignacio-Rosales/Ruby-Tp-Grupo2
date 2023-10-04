
require 'yaml'

datos = [ {:nombre => 'John', 
    :dni => 2314151, 
    :apellido => 'Salchichon',
    :provincia => "santa fe",
    :ciudad => "San lorenzo",
    :calle => "San martin",
    :altura => 123},
    
  {:nombre => 'Arco', 
    :dni => 1245124, 
    :apellido => 'Salomon',
    :provincia => "santa fe",
    :ciudad => "Rosario",
    :calle => "Ubunto",
    :altura => 1234}
]

class Persona
    attr_accessor :nombre, :dni, :apellido, :provincia, :ciudad, :calle, :altura, :nombreMascota, :raza
    
    def initialize(nombre, dni, apellido, provincia, ciudad, calle, altura)
        @nombre = nombre
        @dni = dni
        @apellido = apellido
        @provincia = provincia
        @ciudad = ciudad
        @calle = calle
        @altura = altura
    end


    def agregarMascota(nombre, raza)
        @nombreMascota = nombre
        @raza = raza
    end

end

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
mascotas.push(Mascota.new("India", "Pastor aleman"))
mascotas.push(Mascota.new("Colo", "pitbull"))

def crearPersona(a)
    per = Array.new
    a.each do |dato|
        n, d, a, pro, ci, ca , al = dato.values
        per.push(Persona.new(n, d, a, pro, ci, ca , al))
    end
    per
end

def asignaMascota(array, mascota)
    array.each do |persona|
        i = rand(7)
        persona.agregarMascota(mascota[i].nombre, mascota[i].raza)
    end
    array
end

personas = crearPersona(datos)
personas = asignaMascota(personas, mascotas)
pers = Array.new
personas.each do |persona|
    pers.push("nombre: #{persona.nombre}" + "\n" +
    "dni: #{persona.dni}" + "\n" +
    "apellido: #{persona.apellido}" + "\n" +
    "provincia: #{persona.provincia}" + "\n" +
    "ciudad: #{persona.ciudad}" + "\n" +
    "calle: #{persona.calle}" + "\n" +
    "altura: #{persona.altura}" + "\n" + 
    "mascota: #{persona.nombreMascota}" + "\n" +
    "raza: #{persona.raza}")
end
file = File.open("personas.txt", 'w')
yaml = YAML::dump(pers)
file.write(yaml)


# file.write("personas.txt", personas)
# file.close

# puts Object.methods
