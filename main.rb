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

    def to_s
            "nombre: #{@nombre}" + ", " +
            "dni: #{@dni}" + ", " +
            "apellido: #{@apellido}" + ", " +
            "provincia: #{@provincia}" + ", " +
            "ciudad: #{@ciudad}" + ", " +
            "calle: #{@calle}" + ", " +
            "altura: #{@altura}" + ", " +
            "mascota: #{@nombreMascota}" + ", " +
            "raza: #{@raza}"
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
        i = rand(5)
        persona.agregarMascota(mascota[i].nombre, mascota[i].raza)
    end
    array
end

personas = crearPersona(datos)
personas = asignaMascota(personas, mascotas)

file = File.open("personas.txt", 'w')
personas.each do |persona|
    file.write(persona)
    file.write("\n")
end
file.close
