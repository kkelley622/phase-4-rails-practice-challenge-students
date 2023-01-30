class StudentsController < ApplicationController

    before_action :find_student, only: [:show, :update, :destroy]

    def index 
        students = Student.all
        render json: students, status: :ok 
    end 

    def show 
        render json: @student, status: :ok 
    end

    def create 
        student = Student.create!(student_params)
        render json: student, status: :created 
    end

    def update
        @student.update!(student_params)
        render json: @student, status: 202
    end

    def destroy 
        @student.destroy 
        head :no_content 
    end


    private 

    def find_student 
        @student = Student.find(params[:id])
    end

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end
end
