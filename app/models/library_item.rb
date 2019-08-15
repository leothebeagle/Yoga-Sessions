class LibraryItem < ApplicationRecord
    belongs_to :student 
    belongs_to :program


    def self.mark_as_favorite(student, program)
        student_program = student.library_items.find_by(program_id: program.id)
        student_program.update(favorited: true)
    end

    def self.unmark_as_favorite(student, program)
        student_program = student.library_items.find_by(program_id: program.id)
        student_program.update(favorited: false)
    end

end
