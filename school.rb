chooseIndex = 0

#Funcion usada para leer la información de "students.csv"
def read_students(file_name)
    file = File.open(file_name, 'r') #Abre el archivo
    students = file.readlines.map(&:chomp).map { |lines| lines.split(', ') } #Separa el contenido del archivo en arrays
    file.close #Cierra el archivo
    students #Crea un array "students"
end

#Funcion 1 - Calculo de promedio de cada alumno
def student_average
    puts "---------------------------------------"
    puts "      ALUMNOS Y SU PROMEDIO:      "
    puts " "
    students = read_students("students.csv")
    students.each do |array|
        #Reinicia el valor a 0 cuando cambia de Array
        grades_total = 0
        #Reinicia la cantidad de notas cuando cambia de Array
        amount = 0
        array.each_with_index do |element, index|
            #Si tiene una "A" de inasistencia se reemplaza con un 0
            element = 0 if(element == "A")
            if(index == 0)
                print "#{element.upcase}:  "
            elsif(index != 0)
                grades_total += element.to_f
                amount += 1
            end
        end
        puts grades_total / amount
        puts " "
    end
    puts "---------------------------------------"
    chooseIndex = 0
end

#Funcion 2 - Alumnos + Examenes a los que no asistieron
def student_misses
    puts "---------------------------------------"
    puts "      ALUMNOS Y SUS INASISTENCIAS:        "
    puts " "
    students = read_students("students.csv")
    students.each do |array|
        #Total de inasistencias, se reinicia con cada array
        misses_total = 0
        array.each_with_index do |element, index|
            if(index == 0)
                print "#{element.upcase}:  "
            elsif(index != 0 && element == "A")
                misses_total += 1
            end
        end
        puts "tiene #{misses_total} inasistencias"
        puts " "
    end
    puts "---------------------------------------"
    chooseIndex = 0
end

#Funcion 3 - Calculo de alumnos aprobados
def student_approved
    #Se le pide al usuario ingresar una nota (minimum_grade) para sabre si los alumnos aprobaron
    puts "---------------------------------------"
    puts "Ingrese un nota mínima: (Entre 1 y 10)"
    minimum_grade = gets.chomp.to_f
    #Ambos "if" asignan un 5 por defecto en caso de que el usuario ingrese un string o un numero invalido
    puts "Invalido, usando 5 por defecto" if(minimum_grade > 10 || minimum_grade < 1)
    minimum_grade = 5 if(minimum_grade > 10 || minimum_grade < 1)
    #Calculo de promedio y de alumnos que aprobaron en base al numero ingresado
    puts "  Alumnos que aprobaron con nota sobre #{minimum_grade}:  "
    students = read_students("students.csv")
    students.each do |array|
        #Reinicia la suma de las notas despues de cada cambio de array
        grades_total = 0
        #Reinicia el total de notas para cada calculo de promedio despues de cambiar de array
        amount = 0
        array.each_with_index do |element, index|
            #Si tiene una inasistencia se reemplaza por un 0
            element = 0 if(element == "A")
            if(index != 0)
                grades_total += element.to_f
                amount += 1
            end
        end
        #Calcula el promedio y lo guarda en la variable local "average"
        average = grades_total / amount
        #Muestra los alumnos que hayan aprobado con nota "average" superior a "minimum_grade"
        puts "#{array[0]} aprobó con promedio #{average}" if(average >= minimum_grade)
    end
    puts "---------------------------------------"
    chooseIndex = 0
end

#MENU, WHILE THE CONDITION REMAINS TRUE, THE USER WILL BE ABLE TO INPUT A NUMBER OVER AND OVER
while(chooseIndex != 4)
    puts
    puts "      Elija una opción        "
    puts
    puts "1) Ver alumno + promedio de sus notas"
    puts "2) Ver alumno + inasistencias"
    puts "3) Ver alumnos aprobados"
    puts
    puts "4) Salir"
    chooseIndex = gets.chomp.to_i

    case chooseIndex
        when(1)
            student_average
        when(2)
            student_misses
        when(3)
            student_approved
        when(321)
            puts read_students("students.csv")
        when(4)
            puts "Adiós"
        else
            puts "Opción no váilda, intenta de nuevo"
    end
end