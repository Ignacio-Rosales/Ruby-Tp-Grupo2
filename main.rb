datos = [ 
    {
        name => "John", 
        dni => 2314151, 
        apellido => "Salchichon",
        provincia => "santa fe",
        ciudad => "San lorenzo",
        calle => "San martin",
        altura => 123
    },

    {
        name => "Arco", 
        dni => 1245124, 
        apellido => 'Salomon',
        provincia => "santa fe",
        ciudad => "Rosario",
        calle => "Ubunto",
        altura => 1234
    }
]


class Persona
    attr_accessor :nombre, :dni, :apellido, :provinica, :ciudad, :calle, :altura
    
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