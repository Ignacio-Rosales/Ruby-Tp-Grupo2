
require 'yaml'

datos = [ {:nombre => 'John', 
    :dni => 2314151, 
    :apellido => 'Salchichon',
    :provincia => "Santa fe",
    :ciudad => "San lorenzo",
    :calle => "San martin",
    :altura => 123},
    
  {:nombre => 'Arco', 
    :dni => 1245124, 
    :apellido => 'Salomon',
    :provincia => "Santa fe",
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
    array.each_with_index do |persona, indice|
        indice == 0 ? i = 0: masc = array[indice -1].nombreMascota
        i = rand(7)
        if mascota[i].nombre == masc
            i==6 ? i= rand(6) : i += 1
        end
        persona.agregarMascota(mascota[i].nombre, mascota[i].raza)
    end
    array
end

personas = crearPersona(datos)
personas = asignaMascota(personas, mascotas)
pers = Array.new
personas.each do |persona|
    pers.push("Personas con mascotas asignadas" + "\n" +
    "Nombre: #{persona.nombre}" + "\n" +
    "Dni: #{persona.dni}" + "\n" +
    "Apellido: #{persona.apellido}" + "\n" +
    "Provincia: #{persona.provincia}" + "\n" +
    "Ciudad: #{persona.ciudad}" + "\n" +
    "Calle: #{persona.calle}" + "\n" +
    "Altura: #{persona.altura}" + "\n" + 
    "Nombre mascota: #{persona.nombreMascota}" + "\n" +
    "Raza: #{persona.raza}")
end
file = File.open("personas.txt", 'w')
yaml = YAML::dump(pers)
file.write(yaml)
file.close
