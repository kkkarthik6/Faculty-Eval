class PeopleController < ApplicationController
    def index
      @q = Person.ransack(params[:q])
      @people = @q.result(distinct: true)

    end
    def show
        @person = Person.find(params[:id])
    end
    def new
        @person = Person.new
        authorize :person
    end
    def edit
        @person = Person.find(params[:id])
        authorize :person
    end
    def create
   # render plain: params[:person].inspect
      @person = Person.new(person_params)
      @person.department = Department.find(params[:department_id])
      @person.add_role(:user, Department.find(params[:department_id]))
      authorize :person
      render json: {success: @person.save, person: @person}
    end

    def update
        @person = Person.find(params[:id])
        authorize :person
        if @person.update(person_params)
            redirect_to @person
        else
            render 'edit'
        end
    end
    def destroy
        @person = Person.find(params[:id])
        authorize :person
        @person.destroy
        redirect_to people_path
    end
    def usersearch
      q = params[:query]
      d = Department.find params[:department_id]
      p = Person.where(department_id: params[:department_id]).where("lower(last_name) LIKE lower('%#{q}%')")
      p.each do |p|
        if p.has_role? :department_admin, d
          p.dept_admin = true
        end
      end
      render json: p, methods: :dept_admin
    end
    def makeadmin
      p = Person.find(params[:person_id])
      d = Department.find(params[:department_id])
      p.add_role(:department_admin, d)
      render json: { success: true, person: p }
    end
    def revokeadmin
      p = Person.find(params[:person_id])
      d = Department.find(params[:department_id])
      p.remove_role(:department_admin, d)
      render json: { success:true }
    end

    private
      def person_params
          params.permit(:person, :query, :first_name, :last_name, :net_id, :banner_id, :position, :colleges_id, :college_id, :department_id)
      end
end
