chooseIndex = 0

def read_students(file_name)
    file = File.open(file_name, 'r')
    students = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    students
end

def student_average
    puts "---------------------------------------"
    puts "-----ALUMNOS Y SU PROMEDIO:       -----"
    puts " "
    students = read_students("students.csv")
    students.each do |array|
        grades_total = 0
        amount = 0
        array.each_with_index do |element, index|
            if(element == "A")
                element == 0
            end
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


while(chooseIndex != 4)
    puts "Elija una opción"
    puts "1) Ver alumno + promedio de sus notas"
    puts "2) Ver alumno + inasistencias"
    puts "3) Ver alumnos aprobados"
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

