datos = [ 
    {:nombre => 'John', 
        :dni => 2314151, 
        :apellido => 'Lennon',
        :provincia => "Santa fe",
        :ciudad => "San lorenzo",
        :calle => "San martin",
        :altura => 123},
    {:nombre => 'Arco', 
        :dni => 1245124, 
        :apellido => 'Salomon',
        :provincia => "santa fe",
        :ciudad => "Rosario",
        :calle => "Ubunto",
        :altura => 987},
    {:nombre => 'Saruman', 
        :dni => 7643789, 
        :apellido => 'Salomon',
        :provincia => "Buenos aires",
        :ciudad => "Capital",
        :calle => "Liniers",
        :altura => 5493},
    {:nombre => 'Frodo', 
        :dni => 1245124, 
        :apellido => 'Baggins',
        :provincia => "Arthedain",
        :ciudad => "La comarca",
        :calle => "Bolson cerrado",
        :altura => 3}
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

def creacionMascotas
    mascotas = [Mascota.new("Manolo", "Yorkshire")]
    mascotas.push(Mascota.new("Junior", "Labrador")) 
    mascotas.push(Mascota.new("Cobe","Border collie")) 
    mascotas.push(Mascota.new("Ringo","Caniche"))
    mascotas.push(Mascota.new("Hercules", "Yorkshire"))
end

mascotas = creacionMascotas()

def crearPersona(arregloDatos)
    personas = Array.new
    arregloDatos.each do |dato|
        nom = dato[:nombre]
        dni = dato[:dni]
        apel = dato[:apellido]
        prov = dato[:provincia]
        ciud = dato[:ciudad]
        calle = dato[:calle]
        altura = dato[:altura]
        personas.push(Persona.new(nom, dni, apel, prov, ciud, calle, altura))
    end
    personas
end

def asignaMascota(arrayPersonas, mascotasExistentes)
    buffer = 9
    arrayPersonas.each_with_index do |persona, i|
        if i == 0 
            buffer = rand(5)
            persona.agregarMascota(mascotasExistentes[buffer].nombre, mascotasExistentes[buffer].raza)
        else
            numero = rand(4)
            mascotaSinRepetir = mascotasExistentes.dup
            mascotaSinRepetir.delete_at(buffer)
            persona.agregarMascota(mascotaSinRepetir[numero].nombre, mascotaSinRepetir[numero].raza)
            if numero < buffer
                buffer = numero
                # si el numero es menor al buffer, no tenemos problemas
            else numero >= buffer
                buffer = numero + 1
                # tendriamos que ajustar el hecho de eliminar uno de los datos del array
            end
        end
    end
    arrayPersonas
end

require 'yaml'

personas = crearPersona(datos)

personas = asignaMascota(personas, mascotas)

def serializar(arrayPersonas)
    personas = Array.new
    arrayPersonas.each do |persona|
        personas.push("nombre: #{persona.nombre}" + "\n" +
        "dni: #{persona.dni}" + "\n" +
        "apellido: #{persona.apellido}" + "\n" +
        "provincia: #{persona.provincia}" + "\n" +
        "ciudad: #{persona.ciudad}" + "\n" +
        "calle: #{persona.calle}" + "\n" +
        "altura: #{persona.altura}" + "\n" + 
        "mascota: #{persona.nombreMascota}" + "\n" +
        "raza: #{persona.raza}")
    end
    personas
end

def escritura(arrayPersonas)
    begin 
        file = File.open("personas.txt", 'w')
        yaml = YAML::dump(serializar(arrayPersonas))
        file.write(yaml)
    rescue NameError => error
        puts"Ocurrio un error en nombres o variables\t" + error.message
    rescue FileNotFoundError => error
        puts "No se encontro el archivo que desea\t" + error.message
    rescue IOError => error
        puts "Error al escribir el archivo\t" + error.message
    rescue StandardError => error
        puts "Ocurrio un error no contemplado\t" + error.message
    end
    file.close
end

escritura(personas)